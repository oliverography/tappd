// $( document ).ready(function() {

  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
      navigator.geolocation.getCurrentPosition(setGeoCookie);
      // navigator.geolocation.getCurrentPosition(setLatCookie);
      // navigator.geolocation.getCurrentPosition(setLngCookie);
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

  // function setLatCookie(position) {
  //   var cookie_val = position.coords.latitude;
  //   document.cookie = "lat=" + escape(cookie_val);
  // }

  // function setLngCookie(position) {
  //   var cookie_val = position.coords.longitude;
  //   document.cookie = "lng=" + escape(cookie_val);
  // }

  console.log("ready!")
// });