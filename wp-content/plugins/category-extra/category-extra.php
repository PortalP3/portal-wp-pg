<?php
/*
Plugin Name: Category Extra
Description: Plugin extends capabilities of the categories, taxonomies and tags
Version: 1.0.2
Author: AGriboed
Text Domain: category-extra
Domain Path: /languages/
Author URI: https://v1rus.ru/
License: GPL2
*/
namespace AGriboed;
define('CATEGORYEXTRA', 'category-extra');

class CategoryExtra
{
    /**
     * @var null
     */
    private static $_instance=null;
    private $term;
    private $_options=array(), $_entered_passwords=array();

    public static function instance()
    {
        if (is_null(self::$_instance))
            self::$_instance=new self();
        return self::$_instance;
    }

    /**
     *  Prevent from creating more than one instance
     */
    private function __construct()
    {
        add_action('admin_init', array(&$this, 'admin_init'), 1);
        add_action('admin_menu', array(&$this, 'add_options_page'));
        add_action('init', array(&$this, 'postCategoryPassword'), 10, 1);
        add_action('wp_head', array(&$this, 'wp_head'), 1);
        add_filter('plugin_action_links_' .
                plugin_basename(__FILE__), array($this, 'plugin_action_links_filter'), 10, 2);
        add_filter('get_terms', array(&$this, 'get_terms_filter'), 10, 3);
        add_filter('get_term', array(&$this, 'get_term_filter'), 10, 3);
        add_filter('list_cats', array(&$this, 'list_cats_filter'), 10, 3);
        add_filter('single_cat_title', array(&$this, 'single_cat_title_filter'), 10, 3);
        add_filter('pre_get_document_title', array(&$this, 'pre_get_document_title_filter'), 10, 2);
        add_filter('the_category_list', array(&$this, 'the_category_list_filter'), 10, 3);
        add_filter('template_redirect', array(&$this, 'template_redirect_filter'), 10, 3);

        $this->wp_roles=\wp_roles();
        $this->_getOptions();
    }

    public function admin_init()
    {
        load_plugin_textdomain('category-extra', '', trailingslashit(plugin_basename(WP_PLUGIN_DIR .
                        '/category-extra/')) .
                'languages');

        add_action('edit_category_form_fields', array(&$this, 'term_form'));
        add_action('edit_tag_form_fields', array(&$this, 'term_form'));

        foreach ($this->_options['enabled'] as $taxonomy)
            add_action('edited_' . $taxonomy, array(&$this, 'term_save'), 10, 2);
    }

    /**
     * Edit links that appear on installed plugins list page, for our plugin.
     */
    public function plugin_action_links_filter($links)
    {
        // We shouldn't encourage editing our plugin directly.
        unset($links['edit']);

        // Add our custom links to the returned array value.
        return array_merge(array(
                '<a href="' .
                admin_url('options-general.php?page=category-extra') .
                '">' .
                __('Settings', 'category-extra') .
                '</a>',
        ), $links);
    }

    public function get_terms_filter($terms, $taxonomies, $args)
    {
        $terms=$this->parseTerms($terms);
        return $terms;
    }

    public function get_term_filter($term, $taxonomy)
    {
        return $this->_getTerm($term);
    }

    public function single_cat_title_filter($term_name='')
    {
        $this->_getTerm(get_queried_object());
        return !empty($this->term->name) ? $this->term->name : $term_name;
    }

    public function the_category_list_filter($categories, $post)
    {
        foreach ($categories as $key=>$term) {
            if (isset($term->hide))
                unset($categories[$key]);
        }

        return $categories;
    }

    public function list_cats_filter($term_name, $term=false)
    {
        if (empty($term->meta['color_name']) && empty($term->meta['background_color']))
            return $term_name;

        $return='';
        $return.='<span class="category-name" style="';

        if (!empty($term->meta['color_name']))
            $return.='color: ' . $term->meta['color_name'] . ';';

        if (!empty($term->meta['color_background']))
            $return.='background: ' . $term->meta['color_background'] . ';';

        $return.='">' . $term_name . '</span>';

        return $return;
    }

