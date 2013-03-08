class NovelCategoriesNovels < ActiveRecord::Migration

  def change

    create_table "novel_categories_novels", :id => false do |t|
      t.references "novel_category", :null => false
      t.references "novel", :null => false
    end

    add_index :novel_categories_novels, [:novel_category_id, :novel_id]

  end

end
