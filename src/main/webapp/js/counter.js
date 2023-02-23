
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
      const dataTogle2 = this.document.querySelector('#dropdown');
      const dataTogle = dataTogle2.children[1].children[0].innerText;
      const allCount = this.document.querySelectorAll('[data-counter]');
      dataTogle.innerText = countAll(allCount);
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

    addInformation(id, counter, totalPrice);   
}
if(event.target.dataset.action === 'delete'){
  const alertTotal = event.target.closest('.alert');
  const id = alertTotal.querySelector('.id');
  deleteRow(id);
}
});
});

function addInformation(id, counter){
  fetch('/after-change/' + id.value + '/' + counter.innerText).then(function(){console.log("error")});
}

function deleteRow(id){
  fetch('/delete/' + id.value).then(function(){console.log("error")});
}
function countAll(allCount){
    console.log("allcount",allCount);
    const newArr = [];
  const arr = Array.from(allCount).forEach(element => {
  newArr.push(parseInt(element.innerText));
  });
  let sum = 0;
  for (let i=0; i<newArr.length; i++) {
    sum += newArr[i];
  }
  return sum;
}