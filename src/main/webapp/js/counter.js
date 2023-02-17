const btnMuinus = document.querySelector('[data-action="minus"]');
const btnPlus = document.querySelector('[data-action="plus"]');
const counter = document.querySelector('[data-counter]');

btnMuinus.addEventListener('click', function(){
counter.innerText = --counter.innerText; 
});

btnPlus.addEventListener('click', function(){
    counter.innerText = ++counter.innerText; 
});