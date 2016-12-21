const APIUtil = {
  followUser: id => {
    $.ajax({
      url: `${id}/follow`,
      method: `POST`,
      dataType: 'json',
      }).then((res) => this.toggleButton(res));
    },

  unfollowUser: id => {
    $.ajax({
      url: `${id}/follow`,
      method: `DELETE`,
      dataType: 'json',
    }).then((res) => this.toggleButton(res));
    },

  toggleButton(res){
    this.toggleFollow();
    this.render();
  }
  };

module.exports = APIUtil;
