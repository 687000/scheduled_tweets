class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    #Rescheduled to earily-two time
    #the second/newest will be accomplished first, made published?true
    #Then the next time/the first/old be performed, just return and do nothing.
    return if tweet.published?
    #Reschdduled a tweet to the future
    #Reschdduled to a later time
    #the first/old will be performed first, tweet.publish_at > Time.current 
    #just return and do nothing
    #the second/newest will perform normally
    return if tweet.publish_at > Time.current
    tweet.publish_to_twitter!
  end
end
