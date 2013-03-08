class NovelCategoriesController < ApplicationController

  def index
    @categories = NovelCategory.all
  end

  def show
    @categories = NovelCategory.find(params[:id], include: [:novels])
  end

end
