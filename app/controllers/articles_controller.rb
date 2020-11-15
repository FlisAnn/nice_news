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
    if @article.persisted?
      redirect_to article_path(@article), notice: 'Your article was successfully created'
    else
      flash[:notice] = @article.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated' #if updated redirected back to article + message
    else
      redirect_to edit_article_path, flash[:notice] = @article.errors.full_messages.to_sentence # other stay andshow error message
      render :show
    end
  end
  
  private

  def article_params # only allow title and content. Nothing is ok
    params.require(:article).permit(:title, :content)
  end

end

