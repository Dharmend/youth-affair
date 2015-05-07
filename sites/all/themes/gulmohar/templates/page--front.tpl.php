<?php
global $base_url;
?>
<script type="text/javascript" src="<?php echo $base_url;?>/sites/all/themes/gulmohar/js/jquery.flexisel.js"></script>
<script type="text/javascript"> 
	jQuery(document).ready(function () {
						
			var $mq =jQuery('.view-news .view-content').marquee({
					duration: 8000,
					pauseOnHover: true,
					delayBeforeStart: 0,
					duplicated: true
			});
			//Pause
			jQuery('.play_b').click(function(){
				$mq.marquee('resume');
				return false; 
			});

			//Resume
			jQuery('.stop_b').click(function(){
				
				$mq.marquee('pause');
				//alert($mq.marquee);
				return false; 
			});
		});
</script> 
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
				<?php $block = module_invoke('menu_block', 'block_view', 2);
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
		<div class="main_slide">  <?php print render($page['homeslider-portion']);?></div>
		<div class="main_content">
			<div class="home-rightportion">
				<?php if ($page['sidebar_first']): ?>
					<div id="sidebar-first" class="column sidebar"><div class="section">
						<?php print render($page['sidebar_first']); ?>
					</div></div> <!-- /.section, /#sidebar-first -->
				<?php endif; ?>
			</div>
			<div class="home-leftportion">
				<div class="left_row1">
				<div id="content" class="righttabbing" role="main">
					<?php if ($breadcrumb): ?>
						<div id="breadcrumb"><?php print $breadcrumb; ?></div>
					<?php endif; ?>
					<a id="main-content"></a>
					<?php print render($title_prefix); ?>
					<?php if ($title): ?>
						<h1 class="page__title title" id="page-title"><?php print $title; ?></h1>
					<?php endif; ?>
					<?php print render($title_suffix); ?>
					<?php if ($messages): ?>
						<div id="messages"><div class="section clearfix">
						  <?php print html_entity_decode($messages); ?>
						</div></div> <!-- /.section, /#messages -->
					<?php endif; ?>
					
				  <?php print render($tabs); ?>
				  <?php print render($page['help']); ?>
				  <?php if ($action_links): ?>
					<ul class="action-links"><?php print render($action_links); ?></ul>
				  <?php endif; ?>
				  <?php print cmf_preset_external_links(render($page['home_content'])); ?>
				  <?php //print $feed_icons; ?>
				</div>
				<?php if ($page['sidebar_second']): ?>
					<div id="sidebar-second" class="left_menu sidebar"><div class="section">
						<?php print render($page['sidebar_second']); ?>
					</div></div> <!-- /.section, /#sidebar-second -->
				<?php endif; ?>
				</div>
				<?php if ($page['triptych_first'] || $page['triptych_middle'] || $page['triptych_last']): ?>
				<div class="left_row2">
					<ul>
						<li> <?php print render($page['triptych_first']); ?></li>
						<li><?php print render($page['triptych_middle']); ?></li>
						<li><?php print render($page['triptych_last']); ?></li>
					</ul>
				</div>
				<?php endif; ?>
				
			</div>

			

		</div>
	</div>
	<?php if ($page['featured']): ?>
		<div class="left_row3">
			<?php print cmf_preset_external_links(render($page['featured'])); ?>
		</div>
	<?php endif; ?>
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
				<p class="cont1">WebSite Designed Maintained and Hosted by</p>
				<p class="cont2">National Informatics Centre( NIC )</p>
				<p class="cont1">Content Managed By</p>
				<p class="cont2"><?php print $site_name; ?></p>
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
   /* $(function () {
		$(".demo2").bootstrapNews({
            newsPerPage: 4,
            autoplay: true,
			pauseOnHover: true,
			navigation: false,
            direction: 'down',
            newsTickerInterval: 2500,
            onToDo: function () {
                //console.log(this);
            }
        });
   });*/
</script>