class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    get_resume
    respond_to do |format|
      format.html
      format.pdf do
        @file_name = "Resume-#{@user.name.parameterize('-')}"
        render pdf: @file_name, disposition: 'attachment'
      end
    end
  end

  # GET /resumes/new
  def new
    @resume = current_user.build_resume
    @skill = @resume.skills.build
    @college = @resume.colleges.build
    @project = @resume.projects.build
    @address = @resume.build_address
  end

  # GET /resumes/1/edit
  def edit
    get_resume
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = current_user.build_resume(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:summary, :total_experience, skills_attributes: [:id, :kind, :tools_used], colleges_attributes: [:name, :degree, :year_of_graduation, :university], projects_attributes: [:name, :responsibilities, :domain, :duration, :title, :description, :tech_used], address_attributes: [:line1, :line2, :city, :state, :country])
    end

    def get_resume
      @skills = @resume.skills
      @colleges = @resume.colleges
      @projects = @resume.projects
      @address = @resume.address
      @user = @resume.user
    end
end
