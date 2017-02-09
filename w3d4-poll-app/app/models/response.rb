# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  answer_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :answer_id, :user_id, presence: true
  validate :not_duplicate_response, :not_own_poll

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

    has_one :question,
      through: :answer_choice,
      source: :question

    has_one :poll,
      through: :question,
      source: :poll

  def sibling_responses
    self.question.responses.where.not("responses.id = ?", self.id)
  end

  private

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:respondent] << "can't respond to a question twice"
    end
  end

  def not_own_poll
    if self.poll.author.id == user_id
      errors[:author] << "can't respond to own poll"
    end
  end
end
