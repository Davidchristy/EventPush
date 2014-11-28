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
		
	</script>

	<div id="container">
		<header id="header-container">
			<div id="header-logo-container">
				<a href="/"><img src="images/logo.png" alt="EventPush Logo"
					title="Back to the home page." /></a>
			</div>

			<div id="user-info-tab">
				<a href="#" class="fb-login" onclick="checkloginstate();">
				 <!-- 				<fb:login-button --> <!-- 						scope="public_profile,email" onlogin="checkLoginState();"> --> <!-- 					</fb:login-button> -->

				</a>
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
			<!-- 			<div class="fb-like" data-href="http://www.eventpushtucson.com" -->
			<!-- 				data-layout="standard" data-action="like" data-show-faces="true" -->
			<!-- 				data-share="true"></div> -->
			<p>Copyright &copy; 2014 Karin Blanford, David Christy, Sam
				Ramirez, Joshua Solomon</p>
		</footer>
	</div>


</body>
</html>
