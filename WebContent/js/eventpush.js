/*
	eventpush.js
	Description: Functions for EventPush 
	Version: 1.0
	Author: Joshua Solomon, Karin Blanford
 */

jQuery(document).ready(function($) {

	/* alert("?v=7"); */

	var defaultView = "list";
	// Load default view:
	changeContentHtmlTo(defaultView);

	/***************************************************************************
	 * 
	 * Triggered when a navigation link is clicked. Adds the current class to
	 * the clicked tab.
	 *  /
	 **************************************************************************/

	$("#nav li").click(function() {

		$("#nav li").each(function() {
			$(this).children("a").removeClass("current");
		});// end each li

		// Enable the clicked tab
		$(this).children("a").addClass("current");
		;

		// call appropriate function

		var clickedTitle = $(this).attr("title");
		changeContentHtmlTo(clickedTitle);

	});// end click top_tag

	/***************************************************************************
	 * 
	 * Changes the content of #content-container to <page>.html's content via
	 * AJAX
	 *  /
	 **************************************************************************/

	function changeContentHtmlTo(page) {

		var params = "";
		if (page.toLowerCase() == "calendar") { //calendar params
			var d = new Date();
			var m = d.getMonth() + 1;
			var y = d.getFullYear();
			params="?y=" + y + "&m=" + m;
		}

		var url = page.toLowerCase() + ".jsp" + params;

		$.ajax({
			url : url
		}).done(function(html) {
			$("#content-container").html(html);
		});

	}// end changeContentHtmlTo(page)
	

	/***************************************************************************
	 * 
	 * If an element with the class open-single is clicked, get the eventID from
	 * the element's ID property and call the singleEventBoxFunction
	 *  /
	 **************************************************************************/

	$('body').on('click', '.open-single', function() {

		var clickedID = $(this).attr("id");
		singleEventBox(clickedID);
	});// end click open-single

	/***************************************************************************
	 * 
	 * Adds the single event box to the page body.
	 *
	 **************************************************************************/

	function singleEventBox(eventID) {

		var url = "single-event.jsp?eid=" + eventID;
		$.ajax({
			url : url
		}).done(function(html) {
			$("body").append(html);
		});
	}// end singleEventBox(eventID)

	/***************************************************************************
	 * 
	 * Removes the single event box to the page body when the
	 * single-event-container is clicked.
	 *  
	 **************************************************************************/

	$('body').on('click', '#single-event-container', function() {
		$(this).remove();
	});// end click single-event-container

	
	/***************************************************************************
	 * 
	 * Gets the previous calendar month by decrementing the m GET parameter
	 * when retrieving calendar.jsp via AJAX
	 *  
	 **************************************************************************/

	$('body').on('click', '.cal-arrow', function() {
		var params = "";
		var s = $("#cal-date").html();
		var d = new Date(s);
		if($(this).hasClass("prev")){
			var m = (d.getMonth() + 11)%12 + 1;
			var y = d.getFullYear();
			
			if(m == 12){
				y--;
			}
		}else{
			var m = (d.getMonth() + 1)%12 + 1;
			var y = d.getFullYear();
			if(m == 1){
				y++;
			}
		}
		
		/* TODO 	
		 * 	we might want to check for a minimum date and remove 
		 *	the back arrow, or max date and remove the next arrow
		 */
		
		params="?y=" + y + "&m=" + m;
		
		var url = "calendar.jsp" + params;

		$.ajax({
			url : url
		}).done(function(html) {
			$("#content-container").html(html);
		});
	});// end click prev-arrow


	
	/***************************************************************************
	 * 
	 * Gets geolocation from browser
	 * 
	 **************************************************************************/
	
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition, showError);
		} else {
			console.error("Geolocation is not supported by this browser.");
		}
	}

}); // end jQuery document ready

