function value(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", (e) => {
    const taxPrice = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
     addTaxPrice.innerHTML = `${taxPrice}`;
    const profitCalc = itemPrice.value - taxPrice;
    const profit = document.getElementById("profit");
     profit.innerHTML = `${profitCalc}`;
  });
};

window.addEventListener("load", value);