document.addEventListener('DOMContentLoaded', () => {
  let isLoggedIn = false; 

  if(isLoggedIn){
    document.querySelectorAll('.user').forEach(el => el.style.display='inline');
    document.querySelectorAll('.visitor').forEach(el => el.style.display='none');
  } else {
    document.querySelectorAll('.user').forEach(el => el.style.display='none');
    document.querySelectorAll('.visitor').forEach(el => el.style.display='inline');
  }
});
