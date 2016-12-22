const APIUtil = {

  followUser: id => APIUtil.updateFollowing(id, 'POST'),

  unfollowUser: id => APIUtil.updateFollowing(id, 'DELETE'),

  updateFollowing: (id, method) => {
    return $.ajax({
      url:`/users/${id}/follow`,
      dataType: 'json',
      method
    });
  },

  searchUsers: (queryVal, success) => {
    return $.ajax({
      url:"/users/search",
      data: {'query': queryVal},
      dataType: 'json',
      method: "GET",
      success
    });
  },

  createTweet: (data) => {
    return $.ajax({
      url: "/tweets",
      data: data,
      dataType: 'json',
      method: "POST"
    });
  },

  fetchTweets: (data) => {
    return $.ajax({
      url:"/feed",
      method:"GET",
      data,
      dataType: 'json'
    });
  }

};



module.exports = APIUtil;
