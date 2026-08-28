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

  const showElem = document.querySelectorAll(".show_raty");
  if (showElem) {

    showElem.innerHTML = "";

    const score = showElem.dataset.socre;
    new Raty(showElem, {
      score: score,
      readOnly: true,
      starType: "img",
      path: "/",
      starOn: "star-on.png",
      starOff: "star-off.png",
      starHalf: "star-half.png",
    }).init();
  }
});