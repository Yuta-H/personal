class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        flash[:success] = 'ステータスを追加しました'
        format.html { redirect_back(fallback_location: root_path ) }
        format.json { render :show, status: :created, location: @status }
      else
        flash[:danger] = 'ステータス追加に失敗しました'
        format.html { render :index }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        flash[:success] = 'ステータスを更新しました'
        format.html { redirect_to @status }
        format.json { render :show, status: :ok, location: @status }
      else
        flash[:danger] = 'ステータス更新に失敗しました'
        format.html { render :index }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_status_select
    @statuses = Status.all
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      flash[:danger] = 'ステータスを削除しました'
      format.html { redirect_back(fallback_location: root_path ) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:name, :classification, :task_id, :trouble_id, :user_id)
    end
end
