class Chapter < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :course, inverse_of: :chapters

  validates :title, presence: true
  validates :course, presence: true

end
