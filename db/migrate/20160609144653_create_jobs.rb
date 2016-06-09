class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :referral
      t.text :cover_letter

      t.timestamps null: false
    end
  end
end
