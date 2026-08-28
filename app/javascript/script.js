document.addEventListener("turbo:load", () => {
  const elem = document.querySelector("#post_raty");
  if (!elem) return;

  new Raty(elem, {
    scoreName: "book[score]"
  }).init();
});
