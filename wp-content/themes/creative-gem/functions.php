<?php
/**
 * creative Lite functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package creative Lite
 */

if ( ! function_exists( 'creative_gem_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function creative_gem_setup() {

  // Add default posts and comments RSS feed links to head.
    add_theme_support( 'automatic-feed-links' );

  /*
   * Let WordPress manage the document title.
   * By adding theme support, we declare that this theme does not use a
   * hard-coded <title> tag in the document head, and expect WordPress to
   * provide it for us.
   */
  add_theme_support( 'title-tag' );

  /*
   * Enable support for Post Thumbnails on posts and pages.
   *
   * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
   */
  add_theme_support( 'post-thumbnails' );
  set_post_thumbnail_size( 150, 150, true );
  add_image_size( 'creative-gem-related', 200, 125, true ); //related

  // This theme uses wp_nav_menu() in one location.
  register_nav_menus( array(
    'primary' => esc_html__( 'Primary', 'creative-gem' ),
   ) );

  /*
   * Switch default core markup for search form, comment form, and comments
   * to output valid HTML5.
   */
  add_theme_support( 'html5', array(
    'comment-form',
    'comment-list',
    'gallery',
    'caption',
   ) );


}
endif;
add_action( 'after_setup_theme', 'creative_gem_setup' );

function creative_gem_content_width() {
  $GLOBALS['content_width'] = apply_filters( 'creative_gem_content_width', 678 );
}
add_action( 'after_setup_theme', 'creative_gem_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function creative_gem_widgets_init() {
  register_sidebar( array(
    'name'          => esc_html__( 'Sidebar', 'creative-gem' ),
    'id'            => 'sidebar',
    'description'   => '',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget'  => '</div>',
    'before_title'  => '<h3 class="widget-title"><span>',
    'after_title'   => '</span></h3>',
   ) );

    // First Top Widget 
  register_sidebar( array(
    'name'          => __( 'Top Widget 1', 'creative-gem' ),
    'description'   => __( 'First Top Widget Column', 'creative-gem' ),
    'id'            => 'top-widget-first',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3 class="widget-title">',
    'after_title' => '</h3>',
    ) );


    // Second Top Widget 
  register_sidebar( array(
    'name'          => __( 'Top Widget 2', 'creative-gem' ),
    'description'   => __( 'Second Top Widget Column', 'creative-gem' ),
    'id'            => 'top-widget-second',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3 class="widget-title">',
    'after_title' => '</h3>',
    ) );

    // Third Top Widget 
  register_sidebar( array(
    'name'          => __( 'Top Widget 3', 'creative-gem' ),
    'description'   => __( 'Third Top Widget Column', 'creative-gem' ),
    'id'            => 'top-widget-third',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3 class="widget-title">',
    'after_title' => '</h3>',
    ) );


    // First Footer 
  register_sidebar( array(
    'name'          => __( 'Footer 1', 'creative-gem' ),
    'description'   => __( 'First footer column', 'creative-gem' ),
    'id'            => 'footer-first',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3 class="widget-title">',
    'after_title' => '</h3>',
    ) );

  // Second Footer 
  register_sidebar( array(
    'name'          => __( 'Footer 2', 'creative-gem' ),
    'description'   => __( 'Second footer column', 'creative-gem' ),
    'id'            => 'footer-second',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3 class="widget-title">',
    'after_title' => '</h3>',
    ) );

  // Third Footer 
  register_sidebar( array(
    'name'          => __( 'Footer 3', 'creative-gem' ),
    'description'   => __( 'Third footer column', 'creative-gem' ),
    'id'            => 'footer-third',
    'before_widget' => '<div id="%1$s" class="widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3 class="widget-title">',
    'after_title' => '</h3>',
    ) );

}
add_action( 'widgets_init', 'creative_gem_widgets_init' );

function creative_gem_custom_sidebar() {
    // Default sidebar.
  $sidebar = 'sidebar';
  return $sidebar;
}

/**
 * Enqueue scripts and styles.
 */
function creative_gem_scripts() {
  wp_enqueue_style( 'creative-gem-style', get_stylesheet_uri() );
  wp_enqueue_script( 'creative-gem-customscripts', get_template_directory_uri() . '/js/customscripts.js',array('jquery'),'',true); 

  if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
    wp_enqueue_script( 'comment-reply' );
  }
}
add_action( 'wp_enqueue_scripts', 'creative_gem_scripts' );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';

