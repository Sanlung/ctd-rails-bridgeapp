document.addEventListener("DOMContentLoaded", (e) => {
  (function () {
    const navbar = document.querySelector(".navbar");
    let scrollpos = window.scrollY;
    function checkScroll() {
      scrollpos = window.scrollY;
      if (scrollpos > 450) {
        navbar.className =
          "navbar navbar-expand-md navbar-dark bg-dark fixed-top shadow-lg";
      } else if (scrollpos > 100) {
        navbar.className =
          "navbar navbar-expand-md navbar-light bg-light fixed-top";
      } else {
        navbar.className = "navbar navbar-expand-md navbar-dark fixed-top";
      }
    }

    window.addEventListener("scroll", checkScroll);
  })();
});
