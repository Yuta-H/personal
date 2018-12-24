class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        flash[:success] = 'カテゴリーを追加しました'
        format.html {redirect_back(fallback_location: root_path, notice: 'カテゴリーを追加しました')}
        format.json { render :show, status: :created, location: @category }
      else
        flash[:danger] = 'カテゴリー追加に失敗しました'
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        flash[:success] = 'カテゴリーを更新しました'
        format.html { redirect_to @category }
        format.json { render :show, status: :ok, location: @category }
      else
        flash[:danger] = 'カテゴリー更新に失敗しました'
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_category_select
    @categories = Category.all
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      flash[:danger] = 'カテゴリーを削除しました'
      format.html { redirect_back(fallback_location: root_path ) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:id, :name, :classification, user_id: current_user)
    end
end
