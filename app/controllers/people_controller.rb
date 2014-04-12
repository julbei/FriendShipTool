class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @group = Group.find(params[:group_id]) 
    @people = @group.persons
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @group = Group.find(params[:group_id]) 
    @person = @group.persons.find(params[:id])
  end

  # GET /people/new
  def new
    @group = Group.find(params[:group_id]) 
    @person = Person.new
    @person.group = @group
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @group = Group.find(params[:group_id]) 
    @person = @group.persons.create(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to group_people_path(group_id: @group.id), notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to group_people_path(group_id: @group.id), alert: 'Person was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @group = Group.find(params[:group_id])
      @person = @group.persons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :user_id, :group_id, :balance)
    end
end
