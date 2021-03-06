class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_lesson, only: [:index, :new, :create, :play]

  # GET /questions
  # GET /questions.json
  def index
    @questions = @lesson.questions
  end

  # GET /questions/play
  def play
    @questions = @lesson.questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @lesson.questions.build
    @question.build_answer
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params.merge(lesson: @lesson))

    respond_to do |format|
      if @question.save
        format.html { redirect_to lesson_questions_path(@lesson), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to lesson_questions_path(@question.lesson), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @lesson = @question.lesson
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @lesson, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def question_params
    Question.permits_params params.require(:question)
  end
end
