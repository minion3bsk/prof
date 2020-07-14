class Question < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :answers
  has_one :feed, as: :feedable, dependent: :destroy
  
  validates_presence_of :user_id, :text, :group_id
  after_create :create_feed
  
  def user_answer(user_id)
    Answer.find_by(question_id: id, user_id: user_id)
  end  
  
  def answered?(user)
    answers.exists?(user_id: user.id)
  end
  
  private
  def create_feed
    self.feed = Feed.create(group_id: self.group_id, updated_at: updated_at)
  end
end
