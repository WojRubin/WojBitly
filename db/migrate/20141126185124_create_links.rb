class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :real_link
      t.timestamps
    end
  end
end
