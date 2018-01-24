<?php
/**
 * The main template file.
 *
 * Used to display the homepage when home.php doesn't exist.
 */
?>
<?php get_header(); ?>
	<div id="page" class="home-page">
		<div class="article">
			<?php if ( have_posts() ) :
				$creative_gem_full_posts = get_theme_mod('creative_gem_full_posts');
				while ( have_posts() ) : the_post();
					creative_gem_archive_post();
				endwhile;
				creative_gem_post_navigation();
			endif; ?>
		</div><!-- .article -->
		<?php get_sidebar(); ?>
		</div>
		<?php get_footer(); ?>
