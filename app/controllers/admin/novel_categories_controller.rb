class Admin::NovelCategoriesController < Admin::BaseController

  def index
    @categories = NovelCategory.all

    respond_to do |format|
      format.html #index.rss.builder
      format.json { render json: @categories}
    end

  end

  def show
    @category = NovelCategory.find(params[:id])

    respond_to do |format|
      format.html #index.rss.builder
      format.json { render json: @category }
    end
  end

  def new
    @category = NovelCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category}
    end

  end

  def edit
    @category = NovelCategory.find(params[:id])
  end

  def create
    @ategory = NovelCategory.new(params[:novel_category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to [:admin, @category], notice: 'Categoria cadastrada com sucesso.' }
        format.json { render json: @category, status: :created, location: @category }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = NovelCategory.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:novel_category])
        format.html { redirect_to [:admin, @ategory], notice: 'Categoria atualizada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit"}
        format.json { render json: @category.erros, status: :unprocessable_entity }
      end

    end

  end

  def destroy
    @category = NovelCategory.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Novela excluida com sucesso.'
    else
      flash[:alert] = "Not destroy"
    end

    respond_to do |format|
      format.html { redirect_to admin_novel_categories_url }
      format.json { head :no_content}
    end

  end

end
