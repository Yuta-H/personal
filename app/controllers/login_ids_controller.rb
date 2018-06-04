class LoginIdsController < ApplicationController
  before_action :set_login_id, only: [:show, :edit, :update, :destroy]

  # GET /login_ids
  # GET /login_ids.json
  def index
    @login_ids = LoginId.all
  end

  # GET /login_ids/1
  # GET /login_ids/1.json
  def show
  end

  # GET /login_ids/new
  def new
    @login_id = LoginId.new
  end

  # GET /login_ids/1/edit
  def edit
  end

  # POST /login_ids
  # POST /login_ids.json
  def create
    @login_id = LoginId.new(login_id_params)

    respond_to do |format|
      if @login_id.save
        format.html { redirect_to @login_id, notice: 'Login was successfully created.' }
        format.json { render :show, status: :created, location: @login_id }
      else
        format.html { render :new }
        format.json { render json: @login_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_ids/1
  # PATCH/PUT /login_ids/1.json
  def update
    respond_to do |format|
      if @login_id.update(login_id_params)
        format.html { redirect_to @login_id, notice: 'Login was successfully updated.' }
        format.json { render :show, status: :ok, location: @login_id }
      else
        format.html { render :edit }
        format.json { render json: @login_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_ids/1
  # DELETE /login_ids/1.json
  def destroy
    @login_id.destroy
    respond_to do |format|
      format.html { redirect_to login_ids_url, notice: 'Login was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_id
      @login_id = LoginId.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_id_params
      params.require(:login_id).permit(:authenticate_key, :secret_id)
    end
end
