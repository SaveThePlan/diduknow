class Question < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :lesson, inverse_of: :questions

  validates :statement, presence: true
  validates :lesson, presence: true

end
