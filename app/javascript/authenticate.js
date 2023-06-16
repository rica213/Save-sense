document.addEventListener("turbo:load", function () {
  var myFormElmnt = document.querySelector("#new_user");

  var loginLink = document.querySelector("#login_link");
  if (loginLink) {
    loginLink.addEventListener("click", function (event) {
      event.preventDefault();
      myFormElmnt.submit();
    });
  }

  var signupLink = document.querySelector("#signup_link");
  if (signupLink) {
    signupLink.addEventListener("click", function (event) {
      event.preventDefault();
      myFormElmnt.submit();
    });
  }
});

