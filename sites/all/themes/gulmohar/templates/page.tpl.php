<?php
	global $base_url;
?>
<header>
	<div class="accessibility_top_nav">
		<div class="wrapper">
			<?php print render($page['header_top']);?>
		</div>
	</div>
	<!--Top-Header Section end-->

	<div class="main_header">
		<div class="wrapper">
		<div class="logo">
		<?php if ($logo): ?>
			<a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" class="header__logo" id="logo"><img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" class="header__logo-image" />
				<?php if ($site_name): ?>
					<span class="maintitle"><?php print t($site_name); ?></span>
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
			<?php print $search_box;?>
		</div>
		<div class="nav_sitemap"><?php echo l('Sitemap','sitemap'); ?></div>
		</div>

	<!--navigation start-->
	<div class="nav">
		<div class="wrapper">
		<a class="toggle_menu" href="javascript:void(0)">
			<div class="rmm-toggled-controls"><div class="rmm-toggled-title">Menu</div><div class="rmm-button"><span>&nbsp;</span><span>&nbsp;</span><span>&nbsp;</span></div></div>
		</a>
			<?php if ($main_menu): ?>
			  <div id="main-menu" class="navigation" tabindex="-1">
				<?php 
					$block = module_invoke('menu_block', 'block_view', 2);
					print render($block['content']);
				?>
			  </div> <!-- /#main-menu -->
			<?php endif; ?>
		</div>
	</div>
	<!--navigation close-->
	</div>
</header>

<div class="wrapper">

	<div id="main">
			<?php if ($page['highlighted']): ?>
				<div id="breadcrumb"><?php print html_entity_decode(render($page['highlighted'])); ?></div>
			<?php endif; ?>
			<?php if ($page['sidebar_first']): ?>
				<div id="sidebar-first" class="column sidebar"><div class="section">
					<?php print render($page['sidebar_first']); ?>
				</div></div> <!-- /.section, /#sidebar-first -->
			<?php endif; ?>
			<?php	
				if ($page['sidebar_first']){
					$content_class="rightportion";
				}else{
					$content_class="";
				}
			?>
			<div id="content" class="<?php echo $content_class; ?>" role="main">			
				<a id="main-content"></a>
				<?php print render($title_prefix); ?>
				<?php if ($title): ?>
					<h1 class="page__title title" id="page-title"><?php print t($title); ?></h1>
				<?php endif; ?>
				<?php print render($title_suffix); ?>
				<?php if ($messages): ?>
					<div id="messages"><div class="section clearfix">
					  <?php print html_entity_decode($messages); ?>
					</div></div> <!-- /.section, /#messages -->
				<?php endif; ?>
				<?php if ($page['featured']): ?>
					<div id="featured"><div class="section clearfix">
					  <?php print render($page['featured']); ?>
					</div></div> <!-- /.section, /#featured -->
				<?php endif; ?>
				
				<?php print render($tabs); ?>
				<?php print render($page['help']); ?>
				<?php if ($action_links): ?>
					<ul class="action-links"><?php print render($action_links); ?></ul>
				<?php endif; ?>
				<?php print cmf_preset_external_links(render($page['content'])); ?>
			<?php print $feed_icons; ?>
			</div>

			<div id="navigation">
			  <?php print render($page['navigation']); ?>
			</div>

			<?php if ($page['sidebar_second']): ?>
				<div id="sidebar-second" class="column sidebar"><div class="section">
					<?php print render($page['sidebar_second']); ?>
				</div></div> <!-- /.section, /#sidebar-second -->
			<?php endif; ?>

	</div>
</div>



<footer>
	<div class="footer_nav">
		<div class="wrapper">
		<a href="javascript:void(0)" class="footer_toggle_menu">
		<div class="rmm-toggled-controls"><div class="rmm-toggled-title">Footer Menu</div><div class="rmm-button"><span>&nbsp;</span><span>&nbsp;</span><span>&nbsp;</span></div></div>
		</a>
		<?php print render($page['footer']); ?>
		</div>
	</div>
	<div class="wrapper">
		<div class="footer_bottom">
			<div class="footer_logo">
				<div class="footer_img">
					<a href="#" class="footer_logo1"><img src="<?php echo $base_url.'/'.drupal_get_path('theme', 'gulmohar');?>/images/cqw-logo.png" alt="Footer logo" /></a>
					<a href="#" class="footer_logo2"><img src="<?php echo $base_url.'/'.drupal_get_path('theme', 'gulmohar');?>/images/foot_pow.png" alt="Footer logo" /></a>
				</div>
			</div>
			<div class="footer_content">
				<p class="cont1"><?php echo t("WebSite Designed Maintained and Hosted by");?></p>
				<p class="cont2"><?php echo t("National Informatics Centre( NIC )");?></p>
				<p class="cont1"><?php echo t("Content Managed By");?></p>
				<p class="cont2"><?php print t($site_name); ?></p>
			</div>
			<div class="footer_line3">
				<div class="language_changer">
					<?php 
						$block = module_invoke('gtranslate', 'block_view', 'gtranslate');
						print render($block['content']); 
					?>
				</div>
				<?php
					if(drupal_is_front_page()){ 
					$date =  get_site_last_update();
					}else{
					$date =  get_node_last_update();
					}
				?>
					<div class="footer_ind_link">
					<a href="http://india.gov.in/" target="_blank" title="India Portal"><img src="<?php echo $base_url.'/'.drupal_get_path('theme', 'gulmohar');?>/images/india_gov.png" alt="india gov logo" /></a>
					</div>
					<div class="footer_date"> Last Updated on : <?php echo $date;?> </div>
			</div>
		</div>
	</div>
</footer>

<?php

drupal_add_js(drupal_get_path('theme', 'gulmohar') .'/js/jquery.cycle.all.js', 'file');
drupal_add_js("$('#Events .view-display-id-page_3 .image-slider ul').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.evnt_next',
				prev:'.evnt_prev'
			});", "inline");


?>