    public function template_redirect_filter()
    {
        global $current_user, $wp_query;

        if (is_category() || is_tax() || is_tag()) {
            $term=$wp_query->queried_object;

            if (isset($term->meta)) {
                if ($current_user->ID == 0 && in_array('guest', $term->meta['hide']))
                    $wp_query->set_404();

                foreach ($current_user->roles as $role)
                    if (in_array($role, $term->meta['hide'])) {
                        $wp_query->set_404();
                    }
            }
        }
    }

    public function pre_get_document_title_filter($title)
    {
        global $wp_query;
        if (is_category() || is_tag() || is_tax()) {
            $term=$wp_query->get_queried_object();
            if (!empty($term->meta['title']))
                return htmlspecialchars($term->meta['title']);
        }
    }

    public function wp_head()
    {
        global $wp_query;

        if (is_category() || is_tag() || is_tax()) {
            $term=$wp_query->get_queried_object();

            if (!empty($term->meta['description']))
                echo "<meta name=\"description\" content=\"" . htmlspecialchars($term->meta['description']) . "\" />\n";

            if (!empty($term->meta['keywords']))
                echo "<meta name=\"keywords\" content=\"" . htmlspecialchars($term->meta['keywords']) . "\" />\n";
        }
    }

    public function postCategoryPassword()
    {
        if (!empty($_POST[CATEGORYEXTRA . '_password']) && !empty($_POST[CATEGORYEXTRA . '_category'])) {
            setcookie(CATEGORYEXTRA . (int)$_POST[CATEGORYEXTRA . '_category'], md5($_POST[CATEGORYEXTRA . '_password']), time() + $this->_options['store_password']);
            $this->_entered_passwords[(int)$_POST[CATEGORYEXTRA . '_category']]=md5($_POST[CATEGORYEXTRA . '_password']);
        }
    }

    public function checkCategoryPassword()
    {
        global $wp_query;
        $this->_getTerm(get_queried_object());
        $term_password=isset($this->term->meta['password']) ? $this->term->meta['password'] : false;

        if (!empty($term_password)) {
            if (isset($_COOKIE[CATEGORYEXTRA . $this->term->term_id]) &&
                    ($_COOKIE[CATEGORYEXTRA . $this->term->term_id] == md5($term_password))
            )
                return;

            if (isset($this->_entered_passwords[$this->term->term_id]) &&
                    ($this->_entered_passwords[$this->term->term_id]) == md5($term_password)
            )
                return;

            $wp_query->post_count=0;
            $pluginname=CATEGORYEXTRA;
            $message=!empty($this->_options['password_message']) ? $this->_options['password_message'] : __('To see this category you need enter the password:');
            $submit=__('Submit');
            if (isset($_POST[CATEGORYEXTRA . '_category']) && isset($_POST[CATEGORYEXTRA . '_password']))
                $message=__('Password not valid');

            echo <<<HTML
<form action="" method="post" class="category-extra-password">
{$message}
<input type="hidden" name="{$pluginname}_category" value="{$this->term->term_id}">
<input type="password" name="{$pluginname}_password" value="">
<input type="submit" value="{$submit}">
</form>
HTML;
        }
    }

    private function _getTerm($term)
    {
        if (!$term)
            return false;

        if (!$this->checkTaxonomyEnabled($term->taxonomy))
            return $term;

        $this->term=$term;

        $this->_termMeta()
                ->_parseMeta()
                ->_parseTerm();

        return is_object($this->term) ? $this->term : $term;
    }

    private function _termMeta()
    {
        $this->term->meta=self::getTermMeta($this->term);
        return $this;
    }

    private function _parseMeta()
    {
        $this->term->meta=self::parseMeta($this->term->meta);
        return $this;
    }

    private function _parseTerm()
    {
        $this->term=self::parseTerm($this->term);
        return $this;
    }

    private function _getOptions()
    {
        $this->_options=array();
        $this->_options['enabled']=json_decode(get_option('category-extra_enabled'), true);
        $this->_options['password_message']=get_option('category-extra_password_message');
        $this->_options['store_password']=get_option('category-extra_store_password');

        if (!$this->_options['store_password'])
            $this->_options['store_password'] = 0;

        if (empty($this->_options['enabled']))
            $this->_options['enabled']=array();
    }

