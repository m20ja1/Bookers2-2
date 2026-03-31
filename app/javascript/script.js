import Raty from "raty-js"

const initRaty = () => {
  const inputElem = document.querySelector("#post_raty");
  if (inputElem) {
    new Raty(inputElem, {
      scoreName: "book[score]",
      starOn: inputElem.dataset.starOn,
      starOff: inputElem.dataset.starOff,
      starHalf: inputElem.dataset.starHalf,
      path: ""
    }).init();
  }

  const readonlyElems = document.querySelectorAll(".show_raty");
  readonlyElems.forEach((elem) => {
    new Raty(elem, {
      readOnly: true,
      score: elem.dataset.score,
      starOn: elem.dataset.starOn,
      starOff: elem.dataset.starOff,
      starHalf: elem.dataset.starHalf,
      path: ""
    }).init();
  });
};

document.addEventListener("turbo:load", initRaty);
document.addEventListener("DOMContentLoaded", initRaty);