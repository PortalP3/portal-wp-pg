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
		
		<?php if ( have_posts() ) :
			$creative_gem_full_posts = get_theme_mod('creative_gem_full_posts');
			while ( have_posts() ) : the_post();
				creative_gem_archive_post();
			endwhile;
			creative_gem_post_navigation();
		endif; ?>

	<?php
	if ( get_the_archive_description() ) {
	?>
		<article class="post excerpt">
               <div class="post-blogs-container">
                 <div class="nothumbnail-post-content">
					 <h2 class="title"></h2>
					 <div class="post-content">
					 <?php the_archive_description(); ?>	
					</div>
				   </div>
			</div>
		</article>
	<?php	} ?>
	</div>
	<?php get_sidebar(); ?>
</div>
<?php get_footer(); ?>