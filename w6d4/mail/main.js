const Router = require('./router.js');
const Inbox = require('./Inbox.js');

const Routes = function() {
  this.inbox = new Inbox;
};

document.addEventListener("DOMContentLoaded", function(event) {
   let lis = document.querySelectorAll('.sidebar-nav li');
   for (let i = 0; i < lis.length; i++) {
     let li = lis[i];

     li.addEventListener('click', (e) => {
       let location = li.innerText.toLowerCase();
       window.location.hash = location;
     });

     let content = document.querySelector('.content');
     let routes = new Routes();
     let router = new Router(content, routes);
     router.start();
   }
});
