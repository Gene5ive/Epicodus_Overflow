class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer_body, :presence => true
  validates :answer_author, :presence => true

end
