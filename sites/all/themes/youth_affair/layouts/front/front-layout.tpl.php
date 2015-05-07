<?php global $base_url,$language;?>
<header>

<!-- strat banner -->
<section class="banner">
	<div class="wrapper">
    	<!-- start bannerLeft -->
        <div class="bannerLeft">
        	<p class="titleText">It is my pleasure to congratulate and express best wishes to the NSS volunteers and all the functionaries of NSS on it’s 46th Foundation Day.</p>
            <a class="pinkMoreBtn" href="#">More..</a>
            <div class="speech">
                <h3>Sarbananda Sonowal</h3>
                <p>Hon'ble Minister of State (Independent Charge) Govt. of India.</p>
                <p>Ministry of Skill Development, Entrepreneurship, Youth Affairs &amp; Sports</p>
            </div>    
        </div>
        <!-- end bannerLeft -->
        <!-- start bannerRight -->
        <div class="bannerRight">
        	<ul class="bxslider">
                <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/banner_01.jpg" alt="banner_01" title="banner_01" /></li>
                <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/banner_01.jpg" alt="banner_01" title="banner_01" /></li>
                <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/banner_01.jpg" alt="slider3" title="banner_01" /></li>
            </ul>
        </div>
        <!-- end bannerRight -->
    </div>
</section>
<!-- end banner -->
<div class="spacer"></div>
<!-- social part -->
	<section class="social_main" id="content">
    	<div class="wrapper">
            <div class="social_first">
            	<h2>Latest News</h2>
                <ul class="social_text">
                	<li>
                    	<article>
                        	<p><a href="#">Calling For Tenzing Norgay National Adventure Award 2014</a></p>
                            <span>09 Feb 2015</span>
                            <ul class="more_social">
                              <li><a href="#">Read More...</a></li>
                              <li><a href="#"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/more_social.png" alt="" title=""></a></li>
                            </ul>
                        </article>
                    </li>
                    <li>
                    	<article>
                            <p><a href="#">Calling For Tenzing Norgay National Adventure Award 2014</a></p>
                            <span>09 Feb 2015</span>
                            <ul class="more_social">
                              <li><a href="#">Read More...</a></li>
                              <li><a href="#"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/more_social.png" alt="" title=""></a></li>
                            </ul>
                        </article>
                    </li>
                    <li>
                    	<article>
                            <p><a href="#">Calling For Tenzing Norgay National Adventure Award 2014</a></p>
                            <span>09 Feb 2015</span>
                            <ul class="more_social">
                              <li><a href="#">Read More...</a></li>
                              <li><a href="#"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/more_social.png" alt="" title=""></a></li>
                            </ul>
                        </article>
                    </li>
                </ul>
            </div>
            
            <div class="social_sec">
            	<h2>Proud Moments of Indian Sports</h2>
                <ul>
                	<li><a href="#">2012 London Olympics, 2 Silver and 4 Bronze Medals</a></li>
                    <li><a href="#">2011 World Cup Cricket, India</a></li>
                    <li><a href="#">2010 Asian Games, 14 Gold and 17 Silver and 33 Bronze</a></li>
                    <li><a href="#">2010 Commonwealth Games, 38 Gold and 27 Silver and 36 Bronze</a></li>
                    <li><a href="#">2008 Beijing Olympics, One Gold and two Bronze Medals</a></li>
                    <li><a href="#">2007 Twenty20 World Cup Cricket. South Africa</a></li>
                </ul>
            </div>
            
            <div class="social_third">
            	<a href="#" class="social_third_one">
                	<img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/annual_report.png" alt="annual_report" title="annual_report">
                	<span>Annual Report</span>
                    <p>Find all the Annual Report from 2007 to 2014</p>
                </a>
                
                <a href="#" class="social_third_two">
                	<img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/npyad.png" alt="npyad" title="npyad">
                	<span>NPYAD</span>
                    <p>National Programme for Youth and Adolescent Development</p>
                </a>
                
                <a href="#" class="social_third_three">
                	<img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/rti_act.png" alt="annual_report" title="annual_report">
                	<span>RTI ACT</span>
                    <p>National Programme for Youth and Adolescent Development</p>
                </a>
            </div>
            
        </div>
            
            
            
     <div class="l-main">
    <div class="l-content" role="main">
      <?php print render($page['highlighted']); ?>
      <?php print $breadcrumb; ?>
      <a id="main-content"></a>
      <?php print render($title_prefix); ?>
      <?php if ($title): ?>
        <h1><?php print $title; ?></h1>
      <?php endif; ?>
      <?php print render($title_suffix); ?>
      <?php print $messages; ?>
      <?php print render($tabs); ?>
      <?php print render($page['help']); ?>
      <?php if ($action_links): ?>
        <ul class="action-links"><?php print render($action_links); ?></ul>
      <?php endif; ?>
      <?php print render($page['content']); ?>
      <?php print $feed_icons; ?>
    </div>

    <?php print render($page['sidebar_first']); ?>
    <?php print render($page['sidebar_second']); ?>
  </div>       
            
            
            
            
            
    </section>
<!-- social part -->

<!-- start greyBg -->
<section class="greyBg">
	<div class="wrapper">
    	<ul>
        	<li>
            	<a href="#" class="greyBg_one"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/achievements.jpg" title="Initiatives, achievements, Roadmap" alt="Initiatives, achievements, Roadmap">
                	<span>Initiatives, achievements, Roadmap</span>
                 </a>
            </li>
            <li>
            	<a href="#" class="greyBg_two"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/youth_policy.jpg" title="National Youth Policy - 2014" alt="National Youth Policy - 2014">
                <span>National Youth Policy - 2014</span>
                </a>
          </li>
            <li>
            	<a href="#" class="greyBg_three"><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/gallery.jpg" title="Photo and Video Gallery" alt="Photo and Video Gallery">
                <span>Photo and Video Gallery</span></a>
            </li>
        </ul>
    </div>
    <div class="spacer"></div>
</section>
<!-- end greyBg -->

<!-- support partners -->
	<section class="wrapper">
    		<div class="partners">
            	<h3>SUPPORT ORGANISATIONS</h3>
                <ul>
                	<li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner01.jpg" alt="partner01" title="partner01"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner02.jpg" alt="partner02" title="partner02"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner03.jpg" alt="partner03" title="partner03"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner04.jpg" alt="partner04" title="partner04"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner05.jpg" alt="partner05" title="partner05"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner06.jpg" alt="partner06" title="partner06"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/images/partner07.jpg" alt="partner07" title="partner07"></li>
                    <li><img src="<?php echo $base_url;?>/sites/all/themes/youth_affair/sites/all/themes/youth_affair/images/partner08.jpg" alt="partner08" title="partner08"></li>
                </ul>
            </div>
    	<div class="spacer"></div>
    </section>
<!-- support partners -->
