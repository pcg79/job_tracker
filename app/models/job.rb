class Job < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :company

  state_machine :initial => :resume_submitted do
  end

end
