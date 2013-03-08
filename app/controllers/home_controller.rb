class HomeController < ApplicationController
  def index
    @users = User.all
    @novels = Novel.all
    @categories = NovelCategory.all
  end
end
