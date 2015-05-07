<?php

/**
 * @file
 * Default theme implementation to display the basic html structure of a single
 * Drupal page.
 *
 * Variables:
 * - $css: An array of CSS files for the current page.
 * - $language: (object) The language the site is being displayed in.
 *   $language->language contains its textual representation.
 *   $language->dir contains the language direction. It will either be 'ltr' or
 *   'rtl'.
 * - $rdf_namespaces: All the RDF namespace prefixes used in the HTML document.
 * - $grddl_profile: A GRDDL profile allowing agents to extract the RDF data.
 * - $head_title: A modified version of the page title, for use in the TITLE
 *   tag.
 * - $head_title_array: (array) An associative array containing the string parts
 *   that were used to generate the $head_title variable, already prepared to be
 *   output as TITLE tag. The key/value pairs may contain one or more of the
 *   following, depending on conditions:
 *   - title: The title of the current page, if any.
 *   - name: The name of the site.
 *   - slogan: The slogan of the site, if any, and if there is no title.
 * - $head: Markup for the HEAD section (including meta tags, keyword tags, and
 *   so on).
 * - $styles: Style tags necessary to import all CSS files for the page.
 * - $scripts: Script tags necessary to load the JavaScript files and settings
 *   for the page.
 * - $page_top: Initial markup from any modules that have altered the
 *   page. This variable should always be output first, before all other dynamic
 *   content.
 * - $page: The rendered page content.
 * - $page_bottom: Final closing markup from any modules that have altered the
 *   page. This variable should always be output last, after all other dynamic
 *   content.
 * - $classes String of classes that can be used to style contextually through
 *   CSS.
 *
 * @see template_preprocess()
 * @see template_preprocess_html()
 * @see template_process()
 * @see omega_preprocess_html()
 */
?><!DOCTYPE html>
<?php if (omega_extension_enabled('compatibility') && omega_theme_get_setting('omega_conditional_classes_html', TRUE)): ?>
  <!--[if IEMobile 7]><html class="no-js ie iem7" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"><![endif]-->
  <!--[if lte IE 6]><html class="no-js ie lt-ie9 lt-ie8 lt-ie7" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"><![endif]-->
  <!--[if (IE 7)&(!IEMobile)]><html class="no-js ie lt-ie9 lt-ie8" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"><![endif]-->
  <!--[if IE 8]><html class="no-js ie lt-ie9" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"><![endif]-->
  <!--[if (gte IE 9)|(gt IEMobile 7)]><html class="no-js ie" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"<?php print $rdf_namespaces; ?>><![endif]-->
  <!--[if !IE]><!--><html class="no-js" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"<?php print $rdf_namespaces; ?>><!--<![endif]-->
<?php else: ?>
  <html class="no-js" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>"<?php print $rdf_namespaces; ?>>
<?php endif; ?>
<head>
<?php global $base_url,$language;?>
  <?php //print $head; ?>
 <!-- Start Head Section -->
 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<link type="text/css" href="<?php echo $base_url;?>/sites/all/themes/youth-affair/css/style.css" rel="stylesheet">
<link type="text/css" href="<?php echo $base_url;?>/sites/all/themes/youth-affair/css/mobilestyle.css" rel="stylesheet">
<link type="text/css" href="<?php echo $base_url;?>/sites/all/themes/youth-affair/css/ipad.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<?php echo $base_url;?>/sites/all/themes/youth-affair/css/jquery.bxslider.css" />
<link href="<?php echo $base_url;?>/sites/all/themes/youth-affair/css/high.css" rel="alternate stylesheet" type="text/css" media="screen" title="change" />

<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/youth-affair/js/html5.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/youth-affair/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/youth-affair/js/custom.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/youth-affair/js/jquery.dd.min.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/youth-affair/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/youth-affair/js/custom-select.js"></script>

 
 <!-- End Head Section -->
  <title><?php print $head_title; ?></title>
  <?php print $styles; ?>
  <?php print $scripts; ?>
