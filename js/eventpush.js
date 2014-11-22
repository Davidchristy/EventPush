/*
	eventpush.js
	Description: Functions for EventPush 
	Version: 1.0
	Author: Joshua Solomon
*/


jQuery(document).ready(function($) {

	/*alert("?v=7");*/

	var defaultView = "list";
	//Load default view:
	changeContentHtmlTo(defaultView);

	/*******************************************************************************
	*
	* Triggered when a navigation link is clicked. Adds the current class to the 
	* clicked tab.
	*
	/******************************************************************************/

	$("#nav li").click(function(){
		
		$("#nav li").each(function(){
			$(this).children("a").removeClass("current");
		});//end each li
		
		//Enable the clicked tab
		$(this).children("a").addClass("current");;
		
		//call appropriate function
		
		var clickedTitle  = $(this).attr("title");	
		changeContentHtmlTo(clickedTitle);
		
	});//end click top_tag
	
	
	
	/*******************************************************************************
	*
	* Changes the content of #content-container to <page>.html's content via Ajax
	*
	/******************************************************************************/
	
	function changeContentHtmlTo(page){
		
		var ext = ".html";
		console.log(page);
		if(page.toLowerCase() == "list"){
			
			ext = ".jsp";
		}
		
		
		var url = page.toLowerCase()+".jsp";
		
		$.ajax({url: url}).done(function(html){
			$("#content-container").html(html);
		});
		
	}//end changeContentHtmlTo(page)
	
	
	
	/*******************************************************************************
	*
	* If an element with the class open-single is clicked, get the eventID from the
	* element's ID property and call the singleEventBoxFunction
	*
	/******************************************************************************/
	
	$('body').on('click', '.open-single', function(){
		
		var clickedID  = $(this).attr("id");
		singleEventBox(clickedID);
	});//end click open-single
	
	
	
	/*******************************************************************************
	*
	* Adds the single event box to the page body.
	*
	/******************************************************************************/
	
	function singleEventBox(eventID){
		
		var url = "single-event.jsp?eid="+eventID;
		$.ajax({url: url}).done(function(html){
			$("body").append(html);
		});
	}//end singleEventBox(eventID)
	
	/*******************************************************************************
	*
	* Removes the single event box to the page body when the single-event-container
	* is clicked.
	*
	/******************************************************************************/
	
	$('body').on('click', '#single-event-container', function(){
		$(this).remove();
	});//end click single-event-container
	
}); //end jQuery document ready

