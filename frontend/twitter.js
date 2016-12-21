const FollowToggle = require('./follow_toggle.js');

$(() =>{
  $('.FollowToggle').each((index, el) => {
    let followButton = new FollowToggle(el);
  });

});
