<?php
/**
 * The template for displaying all single posts.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package creative Lite
 */
$creative_gem_single_breadcrumb_section = get_theme_mod('creative_gem_single_breadcrumb_section', '1');
$creative_gem_single_tags_section = get_theme_mod('creative_gem_single_tags_section', '1');
$creative_gem_authorbox_section = get_theme_mod('creative_gem_authorbox_section', '1');
$creative_gem_relatedposts_section = get_theme_mod('creative_gem_relatedposts_section', '1');

get_header(); ?>

<div id="page" class="single">
	<div class="content">
		<!-- Start Article -->
		
		<article class="article">		
			<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
			<div id="post-<?php the_ID(); ?>" <?php post_class('post'); ?>>
				<div class="single_post">
					<!-- Start Content -->
					<div id="content" class="post-single-content box mark-links">
					<header>
						<!-- Start Title -->
						<h1 class="title single-title" style="text-transform: uppercase;"><?php the_title(); ?></h1>
						<!-- End Title -->
						<div class="post-date-creative">Creado el <?php the_time( get_option( 'date_format' ) ); ?></div>

					</header>

						<?php the_content(); ?>
						<?php wp_link_pages(array('before' => '<div class="pagination">', 'after' => '</div>', 'link_before'  => '<span class="current"><span class="currenttext">', 'link_after' => '</span></span>', 'next_or_number' => 'next_and_number', 'nextpagelink' => __('Next', 'creative-gem' ), 'previouspagelink' => __('Previous', 'creative-gem' ), 'pagelink' => '%','echo' => 1 )); ?>
						<?php if($creative_gem_single_tags_section == '1') { ?>
						<!-- Start Tags -->
						<div class="tags"><?php the_tags('<span class="tagtext">'.__('Tags','creative-gem').':</span>',', ') ?></div>
						<!-- End Tags -->
						<?php } ?>
					</div><!-- End Content -->
					<?php if($creative_gem_relatedposts_section == '1') { ?>
						
					

					<!-- Start Related Posts -->
					<?php $categories = get_the_category($post->ID); 
					if ($categories) { $category_ids = array(); 
						foreach($categories as $individual_category) 
							$category_ids[] = $individual_category->term_id; 
						$args=array( 'category__in' => $category_ids, 
							'post__not_in' => array($post->ID), 
							'ignore_sticky_posts' => 1, 
							'showposts'=> 3,
							'orderby' => 'date',
							'order'   => 'ASC',
						 );
						$my_query = new wp_query( $args ); 
						//if( $my_query->have_posts() ) {
						if( false ) {
							echo '<div class="related-posts"><div class="postauthor-top"><h3>'.__('Posts Relacionados', 'creative-gem').'</h3></div><div class="related-posts-wrapper">';
							$pexcerpt=1; $j = 0; $counter = 0; 
							while( $my_query->have_posts() ) { 
								$my_query->the_post();?>
								<article class="post excerpt  <?php echo (++$j % 3== 0) ? 'last' : ''; ?>">
									<?php if ( has_post_thumbnail() ) { ?>
									<a href="<?php the_permalink() ?>" title="<?php the_title_attribute(); ?>">
										<div class="related-post-featured-thumbnail-container">
											<div class="featured-thumbnail-overlay"></div>
											<?php  $featured_img_url = get_the_post_thumbnail_url(get_the_ID(),'full');  
											echo '<div class="related-posts-thumbnail" style="background-image:url('.esc_url($featured_img_url).')">'; ?>
											<h5 class="title front-view-title"><?php the_title(); ?></h5>
											<?php echo '</div>' ?>
										</div>
									</a>
									<?php } else { ?>
									<a href="<?php the_permalink() ?>" title="<?php the_title_attribute(); ?>" class="related-posts-no-img">
											<h5 class="title front-view-title"><?php the_title(); ?></h5>
									
									</a>
									<?php } ?>
								</article><!--.post.excerpt-->
								<?php $pexcerpt++;?>
								<?php } 
								echo '</div></div>'; 
							}
							} 
							wp_reset_postdata(); ?>

								<!-- End Related Posts -->
								<?php }?>  
								<?php if($creative_gem_authorbox_section == '1') { ?>
								<!-- Start Author Box -->
								<div class="postauthor">
									<b><?php esc_html_e('Autor(a)', 'creative-gem'); ?></b>
									<?php if(function_exists('get_avatar')) { echo get_avatar( get_the_author_meta('email'), '85' );  } ?>
									<h5><?php the_author(); ?></h5>
									<p><?php the_author_meta('description') ?></p>
								</div>
								<!-- End Author Box -->
								<?php }?>  
								
								<?php //comments_template( '', true ); ?>

			


							</div>
						</div>
					<?php endwhile; ?>
				</article>
				<!-- End Article -->
				<!-- Start Sidebar -->
				<?php get_sidebar(); ?>
				<!-- End Sidebar -->
			</div>
		</div>
		<?php get_footer(); ?>
