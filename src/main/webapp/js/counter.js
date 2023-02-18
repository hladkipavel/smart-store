
let product = {
    id:"",
    price: 0,
    totalPrice: 0,
    count: 0
  }
  let products = [];

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
    let newProduct = editProduct(id.value, priceOfProduct.innerText, totalPrice.innerText, counter.innerText);
    products.push(newProduct);
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
    let newProduct = editProduct(id.innerText, priceOfProduct.innerText, totalPrice.innerText, counter.innerText);
    products.push(newProduct);
    
}
});

function editProduct(id, price, totalPrice, count){
    product.id = id;
    product.price = price;
    product.totalPrice = totalPrice;
    product.count = count;
    return product;
}

const btnChange = document.querySelector('.change');

btnChange.addEventListener('click', function(){
    // addInformation(arr).then(function(json){
    //   console.log(json);
    // });
     fetch(
      '/after-change',
      {
        headers: {'Content-Type': 'application/json' },
        body: JSON.stringify({products}),
        method: 'POST'
      })

});

// function addInformation(arr) {
//     return fetch(
//       '/after-change',
//       {
//         headers: {'Content-Type': 'application/json' },
//         body: JSON.stringify({products: arr}),
//         method: 'POST'
//       }
//     ).then(
//       function (resp) {
//         if(!resp.ok) {
//           alert('Wystąpił błąd! Otwórz devtools i zakładkę Sieć/Network, i poszukaj przyczyny');
//         }
//         return resp.json();
//       }
//     );
//   }
  
 