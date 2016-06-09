class Job < ActiveRecord::Base
  validate :title, :presence => :true
end
