class Company < ActiveRecord::Base
  validate :name, :presence => :true
  has_many :jobs
end
