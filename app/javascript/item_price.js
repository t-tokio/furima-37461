function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const fee = Math.floor(priceInput.value * 0.1) ;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${fee}`;
    const SalesProfit = Math.floor(priceInput.value - fee) ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load',count);