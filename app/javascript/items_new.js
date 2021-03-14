function calc (){
  const itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener('input', function(){
    const itemPriceValue = itemPrice.value
    const tax = 0.1
    const proto_tax = itemPriceValue * tax
    const tax_fee = Math.floor(proto_tax)
    const profit = itemPriceValue - tax_fee
    const taxResult = document.getElementById('add-tax-price')
    const profitResult = document.getElementById('profit')
    taxResult.innerHTML = tax_fee
    profitResult.innerHTML = profit
  })
}

window.addEventListener('load', calc) 