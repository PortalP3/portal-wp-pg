<?php
/**
 * The header for our theme.
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package creative Lite
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
	<div class="main-container">
		<header id="site-header" role="banner">
			<?php if ( get_theme_mod( 'toggle_header_frontpage' ) == '' ) : ?>
				<div class="primary-navigation header-activated start-header-design">
				<?php else : ?>
					<?php if ( is_front_page() ) : ?>
						<div class="primary-navigation header-activated">
						<?php else : ?>
							<div class="primary-navigation">
							<?php endif; ?>
						<?php endif; ?>
						<a href="#" id="pull" class="toggle-mobile-menu"><?php esc_html_e('Menu', 'creative-gem'); ?></a>
						<div class="container clear">
							<nav id="navigation" class="primary-navigation mobile-menu-wrapper" role="navigation">

								<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'menu clearfix', 'container' => '' ) ); ?>
								
							</nav><!-- #site-navigation -->
						</div>
					</div>            

						<div class="container clear">
							<div class="site-branding">
									<div class="site-title website-title"><?php bloginfo( 'name' ); ?></div>
									<div class="site-description website-description"><?php bloginfo( 'description' ); ?></div>

								<?php if ( get_theme_mod( 'header_left_button_text') ||  get_theme_mod( 'header_right_button_text') ) : ?>
									<div class="buttons-wrapper buttons-small-fullwidth">
										<?php if (get_theme_mod('header_left_button_text') ) : ?>
											<a href="<?php echo esc_url(get_theme_mod('header_left_button_link')) ?>" class="header-button-border header-button-global"><?php echo esc_html(get_theme_mod('header_left_button_text')) ?></a>
										<?php endif; ?>
										<?php if (get_theme_mod('header_right_button_text') ) : ?>
											<a href="<?php echo esc_url(get_theme_mod('header_right_button_link')) ?>" class="header-button-solid header-button-global"><?php echo esc_html(get_theme_mod('header_right_button_text')) ?></a>
										<?php endif; ?>
									</div>
								<?php endif; ?>
								<!--Buttons -->
							</div><!-- .site-branding -->
						</div>
				</header><!-- #masthead -->

				<div class="container">
					<?php simple_breadcrumb(); ?>
				</div>

				<div class="container">
							<div class="upper-widgets-grid-wrapper">
									<?php
  											$categories =  get_categories(array(
												'parent'  => 0,
												'hide_empty' => 0,
												'order'    => 'DESC',
											 ));
											
										 foreach  ($categories as $category) { ?>
											<div class="upper-widgets-grid">
												<div class="top-column-widget">
													<h2>
													<a href="<?php echo  get_category_link( $category->cat_ID ); ?>"><?php echo $category->cat_name ?></a>
													</h2>
												</div>
											</div>
										<?php } ?>
							</div>
						</div>

