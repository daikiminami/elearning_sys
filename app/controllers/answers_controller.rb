class AnswersController < ApplicationController
  def new
    @lesson=Lesson.find(params[:lesson_id])
    @words=(@lesson.category.words - @lesson.words)
    if @words.empty?
      @result_count = @lesson.choices.where(correct: "1").count
      @lesson.update_attributes(result: @result_count)
      @lesson.create_activity(user: current_user)
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
  

  # def update
  #   @lesson = Lesson.find(params[:lesson_id])
  #   result_count = @lesson.answers.choice.where(correct: "1").count
  #   @lesson.update_attributes(:result, result_count)
  # end

  private
  def answer_params
    params.require(:answer).permit(:choice_id, :word_id, :lesson_id)
  end
end