/**
 * Load Upsell Button In Customizer
 * 2016 &copy; [Justin Tadlock](http://justintadlock.com).
 */

require_once( trailingslashit( get_template_directory() ) . '/inc/upgrade/class-customize.php' );


/**
 * Custom Comments template
 */
if ( ! function_exists( 'creative_gem_comments' ) ) {
  function creative_gem_comment($comment, $args, $depth) { ?>
  <li <?php comment_class(); ?> id="li-comment-<?php comment_ID() ?>">
   <div id="comment-<?php comment_ID(); ?>" style="position:relative;" itemscope itemtype="http://schema.org/UserComments">
    <div class="comment-author vcard">
     <?php echo get_avatar( $comment->comment_author_email, 70 ); ?>
     <div class="comment-metadata">
      <?php printf('<span class="fn" itemprop="creator" itemscope itemtype="http://schema.org/Person">%s</span>', get_comment_author_link()) ?>
      <span class="comment-meta">
        <?php edit_comment_link(__('(Edit)', 'creative-gem'),'  ','') ?>
      </span>
    </div>
  </div>
  <?php if ($comment->comment_approved == '0') : ?>
  <em><?php esc_html_e('Your comment is awaiting moderation.', 'creative-gem') ?></em>
  <br />
<?php endif; ?>
<div class="commentmetadata" itemprop="commentText">
 <?php esc_html(comment_text()) ?>
 <time><?php comment_date(get_option( 'date_format' )); ?></time>
 <span class="reply">
  <?php comment_reply_link(array_merge( $args, array('depth' => $depth, 'max_depth' => $args['max_depth']))) ?>
</span>
</div>
</div>
</li>
<?php }
}

/*
 * Excerpt
 */
function creative_gem_excerpt($limit) {
  $excerpt = explode(' ', get_the_excerpt(), $limit);
  if (count($excerpt)>=$limit) {
    array_pop($excerpt);
    $excerpt = implode(" ",$excerpt);
  } else {
    $excerpt = implode(" ",$excerpt);
  }
  $excerpt = preg_replace('`[[^]]*]`','',$excerpt);
  return $excerpt;
}

/**
 * Shorthand function to check for more tag in post.
 *
 * @return bool|int
 */
function creative_gem_post_has_moretag() {
  return strpos( get_the_content(), '<!--more-->' );
}

if ( ! function_exists( 'creative_gem_readmore' ) ) {
    /**
     * Display a "read more" link.
     */
    function creative_gem_readmore() {
      ?>
      <div class="readMore">
        <a href="<?php echo esc_url( get_the_permalink() ); ?>" title="<?php the_title_attribute(); ?>">
          <?php esc_html_e( 'Read More', 'creative-gem' ); ?>
        </a>
      </div>
      <?php 
    }
  }

/*
 * Google Fonts
 */
function creative_gem_fonts_url() {
  $fonts_url = '';

    /* Translators: If there are characters in your language that are not
    * supported by Monda, translate this to 'off'. Do not translate
    * into your own language.
    */
    $monda = _x( 'on', 'Monda font: on or off', 'creative-gem' );

    if ( 'off' !== $monda ) {
      $font_families = array();

      if ( 'off' !== $monda ) {
        $font_families[] = urldecode('Roboto:300,400,500,700,900');
      }

      $query_args = array(
        'family' => urlencode( implode( '|', $font_families ) ),
            //'subset' => urlencode( 'latin,latin-ext' ),
        );

      $fonts_url = add_query_arg( $query_args, '//fonts.googleapis.com/css' );
    }

    return $fonts_url;
  }

  function creative_gem_scripts_styles() {
    wp_enqueue_style( 'creative-gem-fonts', creative_gem_fonts_url(), array(), null );
  }
  add_action( 'wp_enqueue_scripts', 'creative_gem_scripts_styles' );

/**
 * WP Mega Menu Plugin Support
 */
function creative_gem_megamenu_parent_element( $selector ) {
  return '.primary-navigation .container';
}
add_filter( 'wpmm_container_selector', 'creative_gem_megamenu_parent_element' );


/**
 * Post Layout for Archives
 */