    public static function checkHideTerm($term)
    {
        return (isset($term->hide) && $term->hide) ? true : false;
    }

    public function checkTaxonomyEnabled($taxonomy)
    {
        $taxonomy=is_object($taxonomy) ? $taxonomy->name : $taxonomy;
        return in_array($taxonomy, $this->_options['enabled']) ? true : false;
    }

    public function parseTerm($term)
    {
        global $current_user;

        if (!$term)
            return false;

        if (!isset($term->meta))
            return $term;

        if (isset($term->meta['sort']))
            $term->sort=$term->meta['sort'];

        if (!empty($term->meta['public_name']) && !is_admin())
            $term->name=$term->meta['public_name'];

        if (isset($term->meta['hide']) && is_array($term->meta['hide'])) {
            if (in_array('guest', $term->meta['hide']) && !is_user_logged_in())
                $term->hide=true;

            foreach ($current_user->roles as $role)
                if (in_array($role, $term->meta['hide']))
                    $term->hide=true;
        }

        return $term;
    }

    public static function getTermMeta($term)
    {
        global $wpdb;

        if (!is_object($term))
            return false;

        $cache_meta=wp_cache_get('category-extra_' . $term->term_id);

        if (!empty($cache_meta))
            return $cache_meta;

        $sql="SELECT * FROM " . $wpdb->prefix . "termmeta 
WHERE term_id='" . $term->term_id . "'";

        $results=$wpdb->get_results($sql);
        $meta=array();

        foreach ($results as $result)
            $meta[$result->meta_key]=$result->meta_value;

        wp_cache_set('category-extra_' . $term->term_id, $meta);

        return $meta;
    }

    public function getTermsMeta($ids=array())
    {
        global $wpdb;

        if (count($ids) === 0)
            return false;

        $last_element=$ids;
        $last_element=array_pop($last_element);

        $sql="SELECT * FROM " . $wpdb->prefix . "termmeta WHERE ";

        foreach ($ids as $id) {
            $sql.="term_id = '" . $id . "' ";
            if ($id != $last_element)
                $sql.=" OR ";
        }

        $results=$wpdb->get_results($sql);
        $meta=array();

        foreach ($results as $result)
            $meta[$result->term_id][$result->meta_key]=$result->meta_value;

        foreach ($meta as &$term_meta)
            $term_meta=self::parseMeta($term_meta);

        return $meta;
    }

    public static function parseMeta($meta=array())
    {
        if (!is_array($meta))
            return false;

        if (!isset($meta['hide']))
            $meta['hide']=array();
        else
            $meta['hide']=json_decode($meta['hide'], true);

        return $meta;
    }

    private function parseTerms($terms)
    {
        foreach ($terms as $key=>&$term) {
            $term=$this->parseTerm($term);

            if (self::checkHideTerm($term))
                unset($terms[$key]);
        }

        usort($terms, function ($a, $b) {
            if (!isset($b->sort) || $b->sort == 0 || !isset($a->sort))
                return 1;

            return ($a->sort - $b->sort);
        });

        return $terms;
    }

    public function termImage($begin='', $end='', $term=false, $echo=true)
    {
        if (!is_tax() && !is_tag() && !is_category() && !$term)
            return '';

        if (!$term)
            $term=get_queried_object();

        if (!$term)
            return '';

        $this->_getTerm($term);

        if (!empty($this->term->meta['image'])) {
            if ($echo)
                echo $begin . $term->meta['image'] . $end;
            else
                return $term->meta['image'];
        } else
            return '';
    }

    public function termTopText($term=false, $echo=true)
    {
        if (!is_tax() && !is_tag() && !is_category() && !$term)
            return '';

        if (!$term)
            $term=get_queried_object();

        if (!$term)
            return '';

        $this->_getTerm($term);

        if (!empty($this->term->meta['top_text'])) {
            if ($echo)
                echo $term->meta['top_text'];
            else
                return $term->meta['top_text'];
        } else
            return '';
    }

