class CreateNovelCategories < ActiveRecord::Migration
  def change
    create_table :novel_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
