const APIUtil = require('./api_util.js');

class TweetCompose{
  constructor(form){
    this.$form = $(form);
    this.content = this.$form.find('textarea');
    this.content.on("keydown", (e) => this.counter(e));
    this.$form.find("input[type='Submit']").on("click", (e) => {this.submit(e);});
    $('a.remove-mentioned-user').on("click", (e) => {this.removeMentionedUser(e);});
    this.$form.find("a.add-mentioned-user").on("click", (e) => {this.addMentionedUser(e);});

  }

  submit(e){
    e.preventDefault();
    this.$form.prop('disabled', true);
    let data = this.$form.serializeJSON();
    APIUtil.createTweet(data).then((res) => this.handleSuccess(res));
  }

  handleSuccess(res) {
    let ul = this.$form.data('tweets-ul');
    window.res = res;
    let $tweetString = $(`<li>${res.content} -- <a href='users/${res.user_id}'>${res.user.username}</a> -- ${res.updated_at}</li>`);
    $(ul).prepend($tweetString);
    this.clearInput();
    this.$form.prop('disabled', false);
  }

  clearInput () {
    this.content.val("");
    $('.chars-left').text("140");
    this.$form.find('div.mentioned-users').empty();
  }

  counter(e) {
    let counterChar = this.content.val().length;
    let counterText = String(139 - counterChar);
    $('.chars-left').text(counterText);
  }

  addMentionedUser(e) {
    let template = this.$form.find('script').html();
    this.$form.find('.mentioned-users').append(template);
    this.$form.find('a.remove-mentioned-user').on("click", (x) => {this.removeMentionedUser(x);});
    return false;
  }
  removeMentionedUser(e) {
    e.preventDefault();
    let $theDiv = $(e.currentTarget).parent();
    $theDiv.remove();
    return false;

  }
}

module.exports = TweetCompose;
