// Calendar
$(function() {

	/* initialize the external events
	 -----------------------------------------------------------------*/
	function ini_events(ele) {
		ele.each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title : $.trim($(this).text())
			// use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 1070,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});

		});
	}

	ini_events($('#external-events div.external-event'));

	
	/* initialize the calendar
	 -----------------------------------------------------------------*/
	//Date for the calendar events (dummy data)
	var date = new Date();
	var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
	$('#calendar')
			.fullCalendar(
					{
						header : {
							left : 'prev,next today, add',
							center : 'title',
							right : 'month,agendaWeek,agendaDay'
						},
						buttonText : {
							today : 'today',
							add : 'Add',
							month : 'month',
							week : 'week',
							day : 'day'
						},
						editable : true,
						//Random default events
						eventSources : [ {
							url : 'http://localhost:8080/QuanLyLichCaNhan/Calender_Event',
							type : 'GET',
							data : {
								id : 'id',
								title : 'title',
								allDay : 'allDay',
								start : 'start',
								end : 'end',
								url : 'url',								
								backgroundColor: 'backgroundColor',
								dow:'dow',
								resourceEditable : true
								
							},
							error : function() {
								alert('Lỗi không thể load dữ liệu!');
							}
						} ],
						
						
						droppable : true, // this allows things to be dropped onto the calendar !!!
						drop : function(date, allDay) { // this function is called when something is dropped

							// retrieve the dropped element's stored Event Object
							var originalEventObject = $(this).data(
									'eventObject');

							// we need to copy it, so that multiple events don't have a reference to the same object
							var copiedEventObject = $.extend({},
									originalEventObject);

							// assign it the date that was reported
							copiedEventObject.start = date;
							copiedEventObject.allDay = allDay;
							copiedEventObject.backgroundColor = $(this).css(
									"background-color");
							copiedEventObject.borderColor = $(this).css(
									"border-color");

							// render the event on the calendar
							// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
							$('#calendar').fullCalendar('renderEvent',
									copiedEventObject, true);

							// is the "remove after drop" checkbox checked?
							if ($('#drop-remove').is(':checked')) {
								// if so, remove the element from the "Draggable Events" list
								$(this).remove();
							}
						},
						eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
						    if (confirm("Bạn có muốn chuyển???")) {
						        UpdateEvent(event.id, event.start, event.end);
						        function UpdateEvent(EventID, EventStart, EventEnd) {
						    	    var dataRow = {
						    	        'id': EventID,
						    	        'start': EventStart,
						    	        'end': EventEnd
						    	    }
						    	    
						    	    $.ajax({
						    	        type: 'POST',
						    	        url: "http://localhost:8080/QuanLyLichCaNhan/Calender_Event",
						    	        dataType: "json",
						    	        contentType: "application/json",
						    	        data: JSON.stringify(dataRow)
						    	    }); 
						    	}
						    }
						    else {
						        revertFunc();
						    }  
						} ,
						eventResize: function(event, delta, revertFunc, jsEvent, ui, view) {

					        alert("Bạn thay đổi sự kiện "+event.title + " với thời gian kết thúc " + event.end.format()+" ?");
					        UpdateEvent(event.id, event.start, event.end);
					        function UpdateEvent(EventID, EventStart, EventEnd) {
					    	    var dataRow = {
					    	        'id': EventID,
					    	        'start': EventStart,
					    	        'end': EventEnd
					    	    }
					    	    
					    	    $.ajax({
					    	        type: 'POST',
					    	        url: "http://localhost:8080/QuanLyLichCaNhan/Calender_Event",
					    	        dataType: "json",
					    	        contentType: "application/json",
					    	        data: JSON.stringify(dataRow)
					    	    }); 
					    	}
				        	
					        if (!confirm("Đã thay đổi thành công!!!")) {
					        					        	
					            revertFunc();
					        }

					    }											

					});

	/* ADDING EVENTS */
	var currColor = "#3c8dbc"; //Red by default
	//Color chooser button
	var colorChooser = $("#color-chooser-btn");
	$("#color-chooser > li > a").click(function(e) {
		e.preventDefault();
		//Save color
		currColor = $(this).css("color");
		//Add color effect to button
		$('#add-new-event').css({
			"background-color" : currColor,
			"border-color" : currColor
		});
	});
	$("#add-new-event").click(function(e) {
		e.preventDefault();
		//Get value and make sure it is not null
		var val = $("#new-event").val();
		if (val.length == 0) {
			return;
		}

		//Create events
		var event = $("<div />");
		event.css({
			"background-color" : currColor,
			"border-color" : currColor,
			"color" : "#fff"
		}).addClass("external-event");
		event.html(val);
		$('#external-events').prepend(event);

		//Add draggable funtionality
		ini_events(event);

		//Remove event from text input
		$("#new-event").val("");

	});
});