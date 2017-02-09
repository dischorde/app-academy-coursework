const APIUtil = require('./api_util.js');

class FollowToggle{
  constructor(el, options){
    this.$el = $(el);
    this.userId = this.$el.data('user-id') || options.userId;
    this.followState = this.$el.data('initial-follow-state') || options.followState;
    this.render();
    this.handleClick();
  }

  render(){
    this.$el.prop("disabled", false);
    let followed = (this.followState === 'followed' ? "Unfollow!" : "Follow!");
    this.$el.text(followed);

  }

  toggleFollow() {
    this.followState = (this.followState === 'followed' ? 'unfollowed' : 'followed');
  }

  toggleButton(res){
    this.toggleFollow();
    this.render();
  }

  handleClick() {
    this.$el.on('click', (e) => {
      this.$el.prop("disabled", true);
      e.preventDefault();
      if (this.followState === 'followed') {
        APIUtil.unfollowUser(this.userId).then(res => this.toggleButton(res));
      }
      else {
        APIUtil.followUser(this.userId).then(res => this.toggleButton(res));
      }
    });
  }
}

module.exports = FollowToggle;
