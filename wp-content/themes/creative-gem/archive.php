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
		
		<?php 
		if ( have_posts() ) {
			$creative_gem_full_posts = get_theme_mod('creative_gem_full_posts');
			while ( have_posts() ) {
				 the_post();
				creative_gem_archive_post();
			}
			creative_gem_post_navigation();
		}else{?>

<div class="post-blogs-container">
        <div class="nothumbnail-post-content">
   			<h2 class="title">
	 			<a href="#" style="text-transform: uppercase;" rel="bookmark">No hay artículos disponibles</a>
   			</h2>
		<span class="entry-meta"></span>
   		<div class="post-content"></div>
 
		</div>
</div>

		<?php } 
		?>


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

	<!-- OTRAS TEMATICAS-->
						
						<div class="upper-widgets-grid-wrapper" align="center">
						<h3>OTRAS TEMÁTICAS</h3>
						<div class="categories-container">
							<?php
							$categories =  get_categories(array(
									'parent'  => 0,
									'hide_empty' => 0,
									'order'    => 'DESC',
							));
									 
							$currentCategory = get_queried_object();
						 	foreach  ($categories as $category) {
								 if ($category->cat_ID!= $currentCategory->term_id){
								 ?>
									<div class="upper-widgets-grid" id="<?php echo str_replace(' ', '-', strtolower($category->cat_name)); ?>">
										<div class="top-column-widget">
											<h2>
												<a href="<?php echo  get_category_link( $category->cat_ID ); ?>"><?php echo $category->cat_name ?></a>
											</h2>
										</div>
									</div>
						<?php   }
							}
						?>
						</div>
						</div>
					
			



	<?php get_sidebar(); ?>
</div>
<?php get_footer(); ?>