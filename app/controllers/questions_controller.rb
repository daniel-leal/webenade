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
    add_breadcrumb "Listagem das Questões", questions_path
    add_breadcrumb "Incluir Questão", new_question_path
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
        format.html { redirect_to @question, notice: 'A questão foi incluida com sucesso' }
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
        format.html { redirect_to @question, notice: 'A questão foi atualizada com sucesso' }
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
    @correct_questions = 0
    @fixed = Hash.new
    
    
    if params[:commit] == "Corrigir"
      puts "::::OOOOOOOOLLLLLLLLHHHHHHHAAAAAAAA BBBEMMM AQUI:::::::"
      puts "CORREÇÃO:"
      puts params
      number_of_questions = params[:number_of_questions]
      corrigidas = Array.new
      params.each do |key, value|
        if key.include? "options" #que dizer que está no formato "options_<id_questão>'"
          resp = key.split "_"
          id_questao = resp[1]
          corrigidas << id_questao
          question = Question.find(id_questao)
          if question.is_correct? value
            @correct_questions += 1
          else
            @fixed[id_questao] = question.alternativa_correta #aqui ao inves da alternativa pode fazer um if/else pra colocar o enuciado correto
          end 
        end
      end
      
      params.each do |key, value|
        if key.include? "questions"
          resp = key.split "_"
          id_questao = resp[1]
          if !corrigidas.include? id_questao # significa que ele não respondeu
            question = Question.find(id_questao)
            @fixed[id_questao] = question.alternativa_correta
          end
        end
      end
      
      
      puts "QUESTÕES ACERDATAS::: #{@correct_questions}"  
      redirect_to show_result_path(:total => @correct_questions, :fix => @fixed)
      ###AGORA É SÓ COLOCAR UM 'REDIRECT_TO' AQUI
      ### E PASSAR PRA ELE A VARIAVEL '@total'
      ###LEMBRETE: TEM QUE CRIAR UMA ROTA NO ROUTES E PASSAR A VARIAVEL @total
    end
  end
  
  def show_result
    @correct_questions = params[:total]
    @fixed = params[:fix]
    puts params
    @corrections = Array.new
    if @fixed
      @fixed.each do |question_id, correct|
        question = Question.find(question_id)
        enuc = question.enunciado
        if correct == "A"
          correct_aswer = question.alternativa_a
        elsif correct == "B"
          correct_aswer = question.alternativa_b
        elsif correct == "C"
          correct_aswer = question.alternativa_c
        elsif correct == "D"
          correct_aswer = question.alternativa_d
        elsif correct == "E"
          correct_aswer = question.alternativa_e
        end
        @corrections << {:enuciado => enuc, :correct => correct_aswer}
      end
    end
    
  end


end
