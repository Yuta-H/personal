class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    set_search_tasks
    @variable_task = Task.new
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @variable_task = Task.new(task_params)

    respond_to do |format|
      if @variable_task.save
        flash[:success] = 'タスクを追加しました'
        format.html { redirect_to tasks_url }
      else
        set_search_tasks
        flash[:danger] = 'タスク追加に失敗しました'
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @variable_task.update(task_params)
        flash[:success] = 'タスクを更新しました'
        format.html { redirect_to tasks_path }
        format.json { render :show, status: :ok, location: @task }
      else
        set_search_tasks
        flash[:danger] = 'タスク更新に失敗しました'
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @variable_task.destroy
    respond_to do |format|
      flash[:danger] = 'タスクを削除しました'
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def delete_tasks
    Task.where("id in (?)", params[:delete_ids]).destroy_all
    respond_to do |format|
      flash[:danger] = 'タスクを削除しました'
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end

  end

  def set_search_tasks
    params[:q] ||= {}
    @search = Task.user_search(current_user).ransack(params[:q])
    @tasks = @search.result(distinct: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @variable_task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :category_id, :status_id, :user_id)
    end
end
