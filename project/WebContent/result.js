  document.addEventListener("DOMContentLoaded", function () {
	    // 버스
	    var busLink = document.querySelector(".bus");
	    busLink.addEventListener("click", function (event) {
	        event.preventDefault();

	        busLink.style.backgroundColor = "lightgray";
	        busLink.style.borderRadius = "5px";

	        // 다른 버튼 스타일 초기화
	        trainLink.style.backgroundColor = "";
	        trainLink.style.borderRadius = "";

	        airplaneLink.style.backgroundColor = "";
	        airplaneLink.style.borderRadius = "";
	    });

	    // 기차
	    var trainLink = document.querySelector(".train");
	    trainLink.addEventListener("click", function (event) {
	        event.preventDefault();

	        trainLink.style.backgroundColor = "lightgray";
	        trainLink.style.borderRadius = "5px";

	        // 다른 버튼 스타일 초기화
	        busLink.style.backgroundColor = "";
	        busLink.style.borderRadius = "";

	        airplaneLink.style.backgroundColor = "";
	        airplaneLink.style.borderRadius = "";
	    });

	    // 항공
	    var airplaneLink = document.querySelector(".airplane");
	    airplaneLink.addEventListener("click", function (event) {
	        event.preventDefault();

	        airplaneLink.style.backgroundColor = "lightgray";
	        airplaneLink.style.borderRadius = "5px";

	        // 다른 버튼 스타일 초기화
	        busLink.style.backgroundColor = "";
	        busLink.style.borderRadius = "";

	        trainLink.style.backgroundColor = "";
	        trainLink.style.borderRadius = "";
	    });
	});
  
document.addEventListener("DOMContentLoaded", function () {
      var transportLinks = document.querySelectorAll('.transport a');

      function handleLinkClick(event) {
          event.preventDefault();

          transportLinks.forEach(function (link) {
              link.style.backgroundColor = 'rgba(24, 0, 0, 0)';
              link.style.borderRadius = '5px';
          });

          this.style.backgroundColor = 'lightgray';
          this.style.borderRadius = '5px';
      }

      transportLinks.forEach(function (link) {
          link.addEventListener('click', handleLinkClick);
      });
});



  function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: -34.397, lng: 150.644},
      zoom: 8
    });
  }
