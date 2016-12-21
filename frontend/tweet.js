const APIUtil = require('./api_util.js');

class TweetCompose{
  constructor(el){
    this.$el = $(el);
    this.content = $('.tweet-compose textarea');
    this.form = $('.tweet-compose');
    this.content.on("keydown", (e) => this.counter(e));
    $(".tweet-compose input[type='Submit']").on("click", (e) => {this.submit(e);});
  }
  submit(e){
    e.preventDefault();
    this.form.prop('disabled', true);
    let data = this.form.serializeJSON();
    APIUtil.createTweet(data).then((res) => this.handleSuccess(res));
  }

  handleSuccess(res) {
    let ul = this.$el.data('tweets-ul');
    window.res = res;
    let $tweetString = $(`<li>${res.content} -- <a href='users/${res.user_id}'>${res.user.username}</a> -- ${res.updated_at}</li>`);
    $(ul).prepend($tweetString);
    this.clearInput();
    this.form.prop('disabled', false);
  }

  clearInput () {
    this.content.val("");
    $('.chars-left').text("140");
  }

  counter(e) {
    let counterChar = this.content.val().length;
    let counterText = String(139 - counterChar);
    $('.chars-left').text(counterText);
  }

}

module.exports = TweetCompose;