if ( ! function_exists( 'creative_gem_archive_post' ) ) {
    /**
     * Display a post of specific layout.
     * 
     * @param string $layout
     */
    function creative_gem_archive_post( $layout = '' ) { 
       ?>
      <article class="post excerpt">
       
       <?php if ( has_post_thumbnail() ) { ?>
        <div class="post-blogs-container-thumbnails">
       <?php } else { ?>
        <div class="post-blogs-container">
       <?php } ?>
     
        <?php if ( empty($creative_gem_full_posts) ) : ?>


        <?php if ( has_post_thumbnail() ) { ?>
        <div class="featured-thumbnail-container">
          <a href="<?php the_permalink() ?>" title="<?php the_title_attribute(); ?>" id="featured-thumbnail">
              <?php esc_url($featured_img_url = get_the_post_thumbnail_url(get_the_ID(),'full'));  
              echo '<div class="blog-featured-thumbnail" style="background-image:url('.esc_url($featured_img_url).')"></div>';
              ?>
          </a>
        </div>
        <div class="thumbnail-post-content">
        <?php } else { ?>
         <div class="nothumbnail-post-content">
        <?php } ?>


        <h2 class="title">
          <a href="<?php the_permalink() ?>" title="<?php the_title_attribute(); ?>" rel="bookmark"><?php the_title(); ?></a>
        </h2>

    <span class="entry-meta">
      <?php echo esc_html(get_the_date()); ?>
   <?php
        if ( is_sticky() && is_home() && ! is_paged() ) {
          printf( ' / <span class="sticky-text">Featured</span>', 'creative-gem'  );
        } ?>
    </span>
        <div class="post-content">
          <?php echo esc_html(creative_gem_excerpt(50)); ?>...
        </div>
      <?php else : ?>
      <?php if (creative_gem_post_has_moretag()) : ?>
      <?php creative_gem_readmore(); ?>
      </div>
    </div>
    <?php endif; ?>
  <?php endif; ?>

</article>
<?php }
}


/**
 * Creative Gem Links Page
 */
add_action( 'admin_menu', 'creative_gem_subpage_sidebar' );
function creative_gem_subpage_sidebar() {
  add_theme_page( __('Creative Gem Links', 'creative-gem'), __('Creative Gem Links', 'creative-gem'), 'edit_theme_options', 'creative_gem-subpage.php', 'creative_gem_subpage_contents');
}

function creative_gem_subpage_contents(){ ?>


<div class="wrap">
  <div class="welcome-panel">
    <div class="welcome-panel-content">
      <h1><strong><?php echo __('Get Started With Creative Gem', 'creative-gem') ?></strong>

      </h1>
      <p class="about-description"><?php echo __('Here is some links to help you get going with the theme!', 'creative-gem') ?></p>
      <div class="welcome-panel-column-container">
        <div class="welcome-panel-column">
          <h3><?php echo __('Helpdesk and Feedback', 'creative-gem') ?></h3>
          <a class="button button-primary button-hero" target="_blank" href="<?php echo esc_url('http://businessclassthemes.com/contact/') ?>"><?php echo __('Theme Help And Feedback', 'creative-gem') ?></a>
        </div>
        <div class="welcome-panel-column">
          <h3><?php echo __('Creative Gem Pro', 'creative-gem') ?></h3>
          <a class="button button-primary button-hero" target="_blank" href="<?php echo esc_url('http://businessclassthemes.com/') ?>"><?php echo __('View Pro Features', 'creative-gem') ?></a>
        </div>
        <div class="welcome-panel-column">
          <h3><?php echo __('Creative Gem Demo', 'creative-gem') ?></h3>
          <a class="button button-primary button-hero" target="_blank" href="<?php echo esc_url('http://businessclassthemes.com/themes/creative-gem/') ?>"><?php echo __('View Demo', 'creative-gem') ?></a>
        </div>
      </div>

      <p>&nbsp;</p>

      <p class="hide-if-no-customize">
        <?php echo __('In case you did not find what you were looking for, you can visit our website', 'creative-gem') ?>
       <a href="<?php echo esc_url('http://businessclassthemes.com/') ?>" target="_blank"><?php echo __('here.', 'creative-gem') ?></a></p>
      </div>

    </div>
  </div>
  <?php }