<!-- Header part -->
<header>
	<!-- start header_top_nav -->
  	<div class="header_top_nav">
    	<div class="wrapper">
			<!-- start header_top_nav_left -->
            <div class="header_top_nav_left"> 
              <a href="#">
              <img class="tophead_line1" src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/india_flag.jpg" alt="flag" />
              <span class="tophead_line2">GOVERNMENT OF INDIA
              <img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/india_more.png" alt="laser icon" /></span>
              </a> 
			</div>
            <!-- end header_top_nav_left -->
            <!-- start header_top_nav_right -->
            <div class="header_top_nav_right"> 
				<div class="social">
                	<p><a title="Skip to Main Content" href="#content">Skip to Content</a></p>
                    <ul>
                      <li><a href="javascript:void(0)"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/fb_icon.jpg" alt="facebook" title="facebook" /></a></li>
                      <li><a href="javascript:void(0)"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/twtr_icon.jpg" alt="twitter" title="twitter" /></a></li>
                      <li><a href="javascript:void(0)"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/utube_icon.jpg" alt="you tube" title="you tube" /></a></li>
                      <li><a href="javascript:void(0)"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/gplus_ion.jpg" alt="google plus" title="google plus" /></a></li>
                      <li><a href="javascript:void(0)"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/ebay_icon.jpg" alt="ebay" title="ebay" /></a></li>
                    </ul>
				</div>
                <div class="switch">
                    <ul class="switch_text">
                      <li><a href="javascript:void(0);" class="large increaseFont">A+</a></li>
                      <li><a href="javascript:void(0);" class="medium resetFont">A</a></li>
                      <li><a href="javascript:void(0);" class="small decreaseFont">A-</a></li>
                    </ul>
                    <ul class="switch_color">
                      <li><a href="javascript:void(0)" class="dark" onClick="chooseStyle('change', 60);">A</a></li>
                      <li><a href="javascript:void(0);" class="light" onClick="chooseStyle('none', 60);">A</a></li>
                    </ul>
                    <div class="lang">
                      <select class="styled" id="lang">
                        <option value="#">English</option>
                        <option value="#">Bengali</option>	
                        <option value="#" selected>Hindi</option>
                      </select>
                  </div>
				</div> 
    		</div>       
        	<!-- end header_top_nav_right -->  
		<div class="spacer"></div>
  	</div>
	</div>
    <!-- end header_top_nav -->
    
        <!-- start main_header -->
    <div class="main_header">
        <div class="wrapper">
            <div class="logo">
            <a href="#" alt="Ministry of Youth Affairs and Sports" title="Ministry of Youth Affairs and Sports"><img alt="Ministry of Youth Affairs and Sports" title="Ministry of Youth Affairs and Sports" src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/logo.png">
            <p class="maintitle"><span>Ministry of</span> YOUTH AFFAIRS AND SPORTS</p></a>
            </div>
        	<div class="main_headerRight">
            <div class="nav_search">
            <form>
            <input type="search" name="search" placeholder="Search"  />
            <input type="submit" value="" name="submit" />
            </form>
            </div>
            <div class="nav_sitemap"><a href="#">Sitemap</a></div>
            </div>
        </div>
    </div>
    <!-- end main_header -->
    <!-- start navigation -->
    <div class="nav">
        <div class="wrapper">
           <!-- <a class="toggle_menu" href="javascript:void(0)">
            <div class="rmm-toggled-controls"><div class="rmm-toggled-title">Menu</div><div class="rmm-button"><span>&nbsp;</span><span>&nbsp;</span><span>&nbsp;</span></div></div>
            </a>-->
            <a href="javascript:void(0)" class="toggleMenu">MENU</a>
            <ul>
                <li class="active"><a href="#" class="active">Home</a></li>      
                <li><a href="about.html">About US</a></li>
                <li><a href="#">Citizen Charter</a></li>
                <li><a href="#">Documents</a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Suggestions</a></li>
                <li><a href="#">Contact us</a></li>
            </ul>
        </div>
    </div>
    <!-- end navigation -->
</header>
<!-- End header part -->
</head>
<body<?php print $attributes;?>>
  <a href="#main-content" class="element-invisible element-focusable"><?php print t('Skip to main content'); ?></a>
 



 <?php print $page_top; ?>
  <?php print $page; ?>
  <?php //print $page_bottom; ?>
  
  
  <!-- start botFooter -->
<div class="botFooter">
	<div class="wrapper">
    
    <div class="fbtm_left">
    	<ul>
        	<li><a href="#"><img src="<?php echo $base_url;?>/images/cqw.png" alt="cqw" title="cqw" /></a></li>
            <li><a href="#"><img src="<?php echo $base_url;?>/images/cmf.png" alt="cmf" title="cmf" /></a></li>
        </ul>
    </div>
    
    <div class="fbtm_mid">
    Website Designed Maintained and Hosted By<br />
<a href="http://www.nic.in/" target="_blank">National Informatics Centre (NIC)</a><br />
Content Managed by<br />
<a href="javascript:void(0)" target="_blank">Dept/Ministry of....</a>
	</div>
    
    <div class="fbtm_right">
    	<div class="lang2">
          <select class="styled" id="lang">
          	<option value="#">English</option>
          	<option value="#">Bengali</option>	
            <option value="#" selected>Hindi</option>
          </select>
      </div>
      	<a href="http://india.gov.in/" target="_blank"><img src="<?php echo $base_url;?>/images/footer_govtlogo.jpg" title="External site that opens in a new window:: National Portal of India" alt="External site that opens in a new window:: National Portal of India" /></a>
    </div>
    <div class="spacer"></div>
    </div>
</div>
<!-- end botFooter -->
  
  
</body>
</html>
