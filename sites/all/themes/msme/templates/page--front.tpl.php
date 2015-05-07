<?php
global $base_url,$language;
//$files_dir = $base_url.'/'.variable_get('file_public_path', conf_path() . '/files');
 $theme_path = $base_url.'/'.drupal_get_path('theme', 'msme');
?>   
<header>

<div class="header_top_nav">
<div class="wrapper">
<?php
  global $base_url, $language, $user;
  $theme_path = $base_url.'/'.drupal_get_path('theme', 'msme');
?>

<div class="header_top_nav_left">
    <a href="http://india.gov.in" target="_blank" role="link"><img class="tophead_line1" src="<?php echo $theme_path;?>/image/header_flag.jpg" alt="flag" /><span class="tophead_line2">GOVERNMENT OF INDIA</span><img class="tophead_line3" src="<?php echo $theme_path;?>/image/icon1.png" alt="laser icon" /></a>
</div>
<div class="header_top_nav_right">
<a href="<?php echo $base_url;?>/#main-content" class="skip_cont">Skip to content</a>
<a href="https://www.facebook.com/minmsme" target="_blank" class="tophead_fb"></a>
<a href="https://twitter.com/minmsme" class="tophead_tw" target="_blank"></a>
<a  class="tophead_line5" onclick="set_font_size('increase')" href="javascript:;" title="Increase font size">A+</a>
<a  class="tophead_line6" onclick="set_font_size('')" href="javascript:;" title="Reset font size">A</a>
<a class="tophead_line8 revert"  role="link" onclick="chooseStyle('none', 60);" href="javascript:void(0);">A</a>
<a class="tophead_line4" role="link" onclick="chooseStyle('change', 60);" href="javascript:void(0);">A</a>

<!-- Language dropdown menu -->
<?php print render($page['language_dropdown']);?>
<!-- End languge dropdown -->
	<?php 
if($user->uid){
?>
	<a href="<?php echo $base_url;?>/mydashboard" class="alink">My Dashboard</a>
	<a href="<?php echo $base_url;?>/user/logout" class="alink_in">Logout</a>
<?php
}else{
?>
       <!--
	<a href="<?php //echo $base_url;?>/user/login" class="alink">Sign In</a>
	<a href="<?php //echo $base_url;?>/user/register" class="alink_in">Register</a>
       -->
        
<?php
}
?>		
</div>

<?php print render($page['header_top']);?>


</div>
</div>
<!--Top-Header Section end-->

<div class="main_header">
<div class="wrapper">
<div class="logo">
		<?php if ($logo): ?>
			<a href="<?php print $front_page; ?>" title="<?php echo $site_name; ?>" rel="home" class="header__logo" id="logo"><img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" class="header__logo-image" />
				<?php if ($site_name): ?>
					<span class="maintitle"><?php print $site_name; ?></span>
					<?php if ($site_slogan): ?>
					  <span id="site-slogan">
						<?php print $site_slogan; ?>
					  
                      </span>
					<?php endif; ?>
				<?php endif; ?>
			</a>
		<?php endif; ?>
</div>

<div class="nav_search">
<?php print render($page['search']);?>
</div>
<div class="nav_sitemap"><?php echo l('Sitemap','sitemap'); ?></div>
</div>
<div class="nav">
<div class="wrapper">
<a class="toggle_menu" href="javascript:void(0)">
<div class="rmm-toggled-controls"><div class="rmm-toggled-title">Menu</div><div class="rmm-button"><span>&nbsp;</span><span>&nbsp;</span><span>&nbsp;</span></div></div>
</a>
<?php if ($main_menu): ?>
			  <div id="main-menu" class="navigation" tabindex="-1">
				<?php $block = module_invoke('menu_block', 'block_view', 2);
						print render($block['content']);
				?>
			  </div> <!-- /#main-menu -->
			<?php endif; ?>
 </div>
</div>
</div>
</header>
<!--Header & navigation end-->

<div id="main" style="font-size: 116%;">
<div id="main-content"></div>
<div class="wrapper">

