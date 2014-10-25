class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true
end
