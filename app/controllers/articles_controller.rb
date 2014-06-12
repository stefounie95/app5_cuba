class ArticlesController < ApplicationController
  def new #donne le formulaire
    @article = Article.new() #obligé de le mettre car article utilisé dans la vue new pour voir si y a des erreurs (venu d'un create)
  end
  
  def create
    #render plain: params[:article].inspect   
    #@article = Article.new(params[:article])
    
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article #necesste un show
    else
      render 'new'
    end
  end
  
  private def article_params
      params.require(:article).permit(:title, :text)  
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
end
