<?php
/**
 * The template for displaying archive pages.
 *
 * Used for displaying archive-type pages. These views can be further customized by
 * creating a separate template for each one.
 *
 * - author.php (Author archive)
 * - category.php (Category archive)
 * - date.php (Date archive)
 * - tag.php (Tag archive)
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 */
?>
<?php get_header(); ?>

<div id="page" class="home-page">
	<div class="article">
		<h1 class="postsby">
			<span><?php the_archive_title(); ?></span>
		</h1>
		<?php the_archive_description( '<div class="taxonomy-description">', '</div>' ); ?>	
		<?php if ( have_posts() ) :
			$creative_gem_full_posts = get_theme_mod('creative_gem_full_posts');
			while ( have_posts() ) : the_post();
				creative_gem_archive_post();
			endwhile;
			creative_gem_post_navigation();
		endif; ?>
	</div>
	<?php get_sidebar(); ?>
</div>
<?php get_footer(); ?>