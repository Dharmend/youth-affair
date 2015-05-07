<?php
/**
 * @file
 * Returns the HTML for the basic html structure of a single Drupal page.
 *
 * Complete documentation for this file is available online.
 * @see https://drupal.org/node/1728208
 */
?><!DOCTYPE html>
<!--[if IEMobile 7]><html class="iem7" <?php print $html_attributes; ?>><![endif]-->
<!--[if lte IE 6]><html class="lt-ie9 lt-ie8 lt-ie7" <?php print $html_attributes; ?>><![endif]-->
<!--[if (IE 7)&(!IEMobile)]><html class="lt-ie9 lt-ie8" <?php print $html_attributes; ?>><![endif]-->
<!--[if IE 8]><html class="lt-ie9" <?php print $html_attributes; ?>><![endif]-->
<!--[if (gte IE 9)|(gt IEMobile 7)]><!--><html <?php print $html_attributes . $rdf_namespaces; ?>><!--<![endif]-->

<head>
  <?php print $head; ?>
  <?php global $base_url;?>  
  <title><?php print $head_title; ?></title>

  <?php if ($default_mobile_metatags): ?>
    <meta name="MobileOptimized" content="width">
    <meta name="HandheldFriendly" content="true">
    <meta name="viewport" content="width=device-width">
  <?php endif; ?>
  <meta http-equiv="cleartype" content="on">

  <?php print $styles; ?>
  <?php print $scripts; ?>
 
  <script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/msme/js/default.js"></script>
  <script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/msme/js/custom.js"></script> 
  <script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/msme/js/jquery.min.js"></script> 
  <script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/msme/js/jquery.cycle.all.js"></script> 
  <link href="<?php echo $base_url;?>/sites/all/themes/msme/css/override.css" rel="alternate stylesheet" type="text/css" media="screen" title="change" />
  <!--[if IE 8]>
 <link rel="stylesheet" type="text/css" href="<?php echo $base_url;?>/sites/all/themes/msme/css/ie8.css">
<![endif]-->
</head>
<body class="<?php print $classes; ?>" <?php print $attributes;?>>
  <?php if ($skip_link_text && $skip_link_anchor): ?>
    <p id="skip-link">
      <a href="#<?php print $skip_link_anchor; ?>" class="element-invisible element-focusable"><?php print $skip_link_text; ?></a>
    </p>
  <?php endif; ?>
  <?php print $page_top; ?>
  <?php print $page; ?>
  <?php print $page_bottom; ?>
</body>
</html>
