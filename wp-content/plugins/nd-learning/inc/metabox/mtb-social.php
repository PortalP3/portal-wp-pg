<?php

///////////////////////////////////////////////////METABOX ///////////////////////////////////////////////////////////////


add_action( 'add_meta_boxes', 'nd_learning_meta_box_teacher_social' );
function nd_learning_meta_box_teacher_social() {
    add_meta_box( 'nd-learning-meta-box-teachers-social', __('Teacher Social','nd-learning'), 'nd_learning_meta_box_teachers_social', 'teachers', 'normal', 'low' );
}

function nd_learning_meta_box_teachers_social()
{


    // $post is already set, and contains an object: the WordPress post
    global $post;
    $nd_learning_values = get_post_custom( $post->ID );
     
    $nd_learning_meta_box_teacher_social_facebook = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_facebook', true );
    $nd_learning_meta_box_teacher_social_twitter = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_twitter', true );
    $nd_learning_meta_box_teacher_social_instagram = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_instagram', true );
    $nd_learning_meta_box_teacher_social_pinterest = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_pinterest', true );
    $nd_learning_meta_box_teacher_social_googleplus = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_googleplus', true );
    $nd_learning_meta_box_teacher_social_youtube = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_youtube', true );
    $nd_learning_meta_box_teacher_social_linkedin = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_linkedin', true );
    $nd_learning_meta_box_teacher_social_vimeo = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_vimeo', true );
    $nd_learning_meta_box_teacher_social_behance = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_behance', true );
    $nd_learning_meta_box_teacher_social_dribbble = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_dribbble', true );
    $nd_learning_meta_box_teacher_social_github = get_post_meta( get_the_ID(), 'nd_learning_meta_box_teacher_social_github', true );

    ?>


    <p><strong><?php _e('Facebook Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_facebook" id="nd_learning_meta_box_teacher_social_facebook" value="<?php echo $nd_learning_meta_box_teacher_social_facebook; ?>" /></p>

    <p><strong><?php _e('Twitter Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_twitter" id="nd_learning_meta_box_teacher_social_twitter" value="<?php echo $nd_learning_meta_box_teacher_social_twitter; ?>" /></p>

    <p><strong><?php _e('Instagram Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_instagram" id="nd_learning_meta_box_teacher_social_instagram" value="<?php echo $nd_learning_meta_box_teacher_social_instagram; ?>" /></p>

    <p><strong><?php _e('Pinterest Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_pinterest" id="nd_learning_meta_box_teacher_social_pinterest" value="<?php echo $nd_learning_meta_box_teacher_social_pinterest; ?>" /></p>

    <p><strong><?php _e('GooglePlus Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_googleplus" id="nd_learning_meta_box_teacher_social_googleplus" value="<?php echo $nd_learning_meta_box_teacher_social_googleplus; ?>" /></p>

    <p><strong><?php _e('Youtube Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_youtube" id="nd_learning_meta_box_teacher_social_youtube" value="<?php echo $nd_learning_meta_box_teacher_social_youtube; ?>" /></p>

    <p><strong><?php _e('Linkedin Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_linkedin" id="nd_learning_meta_box_teacher_social_linkedin" value="<?php echo $nd_learning_meta_box_teacher_social_linkedin; ?>" /></p>

    <p><strong><?php _e('Vimeo Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_vimeo" id="nd_learning_meta_box_teacher_social_vimeo" value="<?php echo $nd_learning_meta_box_teacher_social_vimeo; ?>" /></p>

    <p><strong><?php _e('Behance Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_behance" id="nd_learning_meta_box_teacher_social_behance" value="<?php echo $nd_learning_meta_box_teacher_social_behance; ?>" /></p>

    <p><strong><?php _e('Dribbble Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_dribbble" id="nd_learning_meta_box_teacher_social_dribbble" value="<?php echo $nd_learning_meta_box_teacher_social_dribbble; ?>" /></p>

    <p><strong><?php _e('Github Url','nd-learning'); ?></strong></p>
    <p><input class="regular-text" type="text" name="nd_learning_meta_box_teacher_social_github" id="nd_learning_meta_box_teacher_social_github" value="<?php echo $nd_learning_meta_box_teacher_social_github; ?>" /></p>

    <?php
}



add_action( 'save_post', 'nd_learning_meta_box_teachers_social_save' );
function nd_learning_meta_box_teachers_social_save( $post_id )
{

    // Make sure your data is set before trying to save it
    if( isset( $_POST['nd_learning_meta_box_teacher_social_facebook'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_facebook', wp_kses( $_POST['nd_learning_meta_box_teacher_social_facebook'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_twitter'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_twitter', wp_kses( $_POST['nd_learning_meta_box_teacher_social_twitter'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_instagram'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_instagram', wp_kses( $_POST['nd_learning_meta_box_teacher_social_instagram'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_pinterest'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_pinterest', wp_kses( $_POST['nd_learning_meta_box_teacher_social_pinterest'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_googleplus'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_googleplus', wp_kses( $_POST['nd_learning_meta_box_teacher_social_googleplus'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_youtube'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_youtube', wp_kses( $_POST['nd_learning_meta_box_teacher_social_youtube'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_linkedin'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_linkedin', wp_kses( $_POST['nd_learning_meta_box_teacher_social_linkedin'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_vimeo'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_vimeo', wp_kses( $_POST['nd_learning_meta_box_teacher_social_vimeo'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_behance'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_behance', wp_kses( $_POST['nd_learning_meta_box_teacher_social_behance'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_dribbble'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_dribbble', wp_kses( $_POST['nd_learning_meta_box_teacher_social_dribbble'], $allowed ) );

    if( isset( $_POST['nd_learning_meta_box_teacher_social_github'] ) )
        update_post_meta( $post_id, 'nd_learning_meta_box_teacher_social_github', wp_kses( $_POST['nd_learning_meta_box_teacher_social_github'], $allowed ) );

}