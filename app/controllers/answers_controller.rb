class AnswersController < ApplicationController
  def new
    @lesson=Lesson.find(params[:lesson_id])
    @words=(@lesson.category.words - @lesson.words)
    if @words.empty?
      redirect_to lesson_path(@lesson)
    else
      @answer=@lesson.answers.build
    end
  end

  def create
    # @lesson = Lesson.find(params[:lesson_id])
    # @choice = Choice.find(params[:choice_id])
    # @word = Word.find(params[:word_id])
    # @answer = @lesson.answers.build(choice: @choice, word: @word)
    # @answer.save

    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    @answer.save
    redirect_to new_lesson_answer_url
  end
  

  def show
  end

  private
  def answer_params
    params.require(:answer).permit(:choice_id, :word_id, :lesson_id)
  end
end
