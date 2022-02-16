class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # Cater for tweets that have been brought forward in time
    # 12 pm --> 8 am
    # 8 am: should publish the tweet and set the tweet_id
    # 12 pm: published, does nothing
    return if tweet.published?

    # Cater for tweets that have been rescheduled to the future
    # 9 am --> 1 pm
    # 9 am: publish_at not reached yet, does nothing
    # 1 pm: should publish the tweet and set the tweet_id
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
