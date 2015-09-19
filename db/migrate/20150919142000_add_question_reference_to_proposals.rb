class AddQuestionReferenceToProposals < ActiveRecord::Migration
  def change
    add_reference :proposals, :question, index: true, foreign_key: true
  end
end
