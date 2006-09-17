module ForumsHelper
  
  # used to know if a topic has changed since we read it last
  def recent_topic_activity(topic)
    return false if not logged_in?
    return topic.replied_at > (session[:topics][topic.id] || last_active)
  end 
  
  # used to know if a forum has changed since we read it last
  def recent_forum_activity(forum)
    return false unless logged_in? && forum.topics.first
    return forum.topics.first.replied_at > (session[:forums][forum.id] || last_active)
  end
  
end
