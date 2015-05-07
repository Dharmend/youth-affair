jQuery(document).ready(function(){
  jQuery(".toggle_menu").click(function(){
    jQuery(".nav ul").slideToggle('slow');
  });
});


jQuery(document).ready(function(){
 
  jQuery(".footer_toggle_menu").click(function(){
    jQuery(".footer_nav ul").slideToggle('slow');
  });
});




/**
 * Adds and removes classes to a list of links to allow keyboard accessibility
 *
 * @param string dropDownId
 * @param string hoverClass
 * @param int mouseOffDelay
 */

// JavaScript Document
/**
 * Adds and removes classes to a list of links to allow keyboard accessibility
 *
 * @param string dropDownId
 * @param string hoverClass
 * @param int mouseOffDelay
 */
function dropdown(dropdownId, hoverClass, mouseOffDelay) {
	if(dropdown = document.getElementById(dropdownId)) {
		var listItems = dropdown.getElementsByTagName('li');
		for(var i = 0; i < listItems.length; i++) {
			listItems[i].onmouseover = function() { this.className = addClass(this); }
			listItems[i].onmouseout = function() {
				var that = this;
				setTimeout(function() { that.className = removeClass(that); }, mouseOffDelay);
				this.className = that.className;
			}
			var anchor = listItems[i].getElementsByTagName('a');
			anchor = anchor[0];
			anchor.onfocus = function() { tabOn(this.parentNode); }
			anchor.onblur = function() { tabOff(this.parentNode); }
		}
	}
	
	function tabOn(li) {
		if(li.nodeName == 'LI') {
			li.className = addClass(li);
			tabOn(li.parentNode.parentNode);
		}
	}
	
	function tabOff(li) {
		if(li.nodeName == 'LI') {
			li.className = removeClass(li);
			tabOff(li.parentNode.parentNode);
		}
	}
	
	function addClass(li) { return li.className + ' ' + hoverClass; }
	function removeClass(li) { return li.className.replace(hoverClass, ""); }
}
function dropdown1(dropdownId, hoverClass, mouseOffDelay) {
	if(dropdown = document.getElementById(dropdownId)) {
		var listItems = dropdown.getElementsByTagName('li');
		for(var i = 0; i < listItems.length; i++) {
			listItems[i].onmouseover = function() { this.className = addClass(this); }
			listItems[i].onmouseout = function() {
				var that = this;
				setTimeout(function() { that.className = removeClass(that); }, mouseOffDelay);
				this.className = that.className;
			}
			var anchor = listItems[i].getElementsByTagName('a');
			anchor = anchor[0];
			anchor.onfocus = function() { tabOn(this.parentNode); }
			anchor.onblur = function() { tabOff(this.parentNode); }
		}
	}
	
	function tabOn(li) {
		if(li.nodeName == 'LI') {
			li.className = addClass(li);
			tabOn(li.parentNode.parentNode);
		}
	}
	
	function tabOff(li) {
		if(li.nodeName == 'LI') {
			li.className = removeClass(li);
			tabOff(li.parentNode.parentNode);
		}
	}
	
	function addClass(li) { return li.className + ' ' + hoverClass; }
	function removeClass(li) { return li.className.replace(hoverClass, ""); }
}

$(document).ready(function(){
	

	
	$("#main-menu div" ).children().attr("id","nav");
	
	dropdown('nav','hover',10);
	/*$('#Events .view-display-id-page_3 .image-slider ul').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.awrd_next',
				prev:'.awrd_prev'
			});*/
	//alert(1);
	$("#sidebar-first .menu-block-wrapper" ).children().attr("id","side_nav");
		//alert('okk');
	dropdown1('side_nav','hover',10);
	$("#sidebar-second .menu-block-wrapper" ).children().attr("id","side_nav");
		//alert('okk');
	dropdown1('side_nav','hover',10);
});

/*

* Cookies Set Get Delete Definations

*/

// JavaScript Document
//Style Sheet Switcher version 1.1 Oct 10th, 2006
//Author: Dynamic Drive: http://www.dynamicdrive.com
//Usage terms: http://www.dynamicdrive.com/notice.htm

var manual_or_random="manual" //"manual" or "random"
var randomsetting="3 days" //"eachtime", "sessiononly", or "x days (replace x with desired integer)". Only applicable if mode is random.

