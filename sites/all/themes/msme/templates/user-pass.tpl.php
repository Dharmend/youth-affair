<?php 
global $base_url;
//print_r($form);
drupal_set_title(t("Forgot Password"));
$form['name']['#description'] = t('');
?>
<div class="form_outer">
	<div class="form_row">
		<?php print render($form['name']);?>
	</div>
	<?php print render($form['actions']['submit']);?>
</div>
<div style="display: none;"><?php print drupal_render_children($form) ;?></div>