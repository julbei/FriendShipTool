class AccountingsController < ApplicationController
  before_action :set_accounting, only: [:show, :edit, :update, :destroy]

  # GET /accountings
  # GET /accountings.json
  def index
     @group = Group.find(params[:group_id]) 
    @accountings = @group.accountings
  end

  # GET /accountings/1
  # GET /accountings/1.json
  def show
     @group = Group.find(params[:group_id]) 
     @accounting = @group.accountings.find(params[:id])
  end

  # GET /accountings/new
  def new
    @group = Group.find(params[:group_id]) 
    @accounting = Accounting.new
    
  end

  # GET /accountings/1/edit
  def edit
  end

  # POST /accountings
  # POST /accountings.json
  def create
    @group = Group.find(params[:group_id]) 
    @accounting = Accounting.new(accounting_params)
    @accounting.group = @group
    @accounting.person = current_user.people.where(group_id: @group.id).first
    respond_to do |format|
      if @accounting.save
        format.html { redirect_to @group, notice: 'Accounting was successfully created.' }
        format.json { render :show, status: :created, location: @accounting }
      else
        format.html { render :new }
        format.json { render json: @accounting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountings/1
  # PATCH/PUT /accountings/1.json
  def update
    respond_to do |format|
      if @accounting.update(accounting_params)
        format.html { redirect_to @group, notice: 'Accounting was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting }
      else
        format.html { render :edit }
        format.json { render json: @accounting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountings/1
  # DELETE /accountings/1.json
  def destroy
    @accounting.destroy
    respond_to do |format|
      format.html { redirect_to @group, alert: 'Accounting was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting
      @group = Group.find(params[:group_id]) 
      @accounting = Accounting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_params
      params.require(:accounting).permit(:group_id, :person_id, :amount, :date, :name, :description)
    end
end
