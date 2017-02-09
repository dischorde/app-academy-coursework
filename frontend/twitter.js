const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet.js');
const InfiniteTweets = require('./infinite_tweets.js');

$(() =>{
  $('.FollowToggle').each((index, el) => {
    let followButton = new FollowToggle(el);
  });

  $('nav.users-search').each((index, el) => {
    let usersSearch = new UsersSearch(el);
  });

  $('.tweet-compose').each((index,el) => {
    let tweetCompose = new TweetCompose(el);
  });

$('div.infinite-tweets').each((index,el) => {
  let infiniteTweets = new InfiniteTweets(el);
});
});
