class SecretsController < ApplicationController
  before_action :set_secret, only: [:show, :edit, :destroy]
  before_action :authenticate_user!
  include SecretsHelper


  # GET /secrets
  # GET /secrets.json
  def index
    @variable_secret = Secret.new
    @secrets = Secret.user_search(current_user)
  end

  # GET /secrets/1
  # GET /secrets/1.json
  def show
  end

  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  # GET /secrets/1/edit
  def edit
  end

  # POST /secrets
  # POST /secrets.json
  def create
    @secret = Secret.new(secret_params)

    respond_to do |format|
      if @secret.save
        flash[:success] = 'パスワード情報を追加しました'
        format.html { redirect_to secrets_url }
        format.json { render :show, status: :created, location: @secret }
      else
        @variable_secret = Secret.new
        @secrets = Secret.all
        flash[:danger] = 'パスワード情報追加に失敗しました'
        format.html { redirect_to secrets_url }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secrets/1
  # PATCH/PUT /secrets/1.json
  def update
    @secret = Secret.find(secret_params['id'])
    respond_to do |format|
      if @secret.update(secret_params)
        format.html { redirect_to secrets_path }
        format.js { render :index }
      end
    end
  end

  # DELETE /secrets/1
  # DELETE /secrets/1.json
  def destroy
    @secret.destroy
    respond_to do |format|
      flash[:danger] = 'パスワード情報を削除しました'
      format.html { redirect_to secrets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret
      @secret = Secret.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_params
      params.require(:secret).permit(:id, :name, :password, :key, :user_id)
    end
end
