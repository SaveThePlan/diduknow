class Question < ActiveRecord::Base

  include PermitsAttributes

  validates :statement, presence: true

end
