class Admin::HomeController < Admin::BaseController

  def index
    @novelcategories = NovelCategory.all
  end

end