<!--slider start-->
<div class="banner-main">

<div class="slider">
<div id="banner-slide">
        <?php print render($page['homeslider-portion']);?>
      </div>
</div>

<div class="slider-news">
<!-- Latest News start-->
 
             <?php if ($page['home_minister']): ?>
               <?php print render($page['home_minister']);?>
	     <?php endif; ?> 
  
<!--Latest News Close-->
</div>
<div class="border-pattern"></div>
</div>
<!--slider end-->

<!--Middle content start-->
<div class="middle-content">
<div class="latest-news">
    <div class="news-heading">
    <?php 
    if($language->language == 'en'){
        $var_news = t('LATEST NEWS & Events');
    }else{
        $var_news = t('');
    }
    echo $var_news;
    ?>
    </div>
  <div class="lnews-head slider_3">
<!-- Latest News start-->
 
             <?php if ($page['latest_news']): ?>
               <div class="lnews-title"><?php print render($page['latest_news']);?></div>
	     <?php endif; ?> 
  
<!--Latest News Close-->
</div>
</div>

<div class="main-link">
<?php if ($page['detail_page_menu']): ?>
              <?php print render($page['detail_page_menu']);?>
         <?php endif; ?> 
    
    
</div>
<div class="main-content">
  <div class="about-msme">
    <img src="<?php echo $theme_path;?>/image/about-me.jpg" alt='about me'/>
    <?php
    global $language,$base_url;
    $current_lng = $language->language;
    if($current_lng == 'en'){
        $about_us = node_load(353);
        echo $about_us->body['und'][0]['safe_summary'];
    }elseif($current_lng == 'hi') {
        $about_us = node_load(99);
         echo $about_us->body['und'][0]['safe_summary'];
    }else{
		
	}
    
    //print_r($about_us);
    $about_path = drupal_get_path_alias('node/'.$about_us->nid, $current_lng);
    ?>
	<?php if($current_lng == 'en'){ ?>
	<a class="more-button" href="<?php echo $base_url.'/'.$about_path;?>">more</a>
	<?php
	}elseif($current_lng == 'hi'){ ?>
		<a class="more-button" href="<?php echo $base_url.'/hi/'.$about_path;?>">more</a>
	<?php }
	?>
    
  </div>
  <div class="new-msme">
       
    <?php if ($page['what_new']): ?>
             <?php print render($page['what_new']);?>
	<?php endif; ?> 
  </div>
    

    
</div>
</div>
<!--Middle content end-->
<?php $result = taxonomy_get_tree(11,0,NULL,TRUE);// documents vid = 11
//print_r($result);

?>
<!--Speeches Start-->


<div class="speeche">

<ul>
    
<li>
<h2><?php echo t('Documents'); ?></h2>
<ul><li>
<?php 
global $base_url;
$tax_result = taxonomy_get_tree(11,2303,NULL,TRUE);
$tax_array = array(2251,2248,2256);
foreach ($tax_result as  $doc_tax){
    if(in_array($doc_tax->tid, $tax_array)){
    ?></li>
<li><a href="<?php echo $base_url.'/documents/'.$doc_tax->tid; ?>"><?php echo t($doc_tax->name);?></a>
<?php
}else{ ?></li>
<li> <a href="<?php echo $base_url.'/document-list/'.$doc_tax->tid; ?>"><?php echo t($doc_tax->name);?></a>
<?php } }?></li></ul>
</li>

    <li>
  <?php
$current_lng = $language->language;  
$aa = menu_load('menu-rmegy');
echo '<h2>'.t($aa['title']).'</h2><ul><li></li>';
$menu_msp = menu_load_links('menu-rmegy'); 
foreach ($menu_msp as $menu_pmegy){
        if($current_lng == $menu_pmegy['language']){
        if($menu_pmegy['external'] == '1'){
            $menu_path = '';
            $menu_taget = '_blank';
        }else{
            $menu_path = $base_url.'/';
            $menu_taget = '';
        }
        ?>
<li><a href="<?php echo $menu_path.''.$menu_pmegy['link_path']; ?>" target="<?php echo $menu_taget;?>"><?php echo $menu_pmegy['link_title'];?></a></li>
        <?php }

}
?>      
    </ul></li>
