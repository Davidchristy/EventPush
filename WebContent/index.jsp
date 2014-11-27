<!DOCTYPE html>
<html>
<head>
<title>EventPush</title>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/eventpush.js?v=7"></script>
<script src="js/geolocation.js"></script>
<script src="//connect.facebook.net/en_US/all.js"></script>
<script src="js/facebook.js"></script>
<div id="fb-root"></div>
<link rel="stylesheet" href="css/style.css?v=9">
</head>

<body>
	<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// The response object is returned with a status field that lets the
			// app know the current login status of the person.
			// Full docs on the response object can be found in the documentation
			// for FB.getLoginStatus().
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				testAPI();
			} else if (response.status === 'not_authorized') {
				// The person is logged into Facebook, but not your app.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				// The person is not logged into Facebook, so we're not sure if
				// they are logged into this app or not.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
			}
		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '742983259107637',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.1' // use version 2.1
			});

			// Now that we've initialized the JavaScript SDK, we call 
			// FB.getLoginStatus().  This function gets the state of the
			// person visiting this page and can return one of three states to
			// the callback you provide.  They can be:
			//
			// 1. Logged into your app ('connected')
			// 2. Logged into Facebook, but not your app ('not_authorized')
			// 3. Not logged into Facebook and can't tell if they are logged into
			//    your app or not.
			//
			// These three cases are handled in the callback function.

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me',
							function(response) {
								console.log('Successful login for: '
										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.name + '!';
							});
		}
	</script>

	<div id="container">
		<header id="header-container">
			<div id="header-logo-container">
				<a href="/"><img src="images/logo.png" alt="EventPush Logo"
					title="Back to the home page." /></a>
			</div>

			<div id="user-info-tab">
<!-- 				<a href="#" class="fb-login">Login</a> -->
				<fb:login-button scope="public_profile,email"
					onlogin="checkLoginState();">
				</fb:login-button>
			</div>

			<ul id="nav">
				<li id="list-tab" title="List"><a href="#" class="current">List</a></li>
				<li id="calendar-tab" title="Calendar"><a href="#">Calendar</a></li>
				<li id="map-tab" title="Map"><a href="#">Map</a></li>
				<li id="create-tab" title="Create"><a href="#">Create</a></li>
			</ul>
		</header>

		<main id="content-container">
		<h1>LOADING...</h1>
		</main>


		<footer id="footer-container">
			<div class="fb-like" data-href="http://www.eventpushtucson.com"
				data-layout="standard" data-action="like" data-show-faces="true"
				data-share="true"></div>
			<p>Copyright &copy; 2014 Karin Blanford, David Christy, Sam
				Ramirez, Joshua Solomon</p>
		</footer>
	</div>


</body>
</html>
