class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  # GET /shares
  # GET /shares.json
  def index
    @accounting = Accounting.find(params[:accounting_id])
    @shares = @accounting.shares
  end

  # GET /shares/1
  # GET /shares/1.json
  def show
    @accounting = Accounting.find(params[:accounting_id])
    @shares = @accounting.shares.find(params[:id])
  end

  # GET /shares/new
  def new
    @accounting = Accounting.find(params[:accounting_id])
    @share = @accounting.shares.build
    @group = @accounting.group
  end

  # GET /shares/1/edit
  def edit
  end

  # POST /shares
  # POST /shares.json
  def create
    @accounting = Accounting.find(params[:accounting_id])
    @share = @accounting.shares.build(share_params)
    
    
    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: 'Share was successfully created.' }
        format.json { render :show, status: :created, location: @share }
      else
        format.html { render :new }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shares/1
  # PATCH/PUT /shares/1.json
  def update
    @share.amount = params[:share_amount]
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to group_accounting_path(group_id: @group.id, accounting_id: @accounting.id), notice: 'Share was successfully updated.' }
        format.json { render json: @share, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
    
    @accounting = Accounting.find(params[:accounting_id])
    @share = @accounting.shares.find(params[:id])
    @group = @accounting.group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_params
      params.require(:share).permit(:accounting_id, :lender_id, :borrower_id, :amount)
    end
end
