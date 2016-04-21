class ResumeDataController < ApplicationController
  before_action :set_resume_datum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /resume_data
  # GET /resume_data.json
  def index
    @resume_data = ResumeDatum.all
  end

  # GET /resume_data/1
  # GET /resume_data/1.json
  def show
    get_resume_data
  end

  # GET /resume_data/new
  def new
    @resume_datum = current_user.build_resume
    @skill = @resume_datum.skills.build
    @college = @resume_datum.colleges.build
    @project = @resume_datum.projects.build
    @address = @resume_datum.build_address
  end

  # GET /resume_data/1/edit
  def edit
    get_resume_data
  end

  # POST /resume_data
  # POST /resume_data.json
  def create
    @resume_datum = current_user.build_resume(resume_datum_params)

    respond_to do |format|
      if @resume_datum.save
        format.html { redirect_to @resume_datum, notice: 'Resume datum was successfully created.' }
        format.json { render :show, status: :created, location: @resume_datum }
      else
        format.html { render :new }
        format.json { render json: @resume_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_data/1
  # PATCH/PUT /resume_data/1.json
  def update
    respond_to do |format|
      if @resume_datum.update(resume_datum_params)
        format.html { redirect_to @resume_datum, notice: 'Resume datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume_datum }
      else
        format.html { render :edit }
        format.json { render json: @resume_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_data/1
  # DELETE /resume_data/1.json
  def destroy
    @resume_datum.destroy
    respond_to do |format|
      format.html { redirect_to resume_data_url, notice: 'Resume datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_datum
      @resume_datum = ResumeDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_datum_params
      params.require(:resume_datum).permit(:name, :email, :phone, :summary, skills_attributes: [:id, :name, :proficiency, :duration], colleges_attributes: [:name, :degree, :year_of_graduation, :university], projects_attributes: [:name, :responsibilities, :domain, :duration, :title], address_attributes: [:line1, :line2, :city, :state, :country])
    end

    def get_resume_data
      @skills = @resume_datum.skills
      @colleges = @resume_datum.colleges
      @projects = @resume_datum.projects
      @address = @resume_datum.address
    end
end
