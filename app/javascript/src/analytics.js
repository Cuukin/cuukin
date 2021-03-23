// Code Snippet from YouTube Tutorial

// window.dataLayer = window.dataLayer || [];
// function gtag(){dataLayer.push(arguments);}

// gtag('js', new Date());

// document.addEventListener("turbolinks:load", function(event) {
//   gtag('config', 'G-28QE5MPYVP', {
//     page_location: event.data.url,
//     page_path: event.srcElement.location.pathname,
//     page_title: event.srcElement.title
//   });
// });

// export default gtag


// Code Snippet from Le Wagon's student

// Google Analytics with Turbolinks
document.addEventListener("turbolinks:load", function(event) {
  if (typeof ga === "function") {
    ga("set", "location", location.pathname);
    return ga("send", "pageview");
  }
});
// Google Analytics Events
$(document).on("click", ".button", function(event) {
  button_text = $(this).text();
  if (typeof ga === "function") {
    ga("send", "event", "button click", button_text);
  }
})
