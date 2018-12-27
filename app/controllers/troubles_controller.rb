class TroublesController < ApplicationController
  before_action :set_trouble, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!

  # GET /troubles
  # GET /troubles.json
  def index
    set_search_troubles
    @variable_trouble = Trouble.new
  end

  # GET /troubles/1/edit
  def edit
  end

  def show
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @variable_trouble = Trouble.new(trouble_params)

    respond_to do |format|
      if @variable_trouble.save
        flash[:success] = 'トラブルを追加しました'
        format.html { redirect_to troubles_url }
      else
        set_search_troubles
        flash[:danger] = 'トラブル追加に失敗しました'
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /troubles/1
  # PATCH/PUT /troubles/1.json
  def update
    respond_to do |format|
      if @variable_trouble.update(trouble_params)
        flash[:success] = 'トラブルを更新しました'
        format.html { redirect_to troubles_url }
        format.json { render :show, status: :ok, location: @trouble }
      else
        set_search_troubles
        flash[:danger] = 'トラブル更新に失敗しました'
        format.html { render :edit }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubles/1
  # DELETE /troubles/1.json
  def destroy
    @variable_trouble.destroy
    respond_to do |format|
      flash[:danger] = 'トラブルを削除しました'
      format.html { redirect_to troubles_url }
      format.json { head :no_content }
    end
  end

  def set_search_troubles
    params[:q] ||= {}
    @search = Trouble.user_search(current_user).ransack(params[:q])
    @troubles = @search.result(distinct: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble
      @variable_trouble = Trouble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_params
      params.require(:trouble).permit(:name, :url, :solution, :status_id, :category_id, :user_id)
    end
end
