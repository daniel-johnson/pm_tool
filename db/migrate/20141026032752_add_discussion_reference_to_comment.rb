class AddDiscussionReferenceToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :discussion, index: true
  end
end
