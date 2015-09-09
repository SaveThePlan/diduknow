class Chapter < ActiveRecord::Base

  include PermitsAttributes

  # belongs_to :user, inverse_of: :courses

  validates :title, presence: true
  # validates :user, presence: true

end
