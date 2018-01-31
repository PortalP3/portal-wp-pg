<?php
use AGriboed\CategoryExtra;

if (!function_exists('the_category_image')) {
    function the_category_image($begin='', $end='', $term=false, $echo=true)
    {
        CategoryExtra::instance()->termImage($begin,$end,$term,$echo);
    }

    add_action('init', 'the_category_image');
}

if (!function_exists('the_category_top_text')) {
    function the_category_top_text($term=false, $echo=true)
    {
        CategoryExtra::instance()->termTopText($term,$echo);
    }
    add_action('init', 'the_category_top_text');
}

if (!function_exists('the_category_bottom_text')) {
    function the_category_bottom_text($term=false, $echo=true)
    {
        CategoryExtra::instance()->termBottomText($term,$echo);
    }
    add_action('init', 'the_category_bottom_text');
}



if (!function_exists('the_category_password')) {
    function the_category_password()
    {
        CategoryExtra::instance()->checkCategoryPassword();
    }
    add_action('init', 'the_category_bottom_text');
}