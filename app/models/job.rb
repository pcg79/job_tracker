class Job < ActiveRecord::Base
  validate :title, :presence => :true
  belongs_to :company

  state_machine :initial => :resume_submitted do
  end

end
