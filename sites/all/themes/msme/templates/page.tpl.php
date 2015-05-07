<?php
global $base_url,$language;
$theme_path = $base_url.'/'.drupal_get_path('theme', 'msme');
$current_lng = $language->language;
?>

<header>
<div class="header_top_nav">
<div class="wrapper">
<div class="header_top_nav_left">
<a href="http://india.gov.in" target="_blank" role="link"><img class="tophead_line1" src="<?php  echo $theme_path ;?>/image/header_flag.jpg" alt="flag" /><span class="tophead_line2">GOVERNMENT OF INDIA</span><img class="tophead_line3" src="<?php  echo $theme_path ;?>/image/icon1.png" alt="laser icon" /></a>
</div>
<div class="header_top_nav_right">
<a href="#main-content" class="skip_cont">Skip to content</a>
<a href="https://www.facebook.com/minmsme" target="_blank" class="tophead_fb"></a>
<a href="https://twitter.com/minmsme" target="_blank" class="tophead_tw"></a>
<a  class="tophead_line5" onclick="set_font_size('increase')" href="javascript:;" title="Increase font size">A+</a>
<a  class="tophead_line6" onclick="set_font_size('')" href="javascript:;" title="Reset font size">A</a>
<a class="tophead_line8 revert"  role="link" onclick="chooseStyle('none', 60);" href="javascript:void(0);">A</a>
<a class="tophead_line4" role="link" onclick="chooseStyle('change', 60);" href="javascript:void(0);">A</a>

<!-- Language dropdown menu -->
<?php print render($page['language_dropdown']);
	

?>
<!-- End languge dropdown -->
</div>
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
<!-- innermain -->
<div id="main" style="font-size: 116%;">
<div class="wrapper">

<!--bradcum start-->
<div class="bradcum">
<!--<ul>
<li><a href="#">Home</a></li>
<li><a href="#">About us</a></li>
</ul>-->
 <?php print render($page['highlighted']); ?>
 <?php print $breadcrumb; ?>
</div>
<!--bradcum end-->

<!--Inner page left start-->
<div class="innerleft">
<!--panel 1 start-->
<div class="main-link">
<!--  <ul>
      <li class="linkicon1"><a href="#">Acts, Rules & Notifications</a></li>
      <li class="linkicon2"><a href="#">International Cooperation</a></li>
      <li class="linkicon3"><a href="#">Vacancies</a></li>
      <li class="linkicon4"><a href="#">Tender</a></li>
      <li class="linkicon5"><a href="#">Other Links</a></li>
      <li class="linkicon6"><a href="#">Virtual Cluster</a></li>
  </ul>-->

<?php if ($page['detail_page_menu']): ?>
              <?php print render($page['detail_page_menu']);?>
         <?php endif; ?> 

</div>
<!--Panel 1 end-->

<div class="border-pattern"></div>	

<!--Speeches Start-->
<!--Speeches Start-->
<div id='cssmenu'>
<!-- <h3></h3> -->
  <ul> <!-- 1stli -->
    <li class='has-sub'><a href='#'><span><?php echo t('Documents'); ?></span></a>
    <ul>
     <?php 
    global $base_url;
    $tax_result = taxonomy_get_tree(11,2303,NULL,TRUE);
    $tax_array = array(2251,2248,2256);
    foreach ($tax_result as  $doc_tax){
        if(in_array($doc_tax->tid, $tax_array)){
        ?>
    <li><a href="<?php echo $base_url.'/documents/'.$doc_tax->tid; ?>"><?php echo t($doc_tax->name);?></a></li>
    <?php
    }else{ ?>
     <li><a href="<?php echo $base_url.'/document-list/'.$doc_tax->tid; ?>"><?php echo t($doc_tax->name);?></a></li>
    <?php } }?>
 </ul>
    </li>
    <!-- 2ndli -->
    <li class='has-sub'><a href='#'><span>
	<?php $aa = menu_load('menu-rmegy'); 
	echo ''.t($aa['title']).'';
    ?>
</span></a>
    <ul>
<?php
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
 </ul>
    </li>
    
        <li class='has-sub'><a href='#'><span><?php 
$aa_pm = menu_load('menu-home-right-menu-');
echo ''.t($aa_pm['title']).'';
?></span></a>
<ul>
<?php
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
 </ul>
    </li>
    
        <li class='has-sub'><a href='#'><span><?php 
$aa_em = menu_load('menu-em');
echo ''.t($aa_em['title']).'';
?></span></a>
    <ul>
    <?php
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
 </ul>
    </li>
   </ul>
</div>

<script type="text/javascript">( function( $ ) {
$( document ).ready(function() {
$('#cssmenu > ul > li > a').click(function() {
  $('#cssmenu li').removeClass('active');
  $(this).closest('li').addClass('active'); 
  var checkElement = $(this).next();
  if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
    $(this).closest('li').removeClass('active');
    checkElement.slideUp('normal');
  }
  if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
    $('#cssmenu ul ul:visible').slideUp('normal');
    checkElement.slideDown('normal');
  }
  if($(this).closest('li').find('ul').children().length == 0) {
    return true;
  } else {
    return false; 
  }  
});
});
} )( jQuery );
</script>

<script type="text/javascript">
$("#accordion > h3").click(function(){

 if(false == $(this).next().is(':visible')) {
  $('#accordion > ul').slideUp(300);
 }
 $(this).next().slideToggle(300);
});

$('#accordion > ul:eq(0)').show();

</script>
<!--Speeches Close-->
<!--Speeches Close-->

</div>
<!--Inner page left end-->

<!-- Help region -->
 <div class="help_region">
             <?php if ($page['help']): ?>
              <?php print render($page['help']);?>
      <?php endif; ?> 
 </div> 
 <!-- end of help -->

<!--Inner page right start-->
<div class="innerright">

 <!-- Content -->
 <div id="middle-content" class="column" role="main">
      <a id="main-content"></a>
      <?php print render($title_prefix); ?>
      <?php if ($title): ?>
        <h1 class="page__title title" id="page-title"><?php print $title; ?></h1>
      <?php endif; ?>
       <div class="border-pattern"></div>
      <?php print render($title_suffix); ?>
      <?php print $messages; ?>
      <?php print render($tabs); ?>
      <?php //print render($page['help']); ?>
      <?php if ($action_links): ?>
        <ul class="action-links"><?php print render($action_links); ?></ul>
      <?php endif; ?>
      <?php print render($page['content']); ?>
      <?php print $feed_icons; ?>
</div>
 <!-- end content -->
 


</div>
<!--Inner page right end-->
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

<?php
drupal_add_js(drupal_get_path('theme', 'msme') .'/js/jquery.cycle.all.js', 'file');
?>
        </footer>





