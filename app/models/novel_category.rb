class NovelCategory < ActiveRecord::Base
  attr_accessible :title

  has_and_belongs_to_many :novels

end
