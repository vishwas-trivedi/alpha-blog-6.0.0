class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # Render plain: params[:article].inspect
    # White listing of parameters
    @article = Article.new(article_params)
    @article.save
  end


  private
    # White listing/Strong parameter
    # Used to permit certain parameter in certain action
    def article_params
      params.require(:article).permit(:title, :description)
    end

end