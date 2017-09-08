class ArticlesController < ApplicationController
before_action :logged_in_user, only: [:new, :edit, :update, :destroy]

 def index
  @article = Article.paginate(page: params[:page], per_page: 10)
 # @user = User.find(params[:user_id])
 # @article = Article.paginate(page: params[:page], per_page: 10)
 end


 def new
  #@user = User.find(params[:user_id])
  @article = Article.new
 end

 
 def create
 # @user = User.find(params[:user_id])
  @article = Article.create(article_params)

 if @article.save
  flash.now[:success] = "記事作成に成功しました"
  redirect_to article_path(@article) 
 else
  render 'new'
 end
 end

 def show
 # @user = User.find(params[:user_id])
 # @article = Article.find(params[:id])
  @article = Article.find(params[:id])
  @picture = Picture.find(params[:id])
 end

 def edit
  #@user = User.where(:id => params[:user_id]).first
  @article = Article.find(params[:id])
 end
 
 def update
  @article = Article.find(params[:id])  

  if @article.update(article_params)
  flash[:success] = "記事編集に成功しました"
  redirect_to @article
  else
  render 'new'
 end
 end

 def destroy
  #@user = User.find(params[:user_id])
  @article = Article.find(params[:id])
  @article.destroy
 
  if @article.destroy
  flash[:success] = "記事削除に成功しました"
  redirect_to [@article]
  else
  render 'new'
  end
 end

private

  def set_user
   @user = User.where(:id => params[:user_id]).first
   @article = current_user.articles.where(:id => params[:id]).first
  end

  def article_params
   params.require(:article).permit(:title, :text)
  end

# ログイン済みユーザーかどうか確認
     def logged_in_user
       unless logged_in?
         store_location
         flash[:danger] = "Please log in."
         redirect_to login_url
       end
     end
end
