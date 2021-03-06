const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = $('nav.users-search input');
    this.ul = $('nav.users-search ul');
    window.el = this.$el;
    this.input.on('keydown', (e) => this.handleInput(e));
    window.input = this.input;
  }

  handleInput(e){
    APIUtil.searchUsers(this.input.val(), (res) => {
      console.log(res);
      this.renderResults(res);});
  }

  renderResults(res){
    this.ul.empty();
    res.forEach((user) => {
      let newLi = $(`<li><a href='/users/${user.id}'>${user.username} </a></li>`);
      let button = $('<button></button>');
      let followState = (user.followed ? 'followed' : 'unfollowed');
      let follow = new FollowToggle(button, {userId: user.id, followState: followState});
      newLi.append(button);
      this.ul.append(newLi);
    });


  }

}

module.exports = UsersSearch;
