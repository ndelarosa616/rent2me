class AddFileNameToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :file_name, :string
  end
end
