<?php
global $base_url;
//print_r($form);
drupal_set_title($title = "Login", $output = CHECK_PLAIN);
$form['name']['#description'] = t('');
$form['pass']['#description'] = t('');
?>

<div class="form_outer">
	<div class="form_row">
		<?php print render($form['name']);?>
	</div>

	<div class="form_row">
		<?php print render($form['pass']);?>
	</div>
	<?php print render($form['actions']['submit']);?>
	<div class="forgot-pass">
		<a href="<?php echo $base_url;?>/user/password">Forgot Password?</a>
	</div>
</div>

<div style="display: none;"><?php print drupal_render_children($form) ;?></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('form').attr('autocomplete', 'off');
	});
</script>
