class TroublesController < ApplicationController
  before_action :set_trouble, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /troubles
  # GET /troubles.json
  def index
    params[:q] ||= {}
    @search = Trouble.ransack(params[:q])
    @troubles = @search.result(distinct: true)
  end

  # GET /troubles/new
  def new
    @trouble = Trouble.new
  end

  # GET /troubles/1/edit
  def edit
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @trouble = Trouble.new(trouble_params)

    respond_to do |format|
      if @trouble.save
        flash[:success] = "TODOを追加しました"
        format.html { redirect_to troubles_url}
      else
        flash.now[:error] = "TODOの追加に失敗しました"
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /troubles/1
  # PATCH/PUT /troubles/1.json
  def update
    respond_to do |format|
      if @trouble.update(trouble_params)
        format.html { redirect_to troubles_url, notice: 'Trouble was successfully updated.' }
        format.json { render :show, status: :ok, location: @trouble }
      else
        format.html { render :edit }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubles/1
  # DELETE /troubles/1.json
  def destroy
    @trouble.destroy
    respond_to do |format|
      format.html { redirect_to troubles_url, notice: 'Trouble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble
      @trouble = Trouble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_params
      params.require(:trouble).permit(:name, :url, :solution, :status_id, :category_id)
    end
end
