class Proposal < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :question, inverse_of: :answer

  validates :statement, presence: true
  validates :question, presence: true

end
