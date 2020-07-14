class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_one :feed, as: :feedable, dependent: :destroy
  
  after_create :create_feed
  after_update :update_feed
  
  private
  def create_feed
    self.feed = Feed.create(group_id: self.question.group_id, updated_at: updated_at)
  end
  
  def update_feed
    feed.update(updated_at: updated_at)
  end
end
