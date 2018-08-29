class ArticlesController < ApplicationController
	# layout "articles"
  # instanisasi class harus sesuai nama kelas {tapi harus sama : article}
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
    @comment = Comment.new
  	
  end

   def edit
    @article = Article.find_by_id(params[:id])
  end

  def create
    @article = Article.new(params_artikel)
    if @article.save
    flash[:notice] = "Success Add Rows"
    redirect_to action: 'index'
  else
    flash[:notice] = "Error Add Rows"
    render 'new'
  end

  end

  def show
    @article = Article.find_by_id(params[:id])
    @comments = @article.comments.order("id desc")
    @comment = Comment.new
  end

  def newreply
    @comment = Comment.new(params_comment)
    if @comment.save
      @comment = Article.find_by_id(params[:comment][:article_id])
      redirect_to action:'index'
    else
      render 'reply'
    end
  end

  def showReply
    @comment = Comment.find_by_id(params[:id])
  end



  def update
    @article = Article.find_by_id(params[:id])
    if @article.update(params_artikel)
      flash[:notice] = "Success Update Rows"
      redirect_to action: 'index'
    else
      flash[:notice] = "Error Update Rows"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])

    if @article.destroy
      flash[:notice] = "Success Delete a Records"
      redirect_to action: 'index'
    else
      flash[:error] = "fails delete a records"
      redirect_to action: 'index'
    end

  end

  def comment
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  private
   def params_artikel
    params.require(:article).permit(:title, :content, :status)
  end  

  def asd
      Article.create(title: "learn", content: "asd", status: "not active")
  Article.last.comments.create([{content:"coment 1"},{content: "coment2"}])
  end

  def list
  	  @artikel = Article.all
  end
end
