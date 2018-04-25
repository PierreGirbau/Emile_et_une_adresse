// function counter() {
//   const counter = document.querySelector(".counter")
//   console.log(counter)
//   const i = 2
//   counter.innerHTML = `<h1>${i}</h1>`
// };

let i = 0

function counter() {
  // const counter_all = document.querySelector(".counter").innerText
  var number = parseInt($('.counter').text());
  const counter = document.querySelector(".counter")
  if (i < 14) {
    i += 1
    counter.innerHTML = `<h1>${i}</h1>`
  } else {
    counter.innerHTML = `<h1>14 établissements au total!</h1>`
  }
  setInterval(counter, 500);
}


export { counter };
