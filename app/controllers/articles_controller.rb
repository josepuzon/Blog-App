class ArticlesController < ApplicationController
  # GET
  def index
    @articles = Article.all
  end
  # GET
  def show
    @article = Article.find(params[:id])
    @comment = @article.comments
    @comment = @article.comments.build
  end
  # GET
  def new
    @article = Article.new
  end
  # POST
   def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Successfully created an article."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET
  def edit
    @article = Article.find(params[:id])
  end
  # PATCH
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
