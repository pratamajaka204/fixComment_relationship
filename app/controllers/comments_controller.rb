class CommentsController < ApplicationController
  

  def create
        @comment = Comment.new(params_comment)
      respond_to do |format|
        if @comment.save
          format.js {@comments = Article.find_by_id(params[:comment][:article_id])}
        else
          format.js {@article = Article.find_by_id(params[:comment][:article_id])}
        end
      end
    end

    private
    def params_comment
      params.require(:comment).permit(:article_id, :content)

    end

  #   def index
  # end

  # def new
  #   @comment = Comment.new
  # end

  

end
