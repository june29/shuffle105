class Shuffle105VM
  constructor: ->
    @query       = ko.observable("ゴールデンボンバー")
    @result      = ko.observable(null)
    @tweetButton = ko.computed =>
      "<a href='https://twitter.com/share?url=http%3A%2F%2Fbit.ly%2FShuffle105&hashtags=Shuffle105&text=#{encodeURIComponent(@result())}' onclick='window.open(this.href, \"twitter_tweet\", \"width=550, height=450,personalbar=0,toolbar=0,scrollbars=1,resizable=1\"); return false;'>Tweet</a>"

  shuffle: =>
    @result(
      _(105).times =>
        _.sample(@query().split(//))
      .join("").replace(/'/g, "")
    )

$ ->
  ko.applyBindings(new Shuffle105VM(), document.getElementById("wrapper"))
