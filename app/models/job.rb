class Job < ActiveRecord::Base
  validate :title, :presence => :true
  belongs_to :company
end
