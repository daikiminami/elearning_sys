module WordsHelper

    def correct_answer(answer)
        Choice.find_by(id: answer.choice_id).correct == true
    end
end
