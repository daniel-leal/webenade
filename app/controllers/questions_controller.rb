class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    #@questions = Question.search(params[:search])
    add_breadcrumb "Listagem de Questões", questions_path
    @questions = Question.paginate(:page => params[:page], :per_page => 5).search(params[:search])
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    add_breadcrumb "Listagem de Questões", questions_path
    add_breadcrumb "Mostrar Questão", question_path(@question)
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    add_breadcrumb "Listagem de Questões", questions_path
    add_breadcrumb "Criação da Questão", new_question_path
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    add_breadcrumb "Listagem de Questões", questions_path
    add_breadcrumb "Mostrar Questão", question_path(@question)
    add_breadcrumb "Editar Questão", edit_question_path(@question)
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end


  def simulado
    @courses = Course.all
  end

  def fazer_simulado
    @questions = Question.gerar_simulado(params[:curso], params[:qtd_questao].to_i)
  end


end
