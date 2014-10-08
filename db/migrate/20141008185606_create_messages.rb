class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :name
      t.string :number

      t.timestamps
    end
  end
end
