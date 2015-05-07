<?php

/**
 * @file
 * Default simple view template to display a list of rows.
 *
 * - $title : The title of this group of rows.  May be empty.
 * - $options['type'] will either be ul or ol.
 * @ingroup views_templates
 */
?>
<div class="org-wrapp">
    
<?php print $wrapper_prefix; ?>
  <?php if (!empty($title)) : ?>
    <h2>Organization</h2>
  <?php endif; ?>
    
  <?php print $list_type_prefix; ?>
    <?php foreach ($rows as $id => $row): ?>
      <li><?php print $row; ?></li>
    <?php endforeach; ?>
  <?php print $list_type_suffix; ?>
<?php print $wrapper_suffix; ?>
      
</div>
      
<!--<div class="org-wrapp">
<h2>Organisations</h2>
<ul>
<li><a href="#"><img src="image/org1.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org2.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org3.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org4.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org5.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org6.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org7.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org8.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org9.jpg" alt="organisation image" /></a></li>
<li><a href="#"><img src="image/org10.jpg" alt="organisation image" /></a></li>
</ul>
</div>-->
