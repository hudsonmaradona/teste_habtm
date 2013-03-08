class Admin::NovelsController < Admin::BaseController

  before_filter :category, only: %w(new create edit update)

  def index
    @novels = Novel.all

    respond_to do |format|
      format.html #index.rss.builder
      format.json { render json: @novels}
    end

  end

  def show
    @novel = Novel.find(params[:id])

    respond_to do |format|
      format.html #index.rss.builder
      format.json { render json: @novel }
    end
  end

  def new
    @novel = Novel.new
    @categories = NovelCategory.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @novel}
    end

  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def create
    @novel = Novel.new(params[:novel])
    #@category = @novel.novel_categories.build(params[:novel_category])

    respond_to do |format|
      if @novel.save
        format.html { redirect_to [:admin, @novel], notice: 'Novel cadastrada com sucesso.' }
        format.json { render json: @novel, status: :created, location: @novel }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @novel.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @novel = Novel.find(params[:id])

    respond_to do |format|
      if @novel.update_attributes(params[:novel])
        format.html { redirect_to [:admin, @novel], notice: 'Novela atualizada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit"}
        format.json { render json: @novel.erros, status: :unprocessable_entity }
      end

    end

  end

  def destroy
    @novel = Novel.find(params[:id])
    if @novel.destroy
      flash[:notice] = 'Novela excluida com sucesso.'
    else
      flash[:alet] = "Not destroy"
    end

    respond_to do |format|
      format.html { redirect_to admin_novels_url }
      format.json { head :no_content}
    end

  end

  protected

    def category
      @categories = NovelCategory.all
    end

end