//////No need to edit beyond here//////////////

function getCookie(Name) { 
var re=new RegExp(Name+"=[^;]+", "i"); //construct RE to search for target name/value pair
if (document.cookie.match(re)) //if cookie found
return document.cookie.match(re)[0].split("=")[1] //return its value
return null
}

function setCookie(name, value, days) {
var expireDate = new Date()
//set "expstring" to either future or past date, to set or delete cookie, respectively
var expstring=(typeof days!="undefined")? expireDate.setDate(expireDate.getDate()+parseInt(days)) : expireDate.setDate(expireDate.getDate()-5)
document.cookie = name+"="+value+"; expires="+expireDate.toGMTString()+"; path=/";
}

function deleteCookie(name){
setCookie(name, "moot")
}


	function setStylesheet(title, randomize){ //Main stylesheet switcher function. Second parameter if defined causes a random alternate stylesheet (including none) to be enabled
	var i, cacheobj, altsheets=[""]
	for(i=0; (cacheobj=document.getElementsByTagName("link")[i]); i++) {
	if(cacheobj.getAttribute("rel").toLowerCase()=="alternate stylesheet" && cacheobj.getAttribute("title")) { //if this is an alternate stylesheet with title

	cacheobj.disabled = true
	altsheets.push(cacheobj) //store reference to alt stylesheets inside array
	if(cacheobj.getAttribute("title") == title) //enable alternate stylesheet with title that matches parameter
	cacheobj.disabled = false //enable chosen style sheet
	}
	}
	if (typeof randomize!="undefined"){ //if second paramter is defined, randomly enable an alt style sheet (includes non)
	var randomnumber=Math.floor(Math.random()*altsheets.length)
	altsheets[randomnumber].disabled=false
	}
	jQuery.each(jQuery.browser, function(i, val) {
										// alert(i+"==="+val);
		  if(i == "safari" && val == true){
			 // alert(i);
			  if(title == "change"){
				$("link[title=change]").attr("rel","stylesheet");
				$("link[title=change]").attr("href","/sites/all/themes/adaptivetheme/npi_adaptive/css/override.css");
			  }else{
				  $("link[title=change]").attr("rel","alternate stylesheet");
				  $("link[title=change]").attr("href","/sites/all/themes/adaptivetheme/npi_adaptive/css/normal.css");
			  }
		  }
		});
	return (typeof randomize!="undefined" && altsheets[randomnumber]!="")? altsheets[randomnumber].getAttribute("title") : "" //if in "random" mode, return "title" of randomly enabled alt stylesheet
}

function chooseStyle(styletitle, days){ //Interface function to switch style sheets plus save "title" attr of selected stylesheet to cookie
	if (document.getElementById){  
		if(styletitle=="change"){
			if(getCookie("mysheet")!="change"){
				setCookie("theme", getCookie("mysheet"), days)
			}
			setCookie("mysheet", styletitle, days)
			setStylesheet(styletitle)
		}else{ 	
			if(styletitle == "none") {
				if(getCookie("theme") !="none") {
					setCookie("mysheet", getCookie("theme"), days)
					setStylesheet(getCookie("theme"))
				} else {
					setCookie("mysheet", styletitle, -1)
					setCookie("theme", getCookie("mysheet"), -1)
				}
			} else {
				setCookie("mysheet", styletitle, days)
				setCookie("theme", getCookie("mysheet"), days)
				setStylesheet(styletitle)
			}	
		}
	}
}
function getActiveStyleSheet() {
  var styleTag;
  var styleSwitch;
  var styleTitle='';
  for(var i=0; (styleTag = document.getElementsByTagName("link")[i]); i++) {
	if(styleTag.getAttribute("title")=="switch") {styleSwitch=styleTag;}
  }
  for(var i=0; (styleTag = document.getElementsByTagName("link")[i]); i++) {
	if(styleTag.getAttribute("rel").indexOf("alternate stylesheet")!=-1 && styleTag.getAttribute("title")) {
		if(styleTag.getAttribute("href")==styleSwitch.getAttribute("href ")) {styleTitle=styleTag.getAttribute("title");}
	}
	}
  return styleTitle;
}