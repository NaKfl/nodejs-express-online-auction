var input = document.getElementById("input-bidding");
var inputAuto = document.getElementById("input-auto-bidding");
var bidStep = document.getElementById("bidStepp");
input.value = parseInt(input.value) + parseInt(bidStep.value);
inputAuto.value = parseInt(inputAuto.value) + 10*parseInt(bidStep.value);
input.disabled = true;
inputAuto.disabled=true;

function upInputBidding(bidStep) {
  var input = document.getElementById("input-bidding");
  input.value = parseInt(input.value) + parseInt(bidStep);
}

function upInputAutoBidding(bidStep) {
  var input = document.getElementById("input-auto-bidding");
  input.value = parseInt(input.value) + parseInt(bidStep);
}

function downInputBidding(bidStep, currenPrice) {
  var input = document.getElementById("input-bidding");
  if (parseInt(input.value) - parseInt(bidStep) > currenPrice) {
    input.value = parseInt(input.value) - parseInt(bidStep);
  }
}

function downInputAutoBidding(bidStep, currenPrice) {
  var input = document.getElementById("input-auto-bidding");
  if (parseInt(input.value) - parseInt(bidStep) > currenPrice) {
    input.value = parseInt(input.value) - parseInt(bidStep);
  }
}

function placeBid(idProduct) {
  var idUser = document.getElementById("userID");
  if (!idUser.value) {
    window.location.replace("/account/signin");
    return;
  }
  Swal.fire({
    title: "Are you sure?",
    text: `Bạn đặt giá cho sản phẩm là : ${input.value}`,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Sure!"
  }).then(result => {
    if (result.value) {
      idUser = document.getElementById("userID");
      var bidPrice = document.getElementById("input-bidding").value;
      var urlSend =
        "/bidding?userid=" +
        idUser.value +
        "&idproduct=" +
        idProduct +
        "&bidprice=" +
        bidPrice;
      $.ajax({
        url: urlSend,
        type: "GET"
      }).done(function(result) {
        if (result === "Bid Success") {
          Swal.fire("Thành công!", "Bạn đã đặt giá sản phẩm", "success").then(
            result => {
              window.location.replace(window.location.href);
            }
          );
        } else {
          if (result === "Banned") {
            Swal.fire("Fail!", "Banned", "warning");
          } else {
            if (result === "Enough") {
              Swal.fire(
                "Fail!",
                "You don't have enough reputation to bid",
                "warning"
              );
            } else {
              Swal.fire("Fail!", "Có người đặt giá cao hơn", "warning");
            }
          }
        }
      });
    }
  });
}

function placeAutoBid(idProduct) {
  var idUser = document.getElementById("userID");
  if (!idUser.value) {
    window.location.replace("/account/signin");
    return;
  }
  Swal.fire({
    title: "Are you sure?",
    text: `Bạn muốn tự động đấu giá tới mức: ${inputAuto.value}`,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Sure!"
  }).then(result => {
    if (result.value) {
      idUser = document.getElementById("userID");
      var bidPrice = document.getElementById("input-auto-bidding").value;
      var urlSend =
        "/bidding?userid=" +
        idUser.value +
        "&idproduct=" +
        idProduct +
        "&bidprice=" +
        bidPrice +
        "&isAuto=true";
      $.ajax({
        url: urlSend,
        type: "GET"
      }).done(function(result) {
        if (result === "Bid Success") {
          Swal.fire("Thành công!", "Bạn đã đặt giá sản phẩm", "success").then(
            result => {
              window.location.replace(window.location.href);
            }
          );
        } else {
          if (result === "Banned") {
            Swal.fire("Fail!", "Banned", "warning");
          } else {
            if (result === "Enough") {
              Swal.fire(
                "Fail!",
                "You don't have enough reputation to bid",
                "warning"
              );
            } else {
              Swal.fire("Fail!", "Có người đặt giá cao hơn", "warning");
            }
          }
        }
      });
    }
  });
}

function denyBidder(idProduct, idUser) {
  Swal.fire({
    title: "Are you sure?",
    text: "You won't be able to revert this!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Yes, deny it!"
  }).then(result => {
    if (result.value) {
      $.ajax({
        url: "/bidding/deny?idproduct=" + idProduct + "&userid=" + idUser,
        type: "GET"
      }).done(function(result) {
        console.log(result);
        if (result === "Success") {
          Swal.fire(
            "Denied!",
            "This has been banned from your product.",
            "success"
          ).then(result => {
            window.location.replace(window.location.href);
          });
        }
      });
    }
  });
}
