import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Un bon verre", "Une bonne table", "Du bon son"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
