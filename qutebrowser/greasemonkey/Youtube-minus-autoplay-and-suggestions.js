// ==UserScript==
// @name        YouTube minus autoplay and suggestions
// @description Removes suggestions in sidebar and end of video. Also disables autoplay.
// @version     1
// @grant       none
// @include     https://www.youtube.com/watch*
// ==/UserScript==

(function() {
  var styles = `
    #related { display: none !important; }
    .ytp-suggestion-set { display: none !important; }
  `

  document.head.appendChild((function(){
    var s = document.createElement("style");
    s.innerText = styles;
    return s;
  })());

  function disable_autoplay() {
    console.log("disable_autoplay");
    var autoplay_toggle = document.querySelector("#toggle");
    console.log(autoplay_toggle);
    if (!autoplay_toggle) {
      console.log("disable_autoplay(): Autoplay button not yet present. Will try again in 1s");
      window.setTimeout(disable_autoplay, 1000);

      return;
    }

    if (autoplay_toggle.attributes.getNamedItem("checked"))
      autoplay_toggle.dispatchEvent(new Event("click"));
  }

  function onready() {
    console.log("onready");
    disable_autoplay();
  }

  function checkonready() {
    if (document.readyState == "complete") {
      onready();
      onready = function () {};
    }
  }

  checkonready();
  document.addEventListener("readystatechange", checkonready);
})();
