      window.fbAsyncInit = function() {
        FB.init({
          appId      : '742983259107637',
          xfbml      : true,
          version    : 'v2.1'
        });
      };

      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=742983259107637&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
      
      FB.getLoginStatus(function(response) {
    	  if (response.status === 'connected') {
    	    console.log('Logged in.');
    	  }
    	  else {
    	    FB.login();
    	  }
    	});