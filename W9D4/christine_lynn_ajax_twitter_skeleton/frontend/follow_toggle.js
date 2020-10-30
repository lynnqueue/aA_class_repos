const APIUtil = require("./api_util");

class FollowToggle {
    constructor (el) {
      this.$el = $(el);
      this.userId = this.$el.data("user-id"); //how do we access userId
      this.followState = this.$el.data("initial-follow-state");
      

      this.render();

      this.$el.on('click', this.handleClick.bind(this))
    }

    render () {
      if (this.followState === false) {
        this.$el.html("Follow!");
      } else {
        this.$el.html("Unfollow!");
      }
    }

    handleClick(e) {
      debugger
      e.preventDefault();
      if (this.followState === false)  {
        APIUtil.followUser(this.userId).then(successFollow);
      } else {
        
      }
        
    }

}



module.exports = FollowToggle;
