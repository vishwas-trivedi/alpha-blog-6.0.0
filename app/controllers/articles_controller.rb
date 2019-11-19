class ArticlesController < ApplicationController
  # Listing with index action
  def index
    @articles = Article.all
  end


  # New action
  def new
    @article = Article.new
  end

  # Create action
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # Show action
  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was usccessfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private
    # Whitelisting or strong parameters
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
