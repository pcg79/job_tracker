class Job < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :company

  state_machine :initial => :resume_submitted do
    event :move_forward do
      transition resume_submitted: :recruiter_contacted,
                 recruiter_contacted: :initial_interviews,
                 initial_interviews: :code_challenge,
                 code_challenge: :on_site_interviews,
                 on_site_interviews: :salary_negotiation
    end

    event :reject do
      transition all => :rejected
    end
  end
end
