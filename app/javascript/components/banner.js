import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  // new Typed('#banner-typed-text', {
  //   strings: ["Tourist", "Local"],
  //   typeSpeed: 70,
  //   loop: true
  // });
  new Typed('#banner-typed-text2', {
    strings: ["Paris", "Venice", "Barcelona", "Rio", "Phuket", "Mon Cul", "Monaco", "London"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
