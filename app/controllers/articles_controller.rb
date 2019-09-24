class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new
    # @article.title = params[:title]
    # @article.description = params[:description]
    # @article.save
    @article = Article.create(article_params(:title, :description))
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = set_article
  end

  def update
    @article = set_article
    @article.update(article_params(:title, :description))

    redirect_to article_path(@article)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params(*args)
    params.require(:article).permit(*args)
  end
end