    public function termBottomText($term=false, $echo=true)
    {
        if (!is_tax() && !is_tag() && !is_category() && !$term)
            return '';

        if (!$term)
            $term=get_queried_object();

        if (!$term)
            return '';

        $this->_getTerm($term);

        if (!empty($this->term->meta['bottom_text'])) {
            if ($echo)
                echo $term->meta['bottom_text'];
            else
                return $term->meta['bottom_text'];
        } else
            return '';
    }

    public function term_form($term)
    {
        if (!$this->checkTaxonomyEnabled($term->taxonomy))
            return '';

        wp_enqueue_style('thickbox');
        wp_enqueue_script('thickbox');
        wp_enqueue_script('iris');
        $meta=$this->_getTerm($term)->meta;
        $wp_roles=wp_roles();
        ?>
        <input type="hidden" name="termmeta" value="1">
        <tr class="form-field">
            <th scope="row" valign="top"><label for="sort"><?php _e('Sort', 'category-extra'); ?><span
                            class="dashicons dashicons-editor-help"
                            title="<?php _e('Sorting category in list of categories', 'category-extra'); ?>"></span></label>
            </th>
            <td>
                <input type="number" id="sort" name="sort"
                       value="<?= (!empty($meta['sort'])) ? $meta['sort'] : '0'; ?>">
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="title"><?php _e('Custom title tag','category-extra'); ?><span
                            class="dashicons dashicons-editor-help"
                            title="<?php _e('Name of category in the <title></title> tag', 'category-extra'); ?>"></span></label>
            </th>
            <td>
                <fieldset>
                    <input type="text" id="title" name="title" value="<?php echo
                    !empty($meta['title']) ? esc_attr($meta['title']) : ''; ?>">
                </fieldset>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label
                        for="description"><?php _e('Custom description tag', 'category-extra'); ?>
                    <span
                            class="dashicons dashicons-editor-help"
                            title="<?php _e('Text in meta description tag. Recommended max 140 symbols', 'category-extra'); ?>"></span></label>
            </th>
            <td>
                <fieldset>
                    <input type="text" name="description" id="description"
                           value="<?php echo
                           !empty($meta['description']) ? esc_attr($meta['description']) : ''; ?>">
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label
                        for="keywords"><?php _e('Custom keywords tag', 'category-extra'); ?><span
                            class="dashicons dashicons-editor-help"
                            title="<?php _e('Text in meta keywords tag', 'category-extra'); ?>"></span></label></th>
            <td>
                <fieldset>
                    <input type="text" name="keywords" id="keywords"
                           value="<?php echo
                           !empty($meta['keywords']) ? esc_attr($meta['keywords']) : ''; ?>">
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label
                        for="public_name"><?php _e('Custom name for public', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Name of category for all public sections', 'category-extra'); ?>"></span>
                </label></th>
            <td>
                <fieldset>
                    <input type="text" name="public_name" id="public_name" value="<?php echo
                    !empty($meta['public_name']) ? esc_attr($meta['public_name']) : ''; ?>">
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="top_text"><?php _e('Top text', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Use <?php the_category_top_text(); ?> in your template', 'category-extra'); ?>"></span>
                </label></th>
            <td>
                <fieldset>
                    <?php wp_editor(html_entity_decode(!empty($meta['top_text']) ? $meta['top_text'] : '', ENT_QUOTES, 'UTF-8'), 'top_text', array('textarea_rows'=>'10', 'textarea_name'=>'top_text', 'teeny'=>false, 'wpautop'=>1)); ?>
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="bottom_text"><?php _e('Bottom text', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Use <?php the_category_bottom_text(); ?> in your template', 'category-extra'); ?>"></span>
                </label></th>
            <td>
                <fieldset>
                    <?php wp_editor(html_entity_decode(!empty($meta['bottom_text']) ? $meta['bottom_text'] : '', ENT_QUOTES, 'UTF-8'), 'bottom_text', array('textarea_rows'=>'10', 'textarea_name'=>'bottom_text', 'teeny'=>false, 'wpautop'=>1)); ?>
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="hide"><?php _e('Hide from', 'category-extra'); ?></label></th>
            <td>
                <fieldset>
                    <?php foreach ($wp_roles->roles as $role=>$value):
                        if ($role == 'administrator')
                            continue;
                        ?>
                        <label for="hide-<?php echo $role; ?>"><?php _e($value['name']); ?></label>
                        <input type="checkbox" name="hide[<?php echo $role; ?>]"
                               id="hide-<?php echo $role; ?>" <?php echo in_array($role, $meta['hide']) ? 'checked' : ''; ?>>
                    <?php endforeach; ?>
                    <label for="hide-guest"><?php _e('Guest'); ?></label>
                    <input type="checkbox" name="hide[guest]"
                           id="hide-guest" <?php echo in_array('guest', $meta['hide']) ? 'checked' : ''; ?>>
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="color_name"><?php _e('Category name color', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Add text color to category name', 'category-extra'); ?>"></span>
                </label></th>
            <td>
                <table class="category-image-table">
                    <tr>
                        <td>
                            <span class="color_destination"
                                  style="background:<?php echo (!empty($meta['color_background'])) ? $meta['color_background'] : 'none'; ?>;color:<?php echo (!empty($meta['color_name'])) ? $meta['color_name'] : 'none'; ?>"><?php echo $term->name; ?></span>
                        </td>
                        <td>
                            <input type="text" name="color_name" id="color_name"
                                   value="<?php echo !empty($meta['color_name']) ? $meta['color_name'] : ''; ?>">
                        </td>
                        <td>
                            <button class="select-color button" data-id="#color_name"
                                    data-toggle="close" data-destination=".color_destination"
                                    data-attr="color"><?php _e('Select', 'category-extra'); ?></button>
                            <button class="clear-color button"
                                    data-id="#color_name"><?php _e('Clear', 'category-extra'); ?></button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label
                        for="color_background"><?php _e('Category background color', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Add background color to category name', 'category-extra'); ?>"></span>
                </label>
            </th>
            <td>
                <table class="category-image-table">
                    <tr>
                        <td>
                            <span class="color_destination"
                                  style="background:<?php echo (!empty($meta['color_background'])) ? $meta['color_background'] : 'none'; ?>;color:<?php echo (!empty($meta['color_name'])) ? $meta['color_name'] : 'none'; ?>"><?php echo $term->name; ?></span>
                        </td>
                        <td>
                            <input type="text" name="color_background" id="color_background"
                                   value="<?php echo !empty($meta['color_background']) ? $meta['color_background'] : ''; ?>">
                        </td>
                        <td>
                            <button class="select-color button" data-id="#color_background"
                                    data-toggle="close" data-destination=".color_destination"
                                    data-attr="background"><?php _e('Select'); ?></button>
                            <button class="clear-color button"
                                    data-id="#color_background"><?php _e('Clear', 'category-extra'); ?></button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="password"><?php _e('Password access', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Add form with password on the category page', 'category-extra'); ?>"></span>
                </label></th>
            <td>
                <fieldset>
                    <input type="text" name="password" id="password"
                           value="<?php echo !empty($meta['password']) ? esc_attr($meta['password']) : ''; ?>"/>
                </fieldset>
            </td>
        </tr>
        <tr class="form-field">
            <th scope="row" valign="top"><label for="image"><?php _e('Image', 'category-extra'); ?>
                    <span class="dashicons dashicons-editor-help"
                          title="<?php _e('Use <?php the_category_image(\'\',\'\') ;?> in your template', 'category-extra'); ?>"></span>
                </label></th>
            <td>
                <fieldset>
                    <table class="category-image-table">
                        <tr>
                            <td>
                                <div class="category-image-preview">
                                    <?php if (!empty($meta['image'])): ?>
                                        <img src="<?php echo $meta['image']; ?>" alt="">
                                    <?php endif; ?>
                                </div>
                            </td>
                            <td>
                                <input type="text" name="image" id="image"
                                       value="<?php echo !empty($meta['image']) ? $meta['image'] : ''; ?>">
                            </td>
                            <td>
                                <button class="select-image button"><?php _e('Select', 'category-extra'); ?></button>
                                <button class="clear-image button"><?php _e('Clear', 'category-extra'); ?></button>
                            </td>
                        </tr>
                    </table>
                    <script type="text/javascript">
                        jQuery(function ($) {
                            var preview = $('.category-image-preview'),
                                    clear_image = $('button.clear-image'),
                                    select_image = $('button.select-image'),
                                    category_image = $('#image'),
                                    select_color = $('button.select-color'),
                                    clear_color = $('button.clear-color');

                            select_image.click(function (e) {
                                e.preventDefault();
                                var button = $(this),
                                        frame;

                                if (frame) {
                                    frame.open();
                                    return;
                                }
                                frame = wp.media();
                                frame.on("select", function () {
                                    var attachment = frame.state().get("selection").first();
                                    frame.close();
                                    category_image.val(attachment.attributes.url);
                                    preview.html('<img src="' + attachment.attributes.url + '" alt="">');
                                });
                                frame.open();
                            });

                            clear_image.click(function () {
                                preview.html('');
                                category_image.val('');
                                return false;
                            });

                            clear_color.click(function () {
                                var input = $(this).data('id');
                                $(input).val('');
                                return false;
                            });

                            select_color.click(function (e) {
                                e.preventDefault();
                                var button = $(this),
                                        id = button.data('id'),
                                        toggle = button.data('toggle'),
                                        destination = button.data('destination'),
                                        attr = button.data('attr');

                                $(id).iris({
                                    hide: true, change: function (event, ui) {
                                        $(destination).css(attr, ui.color.toString());
                                    }
                                });

                                if (toggle == 'close') {
                                    button.html('<?php _e('Close', 'category-extra');?>');
                                    button.data('toggle', 'show');
                                    $(id).iris('show');
                                }
                                else {
                                    button.html('<?php _e('Select', 'category-extra');?>');
                                    button.data('toggle', 'close');
                                    $(id).iris('hide');
                                }

                            });
                        });
                    </script>
                    <span class="description"></span>
                </fieldset>
            </td>
        </tr>
        <style>
            .category-image-preview img {
                max-width: 150px;
            }

            .category-image-table {
                width: 80%;
            }

            .category-image-table td {
                width: 30%;
                padding: 5px;
            }

            .category-image-table td:first-child {
                width: 30%;
            }

            .color_destination {
                padding: 5px;
            }

            .iris-picker {
                position: absolute;
            }
        </style>
        <?php
        return '';
    }

    public function term_save($term_id)
    {
        if (!isset($_POST['termmeta']) || ($_POST['termmeta'] != 1))
            return;

        if (isset($_POST['sort']))
            update_term_meta($term_id, 'sort', (int)$_POST['sort']);
        else
            update_term_meta($term_id, 'sort', 0);

        if (isset($_POST['title']))
            update_term_meta($term_id, 'title', esc_attr($_POST['title']));
        else
            update_term_meta($term_id, 'title', false);

        if (isset($_POST['description']))
            update_term_meta($term_id, 'description', esc_attr($_POST['description']));
        else
            update_term_meta($term_id, 'description', false);

        if (isset($_POST['keywords']))
            update_term_meta($term_id, 'keywords', esc_attr($_POST['keywords']));
        else
            update_term_meta($term_id, 'keywords', false);

        if (isset($_POST['public_name']))
            update_term_meta($term_id, 'public_name', esc_attr($_POST['public_name']));
        else
            update_term_meta($term_id, 'public_name', false);

        if (isset($_POST['top_text']))
            update_term_meta($term_id, 'top_text', $_POST['top_text']);
        else
            update_term_meta($term_id, 'top_text', false);

        if (isset($_POST['bottom_text']))
            update_term_meta($term_id, 'bottom_text', $_POST['bottom_text']);
        else
            update_term_meta($term_id, 'bottom_text', false);

        if (isset($_POST['color_name']))
            update_term_meta($term_id, 'color_name', $_POST['color_name']);
        else
            update_term_meta($term_id, 'color_name', false);

        if (isset($_POST['color_background']))
            update_term_meta($term_id, 'color_background', $_POST['color_background']);
        else
            update_term_meta($term_id, 'color_background', false);

        if (isset($_POST['hide'])) {
            $hide=array();

            foreach ($_POST['hide'] as $key=>$value)
                $hide[]=$key;

            update_term_meta($term_id, 'hide', json_encode($hide));
        } else
            update_term_meta($term_id, 'hide', json_encode(array()));

        if (isset($_POST['password']))
            update_term_meta($term_id, 'password', $_POST['password']);
        else
            update_term_meta($term_id, 'password', false);

        if (isset($_POST['image']))
            update_term_meta($term_id, 'image', $_POST['image']);
        else
            update_term_meta($term_id, 'image', false);
    }

    /**
     *    Admin menu hook, adds blogs local options page
     */
    public function add_options_page()
    {
        $page_slug=add_options_page(
                __('Category Extra', 'category-extra'), __('Category Extra', 'category-extra'),
                'manage_options', 'category-extra',
                array(&$this, 'render_options_page')
        );
    }

    /**
     *    Rendering the options page
     */
    public function render_options_page()
    {
        if (isset($_POST['save']) && $_POST['save'] == 1) {

            if (isset($_POST['enabled']) && is_array($_POST['enabled'])) {
                $option_name='category-extra_enabled';
                $option_value=json_encode($_POST['enabled']);

                if (get_option($option_name) !== false) {
                    update_option($option_name, $option_value);
                } else {
                    $deprecated=null;
                    $autoload='yes';
                    add_option($option_name, $option_value, $deprecated, $autoload);
                }
            }

            $option_name='category-extra_password_message';
            $option_value=$_POST['password_message'];

            if (get_option($option_name) !== false) {
                update_option($option_name, $option_value);
            } else {
                $deprecated=null;
                $autoload='yes';
                add_option($option_name, $option_value, $deprecated, $autoload);
            }

            $option_name='category-extra_store_password';
            $option_value=$_POST['store_password'];

            if (get_option($option_name) !== false) {
                update_option($option_name, $option_value);
            } else {
                $deprecated=null;
                $autoload='yes';
                add_option($option_name, $option_value, $deprecated, $autoload);
            }
            $this->_getOptions();
        }
        $plugin_link='options-general.php?page=category-extra';
        $taxonomies=get_taxonomies(array('public'=>true), 'objects');
        ?>
        <div class="wrap"><h1><?php _e('Category Extra'); ?></h1>
            <form action="<?php echo $plugin_link; ?>" method="post" class="settings-wrap">
                <input type="hidden" name="save" value="1">
                <table class="form-table">
                    <tbody>
                    <tr>
                        <th scope="row"><?php _e('Enable plugin to', 'category-extra'); ?></th>
                        <td>
                            <?php foreach ($taxonomies as $taxonomy) {
                                echo "<label for=\"" .
                                        $taxonomy->name .
                                        "\">" .
                                        $taxonomy->label .
                                        " </label>    <input id=\"" .
                                        $taxonomy->name .
                                        "\" name=\"enabled[]\" type=\"checkbox\" value=\"" .
                                        $taxonomy->name .
                                        "\" " . ($this->checkTaxonomyEnabled($taxonomy) ? 'checked' : '') . "><br>";
                            }
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label
                                    for="password_message"><?php _e('Enter password message', 'category-extra'); ?></label>
                        </th>
                        <td>
                            <input type="text" name="password_message" id="password_message"
                                   value="<?php echo !empty($this->_options['password_message']) ? $this->_options['password_message'] : ''; ?>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label
                                    for="store_password"><?php _e('Store the entered password in sec.', 'category-extra'); ?></label>
                        </th>
                        <td>
                            <input type="number" min="0" name="store_password" id="store_password"
                                   value="<?php echo $this->_options['store_password']; ?>">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <?php
                submit_button(null, 'primary', null, null, array('autocomplete'=>'off'));
                ?></form>
            <style>
                .form-table th {
                    width: 20%
                }
                .form-table td {
                    width: 60%
                }
            </style>
        </div>
        <?php
    }
}

CategoryExtra::instance();
include('functions.php');