<?php
/**
 * The template for displaying search results pages.
 *
 * @package creative Lite
 */

get_header(); ?>
	<div id="page" class="search-area">
		<div class="article">
			<?php if ( have_posts() ) :
				$creative_gem_full_posts = get_theme_mod('creative_gem_full_posts');
				while ( have_posts() ) : the_post();
					creative_gem_archive_post();
				endwhile;
				creative_gem_post_navigation();
			else : ?>
				<div class="single_post clear">
					<article id="content" class="article page">
						<header>
							<h1 class="title"><?php esc_html_e( 'Nothing Found', 'creative-gem' ); ?></h1>
						</header>
						<p><?php esc_html_e( 'Sorry, but nothing matched your search terms. Please try again with some different keywords.', 'creative-gem' ); ?></p>
						<?php get_search_form(); ?>
					</article>
				</div>
			<?php endif; ?>
		</div><!-- .article -->
		<?php get_sidebar(); ?>
	</div><!-- #primary -->

<?php get_footer(); ?>
