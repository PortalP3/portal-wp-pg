=== Category Extra ===
Contributors: AGriboed
Donate link: http://v1rus.ru
Tags: categories, category, category base,  order, reorder, category password, category color, tag, tag order, taxonomy, taxonomy order, taxonomy password
Requires at least: 4
Tested up to: 4.6.1
Stable tag: 1.0.2
License: GPLv2 or later

Plugin extends capabilities of the categories, taxonomies and tags

== Description ==
Plugin extends capabilities of the categories, taxonomies and tags.
 
* Add image on the category/taxonomy/tag page
* Set color for the category/taxonomy/tag 
* Set the password to access to category/taxonomy/tag
* Hide category/taxonomy/tag from group of users
* Add sorting to category/taxonomy/tag in list
* Add meta title, meta description to the category/taxonomy/tag
* Add seo texts to the category/taxonomy/tag

[Support](http://v1rus.ru/) and suggestions:

Skype: agriboed

[Email](mailto:alexv1rs@gmail.com)

= Languages =

* English (default)
* Русский (ru_RU)

== Installation ==
1. Upload the `category-extra` folder to the `/wp-content/plugins/` directory
2. Activate the plugin through the Plugins menu in WordPress. After activation, go to menu "Settings" - "Category Extra"
3. Configure the plugin
4. Enjoy!

== Frequently Asked Questions ==

= How can I add image to the category in my template? =
You can insert construction in your theme:

`
<?php the_category_image('<img src="','" />' ); ?>
`

First parameter - it's begin of html tag before url of image, second - after url. Usually, it's `<img src='` and second `'/>`.
You also can pass into the function the third parameter - object WP_Term (if you use this construction not on category page; exactly use Taxonomy object) and fourth parameter - echo (true/false) to output result immediately or put result into the variable. `true` is default.

= How can I add top text on the category page in my template? =
You can insert construction in your theme:

`
<?php the_category_top_text(); ?>
`

You also can pass into the function parameter echo (true/false) to output result immediately or put result into variable. `true` is default.

= How can I add bottom text  on the the category in my template? =
You can insert construction in your theme:

`
<?php the_category_bottom_text();?>
`

You also can pass into the function parameter echo (true/false) to output result immediately. `true` is default.

= How can I set password to view the category? =
Insert before calling `have_posts()` this function on category page template:

`
<?php the_category_password();?>
`

Plugin will protect the category, and if need show password form. After password will be entered, user can seen posts of this category.

== Screenshots ==
1. Settings
2. Work area

== Changelog ==
= 1.0.0 =
* Release