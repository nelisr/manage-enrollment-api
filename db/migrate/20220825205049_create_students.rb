class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birthdate
      t.string :payment_method, null: false

      t.timestamps
    end
    add_index :students, :cpf, unique: true
  end
end
