class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.integer :amount, null: false
      t.date :due_date, null: false
      t.string :status, null: false, default: 'open'
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
