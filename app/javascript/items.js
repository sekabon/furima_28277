
window.onload = function(){
   const price = document.getElementById("item-price")
    price.addEventListener('keyup', function(){
      const price_value = price.value
      if( 300 <= price_value && price_value <= 9999999){
        const tax = document.getElementById("add-tax-price")
        tax.innerHTML = Math.floor(price_value * 0.1);
        const profit = document.getElementById("profit")
        profit.innerHTML = (price_value * 0.9 );
      }else{
        tax.innerHTML = ("");
        profit.innerHTML = ("");
      }
    })
}
