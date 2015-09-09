class Course < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :courses
  has_many :chapters, inverse_of: :course, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true

end
