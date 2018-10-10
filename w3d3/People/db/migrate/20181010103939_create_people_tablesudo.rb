class CreatePeopleTablesudo < ActiveRecord::Migration[5.2]
  def change
    create_table :people_tablesudos do |t|
      t.string :apt-get
      t.string :install
      t.string :nodejs
    end
  end
end
