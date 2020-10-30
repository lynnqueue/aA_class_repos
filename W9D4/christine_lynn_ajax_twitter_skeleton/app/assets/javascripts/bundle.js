/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: top-level-this-exports, module */
/***/ (function(module) {

const APIUtil = {
  followUser: id => {
    $.ajax({
      method: "POST",
      url: `/users/${id}/follow`,
      dataType: 'json',
      success: () => {
        this.followState = true;
        this.render();
      }
    });
  },

  unfollowUser: id => {
    $.ajax({
      method: "DELETE",
      url: `/users/${this.userId}/follow`,
      dataType: "json",
      success: () => {
        this.followState = false;
        this.render();
      },
    });
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/*! CommonJS bailout: module.exports is used directly at 38:0-14 */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

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


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
const FollowToggle = __webpack_require__ (/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(function () {
  $('.follow-toggle').each(function (index) {
    new FollowToggle($('.follow-toggle')[index]);
  })
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map