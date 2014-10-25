class Project < ActiveRecord::Base
  has_many :discussions

  validates :title, presence: true, uniqueness: {case_sensitive: false}
end
