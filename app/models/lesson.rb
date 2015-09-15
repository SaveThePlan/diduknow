class Lesson < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :chapter, inverse_of: :lessons

  validates :title, presence: true
  validates :chapter, presence: true

end
