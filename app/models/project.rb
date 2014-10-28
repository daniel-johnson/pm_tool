class Project < ActiveRecord::Base
  has_many :discussions
  has_many :tasks

  validates :title, presence: true, uniqueness: {case_sensitive: false}
end
