class Lesson < ActiveRecord::Base

  include PermitsAttributes

  validates :title, presence: true

end
