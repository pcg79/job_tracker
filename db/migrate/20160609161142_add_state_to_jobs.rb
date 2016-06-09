class AddStateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :state, :string

    add_index :jobs, :state
  end
end
