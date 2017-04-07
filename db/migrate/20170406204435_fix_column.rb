class FixColumn < ActiveRecord::Migration
  def change
    change_column :recipes, :cooktime, :string
  end
end
