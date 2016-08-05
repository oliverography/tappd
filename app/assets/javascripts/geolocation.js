  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
      navigator.geolocation.getCurrentPosition(setGeoCookie);
    } else {
      document.getElementById("demo").innerHTML = "Geolocation is not supported by this browser.";
    }
  }

  function showPosition(position) {
    document.getElementById("demo").innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
  }

  function setGeoCookie(position) {
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
  }

  console.log("ready!")