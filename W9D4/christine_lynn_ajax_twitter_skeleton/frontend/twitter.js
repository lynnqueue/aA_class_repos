const FollowToggle = require ("./follow_toggle");

$(function () {
  $('.follow-toggle').each(function (index) {
    new FollowToggle($('.follow-toggle')[index]);
  })
})