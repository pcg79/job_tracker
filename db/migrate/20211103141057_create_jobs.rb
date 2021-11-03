class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :referral
      t.text :cover_letter
      t.string :state
      t.text :description

      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
