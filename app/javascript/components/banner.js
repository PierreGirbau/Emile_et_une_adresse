import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Un bon verre", "Une bonne table", "Un bon artisan"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
