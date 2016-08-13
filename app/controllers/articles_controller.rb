class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authorize, only: [:index, :show]

#  def newcomment
#	  @comment = Comment.new(comment_params)
#	  @comment.user = session[:user_id]
#	  @comment.save
#  end
#
#  def showcomments#(article)
#	  if @comments = Comment.where(article: @article.id).order(:created_at)
#	  	render partial: 'comment', collection: @comments
#	  end
#  end
#  helper_method :show_comments
#
#  def showreplies#(comment)
#	  if @replies = Reply.where(comment: @comment.id).order(:created_at)
#	  	render partial: 'reply', collection: @replies
#	  end
#  end
#  helper_method :show_replies

  def own
	  @my_articles = User.find_by_id(session[:user_id]).articles
  end

  # GET /articles
  # GET /articles.json
  def index
	  if session[:user_id]
		  @user_name = User.find_by_id(session[:user_id]).name
	  end
    @articles = Article.order(:created_at)
    @article = Article.new
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
	  @comment = Comment.new()#(comment_params)
#	  @comment.user_id = session[:user_id]
#	  @comment.article_id = @article.id
#	  params[:comment][:user_id] = session[:user_id] if params[:comment]
#	  params[:comment][:article_id] = @article.id if params[:comment]
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content)
    end

#    def comment_params
#            params.require(:comment).permit(:content, :article_id, :user_id) if params[:comment]
#    end
end
