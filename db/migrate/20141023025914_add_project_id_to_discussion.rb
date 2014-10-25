class AddProjectIdToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :project_id, :integer
    add_index :discussions, :project_id
  end
end
