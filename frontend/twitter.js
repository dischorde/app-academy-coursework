const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$(() =>{
  $('.FollowToggle').each((index, el) => {
    let followButton = new FollowToggle(el);
  });

  $('nav.users-search').each((index, el) => {
    let usersSearch = new UsersSearch(el);
  });
});
