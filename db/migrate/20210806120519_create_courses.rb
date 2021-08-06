class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :self_assignable
      t.references :coach

      t.timestamps
    end
  end
end
