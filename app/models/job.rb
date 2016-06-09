class Job < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :company

  state_machine :initial => :resume_submitted do
    event :move_forward do
      transition resume_submitted: :recruiter_contacted, recruiter_contacted: :initial_interviews, initial_interviews: :on_site_interviews
    end

    event :reject do
      transition all => :rejected
    end
  end
end
