class Chapter < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :course, inverse_of: :chapters
  has_many :lessons, inverse_of: :chapter, dependent: :destroy

  validates :title, presence: true
  validates :course, presence: true

end
