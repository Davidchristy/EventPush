<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>


<div id="form-container">
	<script src="js/facebook.js"></script>

	<form id="new-event-form" action="submit.jsp" method="post">

		<fieldset>
			<legend>Event Information</legend>

			<div class="form-block two-block">
				<label for="event-title">Event Title:</label><input type="text"
					id="event-title" name="event-title" required />
			</div>

			<div class="form-block two-block">
				<label for="description">Description:</label>
				<textarea name="description" id="description" rows="10" cols="80"></textarea>
			</div>

			<div class="form-block two-block">
				<label for="categgory">Category:</label> <select name="category-id"
					id="category-id">
					<option value="-1">---</option>
					<option value="1">Fundraiser</option>
					<option value="2">Party</option>
					<option value="3">Study Session</option>
				</select>
			</div>

			<div class="form-block four-block">
				<label for="start-date" class="first">Start Date:</label><input
					type="date" id="start-date" name="start-date" required /> <label
					for="start-time">Start Time:</label><input type="time"
					id="start-time" name="start-time" required /> <label
					for="end-date" class="first">End Date:</label><input type="date"
					id="end-date" name="end-date" required /> <label for="end-time">End
					Time:</label><input type="time" id="end-time" name="end-time" required />
			</div>
		</fieldset>

		<fieldset>
			<legend>Location</legend>

			<div class="form-block two-block">
				<label for="location-name">Location Name:</label><input type="text"
					id="location-name" name="location-name" />
			</div>

			<div class="form-block four-block">
				<label for="address" class="first">Address:</label><input
					type="text" id="address" name="address" required /> <label
					for="city">City:</label><input type="text" id="city" name="city"
					required /> <label for="city" class="first">State:</label><input
					type="text" id="state" name="state" required /> <label for="city">Zip:</label><input
					type="text" id="zip" name="zip" required />
			</div>
		</fieldset>
		<div class="submit-container">
			<input type="submit" id="submit" name="submit" value="Submit"
				onclick="checkLoginOnSubmit()" />
		</div>
	</form>
</div>