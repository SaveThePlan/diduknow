class Lesson < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :chapter, inverse_of: :lessons
  has_many :questions, inverse_of: :lesson, dependent: :destroy

  validates :title, presence: true
  validates :chapter, presence: true

end
