class AiModelsController < ApplicationController
  protect_from_forgery except: :create_auto

  before_action :set_ai_model, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: :create_auto

  # GET /ai_models or /ai_models.json
  def index
    @ai_models = AiModel.all
    return render 'index', locals: { title: 'Model Library' }
  end

  # GET /ai_models/new
  def new
    @ai_model = AiModel.new
  end

  # GET /ai_models/1/edit
  def edit
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

  def user_models
    user = User.find(params[:id])
    @ai_models = AiModel.where(user: user)
    return render 'index', locals: { title: "Models for #{user.email}" }
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
