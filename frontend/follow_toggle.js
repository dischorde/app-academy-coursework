const APIUtil = require('./api_util.js');

class FollowToggle{
  constructor(el){
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.handleClick();
  }

  render(){
    let followed = (this.followState === 'followed' ? "Unfollow!" : "Follow!");
    this.$el.text(followed);
  }

  toggleFollow() {
    this.followState = (this.followState === 'followed' ? 'unfollowed' : 'followed');
  }

  handleClick() {
    this.$el.on('click', (e) => {
      e.preventDefault();
      if (this.followState === 'followed') {
        APIUtil.followUser(this.userId);
      }
      else {
        APIUtil.unfollowUser(this.userId);
      }
    });}}

module.exports = FollowToggle;
