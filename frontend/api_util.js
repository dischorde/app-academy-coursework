const APIUtil = {

  followUser: id => APIUtil.updateFollowing(id, 'POST'),

  unfollowUser: id => APIUtil.updateFollowing(id, 'DELETE'),

  updateFollowing: (id, method) => {
    return $.ajax({
      url:`/users/${id}/follow`,
      dataType: 'json',
      method
    });
  }
};



module.exports = APIUtil;
