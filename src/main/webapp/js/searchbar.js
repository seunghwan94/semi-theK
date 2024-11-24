/**
 *  const searchInput = document.getElementById('search-input');
 const searchHelper = document.getElementById('search-helper');

 if (searchInput && searchHelper) {
     searchInput.addEventListener('focus', () => {
         searchHelper.classList.remove('d-none'); 
         searchHelper.style.display = 'block';  
     });

     searchInput.addEventListener('blur', () => {
         setTimeout(() => {
             searchHelper.classList.add('d-none'); 
             searchHelper.style.display = 'none';  
         }, 200); 
     });
 } 
 * 
 * 
 * 
 * 
 */

