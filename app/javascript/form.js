document.addEventListener("turbo:load", function () {
  var newCategoryForm = document.getElementById("new_category");
  var newTrade = document.getElementById("new_trade");

  /* Submit form that add a new category */
  var saveCategoryBtn = document.querySelector("#save_category");
  if (saveCategoryBtn) {
    saveCategoryBtn.addEventListener("click", function (event) {
      event.preventDefault();
      newCategoryForm.submit();
    });
  }

  /* Submit form that add a new transaction */
  var saveTradeBtn = document.querySelector("#save_trade");
  if (saveTradeBtn) {
    saveTradeBtn.addEventListener("click", function (event) {
      event.preventDefault();
      newTrade.submit();
    });
  }
});
