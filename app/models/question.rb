class Question < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :lesson, inverse_of: :questions
  has_one :answer, class_name: Proposal, foreign_key: :question_id, dependent: :destroy, inverse_of: :question

  validates :statement, presence: true
  validates :lesson, presence: true
  validates :answer, presence: true

  accepts_nested_attributes_for :answer, reject_if: lambda { |a| a[:statement].blank? }

end
