
document.addEventListener("DOMContentLoaded",function(){

window.addEventListener('click', function(event){
  if(event.target.dataset.action === 'plus'){
    const alertTotal = event.target.closest('.alert');
    const counterWrapper = event.target.closest('.counter-wrapper');
    const counter = counterWrapper.querySelector('[data-counter]');
    counter.innerText = ++counter.innerText;
    const priceOfProduct = alertTotal.querySelector('.price');
    const totalPrice = alertTotal.querySelector('.total-price');
    const id = alertTotal.querySelector('.id');
    totalPrice.innerText = "$" + ((parseFloat((counter.innerText).replace('$', ''))) * (parseFloat((priceOfProduct.innerText).replace('$', '')))).toString();

    addInformation(id, counter);
  
}
if(event.target.dataset.action === 'minus'){
    const alertTotal = event.target.closest('.alert');
    const counterWrapper = event.target.closest('.counter-wrapper');
    const counter = counterWrapper.querySelector('[data-counter]');
        if(parseInt(counter.innerText) > 1){
    counter.innerText = --counter.innerText;    
    }
    const priceOfProduct = alertTotal.querySelector('.price');
    const totalPrice = alertTotal.querySelector('.total-price');
    const id = alertTotal.querySelector('.id');
    totalPrice.innerText = "$" + ((parseFloat((counter.innerText).replace('$', ''))) * (parseFloat((priceOfProduct.innerText).replace('$', '')))).toString();

    addInformation(id, counter);
    
}
});
});

function addInformation(id, counter){
  fetch('/after-change/' + id.value + '/' + counter.innerText).then(function(){console.log("error")});
}