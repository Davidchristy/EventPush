<!DOCTYPE html>
<html>
<head>
<title>EventPush</title>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/eventpush.js?v=7"></script>
<script src="js/geolocation.js"></script>
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=742983259107637&version=v2.0";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<link rel="stylesheet" href="css/style.css?v=9">
</head>

<body>

	<div id="container">
		<header id="header-container">
			<div id="header-logo-container">
				<a href="/"><img src="images/logo.png" alt="EventPush Logo"
					title="Back to the home page." /></a>
			</div>

			<div id="user-info-tab">
				<a href="#" class="fb-login">Login</a>
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
			<div class="fb-like"
				data-href="https://developers.facebook.com/docs/plugins/"
				data-layout="standard" data-action="like" data-show-faces="true"
				data-share="true"></div>
			<p>Copyright &copy; 2014 Karin Blanford, David Christy, Sam
				Ramirez, Joshua Solomon</p>
		</footer>
	</div>


</body>
</html>
