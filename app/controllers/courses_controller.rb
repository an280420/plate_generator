class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @courses = current_user.courses
  end

  # GET /courses/1 or /courses/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        @template = Liquid::Template.parse(@course.template.body)
        @template_pdf = @template.render(
          {
            'course' => {'name'  => @course.name, 'level'  => @course.level, 'volume'  => @course.volume},
            'user' => {'name'  => @course.user.name}
          } 
        )            

        render pdf: "Курс #{@course.name}",
        page_size: 'A4',
        template: "courses/show.pdf.erb",
        layout: "pdf.html",
        lowquality: true,
        zoom: 1,
        dpi: 75,
        encoding: 'UTF-8'
      end
    end
  end

  # GET /courses/new
  def new
    @course = current_user.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = current_user.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :level, :volume, :template_id)
  end
end
