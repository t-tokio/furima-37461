function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const fee = priceInput.value * 0.1 ;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${fee}`;
    const SalesProfit = priceInput.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load',count);