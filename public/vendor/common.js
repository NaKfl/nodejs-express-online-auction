(function($) {
  "use strict";

  // Mobile Nav toggle
  $(".menu-toggle > a").on("click", function(e) {
    e.preventDefault();
    $("#responsive-nav").toggleClass("active");
  });

  // Fix cart dropdown from closing
  $(".cart-dropdown").on("click", function(e) {
    e.stopPropagation();
  });

  /////////////////////////////////////////

  // Products Slick
  $(".products-slick").each(function() {
    var $this = $(this),
      $nav = $this.attr("data-nav");

    $this.slick({
      slidesToShow: 5,
      slidesToScroll: 1,
      draggable: false,
      autoplay: false,
      infinite: true,
      speed: 200,
      dots: false,
      arrows: false,
      appendArrows: $nav ? $nav : false,
      responsive: [
        {
          breakpoint: 991,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    });
  });

  // Products Widget Slick
  $(".products-widget-slick").each(function() {
    var $this = $(this),
      $nav = $this.attr("data-nav");

    $this.slick({
      infinite: true,
      autoplay: true,
      speed: 300,
      dots: false,
      arrows: true,
      appendArrows: $nav ? $nav : false
    });
  });

  /////////////////////////////////////////

  // Product Main img Slick
  $("#product-main-img").slick({
    infinite: true,
    speed: 300,
    dots: false,
    arrows: true,
    fade: true,
    asNavFor: "#product-imgs"
  });

  // Product imgs Slick
  $("#product-imgs").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows: true,
    centerMode: true,
    focusOnSelect: true,
    centerPadding: 0,
    vertical: true,
    asNavFor: "#product-main-img",
    responsive: [
      {
        breakpoint: 991,
        settings: {
          vertical: false,
          arrows: false,
          dots: true
        }
      }
    ]
  });

  // Product img zoom
  var zoomMainProduct = document.getElementById("product-main-img");
  if (zoomMainProduct) {
    $("#product-main-img .product-preview").zoom();
  }

  /////////////////////////////////////////

  // Input number
  // $('.input-number').each(function() {
  // 	var $this = $(this),
  // 	$input = $this.find('input[type="number"]'),
  // 	up = $this.find('.qty-up'),
  // 	down = $this.find('.qty-down');

  // 	down.on('click', function () {
  // 		var value = parseInt($input.val()) - 1;
  // 		value = value < 1 ? 1 : value;
  // 		$input.val(value);
  // 		$input.change();
  // 		updatePriceSlider($this , value)
  // 	})

  // 	up.on('click', function () {
  // 		var value = parseInt($input.val()) + 1;
  // 		$input.val(value);
  // 		$input.change();
  // 		updatePriceSlider($this , value)
  // 	})
  // });

  function updatePriceSlider(elem, value) {
    if (elem.hasClass("price-min")) {
      console.log("min");
      priceSlider.noUiSlider.set([value, null]);
    } else if (elem.hasClass("price-max")) {
      console.log("max");
      priceSlider.noUiSlider.set([null, value]);
    }
  }

  // Price Slider
  var priceSlider = document.getElementById("price-slider");
  if (priceSlider) {
    noUiSlider.create(priceSlider, {
      start: [1, 999],
      connect: true,
      step: 1,
      range: {
        min: 1,
        max: 999
      }
    });

    priceSlider.noUiSlider.on("update", function(values, handle) {
      var value = values[handle];
      handle ? (priceInputMax.value = value) : (priceInputMin.value = value);
    });
  }
})(jQuery);

const countDown = (countDownDate, elementID) => {
  const intervalId = setInterval(function() {
    var now = new Date().getTime();

    var distance = countDownDate - now;

    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor(
      (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
    );
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    elementID.innerHTML =
      days + "d " + hours + "h " + minutes + "m " + seconds + "s";

    if (distance < 0) {
      clearInterval(intervalId);
      elementID.innerHTML = "Expried";
    }
  }, 1000);
};

const countDownArray = document.getElementsByClassName("product-time-left");
for (const item of countDownArray) {
  const countDownDate = item.innerHTML;
  countDown(new Date(countDownDate).getTime(), item);
}

const countDownDetailProductArray = document.getElementsByClassName("product-available");
for (const item of countDownDetailProductArray) {
  const countDownDate = item.innerHTML;
  console.log(countDownDate);
  countDown(new Date(countDownDate).getTime(), item);
}
