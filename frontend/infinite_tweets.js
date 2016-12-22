const APIUtil = require('./api_util.js');

class InfiniteTweets{
  constructor(el){
    this.$el = $(el);
    this.maxCreatedAt = null;
    this.$el.find('a.fetch-more').on("click", (e) => {this.fetchTweets(e);})
;  }

  fetchTweets(e){
    console.log("fetched!");
    let data = null;
    if(this.maxCreatedAt)
    {data = {'max_created_at': this.maxCreatedAt};}
    APIUtil.fetchTweets(data).then(result => { this.insertTweets(result);
     });
   }

   insertTweets(result) {
     result.forEach((tweet) => {
     let $li = $('<li>');
     $li.text(JSON.stringify(tweet));
     this.$el.find('ul').append($li);
     });
     if(result.length<20){
       this.$el.find('a.fetch-more').remove();
       console.log("no more");
     } else {
     this.maxCreatedAt = result[result.length-1].created_at;
   }
   }

}

module.exports = InfiniteTweets;
