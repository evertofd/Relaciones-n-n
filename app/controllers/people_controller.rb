class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :add_project]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  def add_project
    @person.projects << Project.find(params[:project_id])
    redirect_to @person
  end
  # GET /people/1
  # GET /people/1.json
  def show
    ids = []
    Project.all.each do |pro|
      unless @person.projects.include?(pro)
        ids.push(pro.id)
      end
    end
    @nonSelectedProjects = Project.where("id IN (?)", ids)
  end

    # GET /people/new
    def new
      @person = Person.new
    end

    # GET /people/1/edit
    def edit
    end

    def remove_project
      proyecto = Project.find(params[:project_id])
      @person.projects.delete(proyecto)
      redirect_to @person
    end

    # POST /people
    # POST /people.json
    def create
      @person = Person.new(person_params)

      respond_to do |format|
        if @person.save
          format.html { redirect_to @person, notice: 'Person was successfully created.' }
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
        format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name)
    end
  end
