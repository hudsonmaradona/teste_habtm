class Novel < ActiveRecord::Base
  attr_accessible :description, :title, :novel_category_ids

  has_and_belongs_to_many :novel_categories
end
