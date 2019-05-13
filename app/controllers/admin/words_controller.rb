class Admin::WordsController < ApplicationController
  def index
    @words=Word.all
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times do
      @word.choices.build
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word=Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word=Word.find(params[:id])
    if @word.update(word_params)
      flash[:success] = "Word updated"
      redirect_to admin_category_words_path
    else
      render 'new'
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @word=@category.words.build(word_params)
    if @word.save
      redirect_to admin_category_words_path
    else
      render 'new'
    end
  end

  def destroy
    @word=Word.find(params[:id])
    @word.destroy
    flash[:success] = "Word deleted"
    redirect_to request.referrer || root_url
  end
 
  private

  def word_params
    params.require(:word).permit(:content, choices_attributes:[:id,:content,:correct])
  end
end
