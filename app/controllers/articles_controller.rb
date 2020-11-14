class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @artcle = Article.new
  end

  def create
    @article = Article.create(article_params) 
      redirect_to root_path, notice: 'Your article was successfully created'
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if
      article_params.present? 
      @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated' #if updated redirected back to article + message
    else
      redirect_to edit_article_path, notice: 'Something went wrong, try again' # other stay andshow error message
    end
  end
  
  private

  def article_params # only allow title and content. Nothing is ok
    params.require(:article).permit(:title, :content)
  end

end

