class Task < ActiveRecord::Base
  belongs_to :project 
  
  validates :title, presence: true, uniqueness: {case_sensitive: false} #also needs to be unique in the scope of the project. Appharently there is a "belongs_to" and "has_many" associations you can use, but we haven't learned it yet.

  default_scope { order("done ASC") }
  
end
