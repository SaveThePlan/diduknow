class Proposal < ActiveRecord::Base

  include PermitsAttributes

  validates :statement, presence: true

end
