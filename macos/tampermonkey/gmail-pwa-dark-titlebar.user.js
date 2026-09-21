// ==UserScript==
// @name         Gmail PWA Dark Titlebar
// @description  Updating color for gmail PWA
// @namespace    https://raw.githubusercontent.com/dencold/dotfiles
// @match        https://mail.google.com/*
// @run-at       document-start
// @grant        none
// @version      0.0.3
// @downloadURL  https://raw.githubusercontent.com/dencold/dotfiles/refs/heads/master/macos/tampermonkey/gmail-pwa-dark-titlebar.js
// @updateURL    https://raw.githubusercontent.com/dencold/dotfiles/refs/heads/master/macos/tampermonkey/gmail-pwa-dark-titlebar.js
// ==/UserScript==

(function() {
  const COLOR = '#202124'; // adjust to match your Gmail dark theme

  function setThemeColor() {
    let meta = document.querySelector('meta[name="theme-color"]');
    if (!meta) {
      meta = document.createElement('meta');
      meta.setAttribute('name', 'theme-color');
      document.head.appendChild(meta);
    }
    if (meta.getAttribute('content') !== COLOR) {
      meta.setAttribute('content', COLOR);
    }
  }

  setThemeColor();
  new MutationObserver(setThemeColor).observe(document.documentElement, {
    childList: true,
    subtree: true,
    attributes: true,
    attributeFilter: ['content']
  });
})();
