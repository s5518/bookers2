document.addEventListener("turbo:load", () => {
  const postElem = document.querySelector("#post_raty");
  if (postElem) {

    postElem.innerHTML = "";

    new Raty(postElem, {
      scoreName: "book[star]",
      starType: "img",
      path: "/",
      starOn: "star-on.png",
      starOff: "star-off.png",
      starHalf: "star-half.png",
    }).init();
  }

  const showElems = document.querySelectorAll(".show_raty");
  if (showElems.length > 0) {
    showElems.forEach((elem) => {
    elem.innerHTML = "";

    const score = elem.dataset.score;
    new Raty(elem, {
      score: score,
      readOnly: true,
      starType: "img",
      path: "/",
      starOn: "star-on.png",
      starOff: "star-off.png",
      starHalf: "star-half.png",
    }).init();
  });
  }
});