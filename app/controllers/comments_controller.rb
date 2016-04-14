class CommentsController < ApplicationController
  def create
	  @comment = Comment.new(params.require(:comment).permit(:content))
	  @comment.user_id = session[:user_id]
	  @comment.article_id = params[:article_id]
	  if @comment.save
		  flash[:notice] = 'Comment was successfully created'
		  redirect_to @comment.article
	  else
		  flash[:notice] = "Error creating comment: #{@comment.errors}"
		  redirect_to @comment.article
	  end
  end

  def destory
	  @comment = Comment.find params[:id]
	  @comment.destory
	  redirect_to @comment.article
  end
end