<li>	
<?php
$aa_pm = menu_load('menu-home-right-menu-');
echo '<h2>'.t($aa_pm['title']).'</h2><ul><li></li>';
$menu_msp = menu_load_links('menu-home-right-menu-'); 
foreach ($menu_msp as $menu_pmegy){
        if($current_lng == $menu_pmegy['language']){
        if($menu_pmegy['external'] == '1'){
            $menu_path = '';
            $menu_taget = '_blank';
        }else{
            $menu_path = $base_url.'/';
            $menu_taget = '';
        }
        ?>
<li><a href="<?php echo $menu_path.''.$menu_pmegy['link_path']; ?>" target="<?php echo $menu_taget;?>"><?php echo $menu_pmegy['link_title'];?></a></li>
        <?php }

}
?>
</ul></li>

<li>
<?php
$aa_em = menu_load('menu-em');
echo '<h2>'.t($aa_em['title']).'</h2><ul><li></li>';
$menu_msp = menu_load_links('menu-em'); 
foreach ($menu_msp as $menu_pmegy){
        if($current_lng == $menu_pmegy['language']){
        if($menu_pmegy['external'] == '1'){
            $menu_path = '';
            $menu_taget = '_blank';
        }else{
            $menu_path = $base_url.'/';
            $menu_taget = '';
        }
        ?>
<li><a href="<?php echo $menu_path.''.$menu_pmegy['link_path']; ?>" target="<?php echo $menu_taget;?>"><?php echo $menu_pmegy['link_title'];?></a></li>
        <?php }

}
?>
</ul></li>
<li>
<?php echo '<h2>'.t('E-book').'</h2><ul>';?>

   <li><a href="<?php echo $base_url;?>/sites/default/files/ebook/MSME-eBook-2015-07012015-New.pdf" target="_blank">
		<img src="<?php echo $theme_path;?>/image/ebook.jpg" alt="e book" />
</a></li></ul>
</li>
</ul>

</div>
<!--Speeches Close-->


</div><!--Main wrapper End-->
<div class="border-pattern"></div>
</div><!--Main Section End-->

<!--Organisation start-->
 <div class="banner_logo">
             <?php if ($page['banner_org']): ?>
     <div class="org_title"><h2>Organization</h2></div>
              <div id="banner_logo_imgs"><?php print render($page['banner_org']);?></div>
	     <?php endif; ?> 
 </div>   
<!--Organisation Close-->

<footer>
<div class="wrapper">
<div class="footer_nav">
<a href="javascript:void(0)" class="footer_toggle_menu">Footer Menu</a>

<?php print render($page['foot_content']); ?>
</div>
<div class="language_changer">
    
<!-- Language dropdown menu -->
		<?php 
			$block = module_invoke('gtranslate', 'block_view', 'gtranslate');
			print render($block['content']); 
		?>
<!-- End languge dropdown -->

</div>
<div class="footer_content"><p>Content Owned by Ministry of Micro Small & Medium Enterprises, Goverment of India.</p></div>
</div>
</footer>


<script type="text/javascript">
	$(window).load(function() {
		$(".flexiselDemo1").flexisel();
		$(".flexiselDemo2").flexisel({
			enableResponsiveBreakpoints: true,
			responsiveBreakpoints: { 
				portrait: { 
					changePoint:480,
					visibleItems: 1
				}, 
				landscape: { 
					changePoint:640,
					visibleItems: 2
				},
				tablet: { 
					changePoint:768,
					visibleItems: 3
				}
			}
		});
	});
        jQuery(document).ready(function($) {
          
          $('#banner-slide').bjqs({
            animtype      : 'slide',
            height        : 329,
            width         : 837,
            responsive    : true,
            randomstart   : true
          });
          
        });
      </script>

