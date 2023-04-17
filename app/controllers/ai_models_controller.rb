class AiModelsController < ApplicationController
  protect_from_forgery except: :create_auto

  before_action :set_ai_model, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: :create_auto

  # GET /ai_models or /ai_models.json
  def index
    @ai_models = AiModel.all
  end

  # GET /ai_models/1 or /ai_models/1.json
  def show
  end

  # GET /ai_models/new
  def new
    p "P NEW"
    p params
    @ai_model = AiModel.new
  end

  # GET /ai_models/1/edit
  def edit
  end

  # POST /ai_models or /ai_models.json
  def create
    p "create"
    p params
    @ai_model = AiModel.new(ai_model_params)

    respond_to do |format|
      if @ai_model.save
        format.html { redirect_to ai_model_url(@ai_model), notice: "Ai model was successfully created." }
        format.json { render :show, status: :created, location: @ai_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_auto
    data = JSON.parse params[:json].read
    data['ai_model']['file'] = params[:upload_file]

    token = AuthenticationToken.find_by(token: data['token'])
    if token.nil?
      return render plain: "ERR_TOKEN_NOT_FOUND"
    end
    data['ai_model']['user_id'] = token.user_id

    ai_model = AiModel.new(data['ai_model'])
    
    if ai_model.save
      return render plain: "OK"
    else
      return render plain: "ERR_SAVE"
    end
  end

  # PATCH/PUT /ai_models/1 or /ai_models/1.json
  def update
    respond_to do |format|
      if @ai_model.update(ai_model_params)
        format.html { redirect_to ai_model_url(@ai_model), notice: "Ai model was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_models/1 or /ai_models/1.json
  def destroy
    @ai_model.destroy

    respond_to do |format|
      format.html { redirect_to ai_models_url, notice: "Ai model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_model
      @ai_model = AiModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_model_params
      params.require(:ai_model).permit(:file, :user_id, :description, :name, :score)
    end
end
