class Sales::CoursesController < Sales::ApplicationController
  before_action :set_sales_course, only: %i[ show edit update destroy ]

  # GET /sales/courses or /sales/courses.json
  def index
    @sales_courses = Sales::Course.all
  end

  # GET /sales/courses/1 or /sales/courses/1.json
  def show
  end

  # GET /sales/courses/new
  def new
    @sales_course = Sales::Course.new
  end

  # GET /sales/courses/1/edit
  def edit
  end

  # POST /sales/courses or /sales/courses.json
  def create
    @sales_course = Sales::Course.new(sales_course_params)

    respond_to do |format|
      if @sales_course.save
        @sales_course.picture.attach(sales_course_params[:picture])
        format.html { redirect_to sales_seller_course_path(@seller, @sales_course), notice: "Course foi criado com sucesso." }
        format.json { render :show, status: :created, location: @sales_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/courses/1 or /sales/courses/1.json
  def update
    respond_to do |format|
      if @sales_course.update(sales_course_params)
        @sales_course.picture.attach(sales_course_params[:picture])
        format.html { redirect_to  sales_seller_course_path(@seller, @sales_course), notice: "Curso foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @sales_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/courses/1 or /sales/courses/1.json
  def destroy
    @sales_course.destroy
    respond_to do |format|
      format.html { redirect_to sales_seller_courses_path(@seller), notice: "Curso foi removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_course
      @sales_course = Sales::Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_course_params
      params[:sales_course][:sales_seller_id] = @seller
      params.require(:sales_course).permit(:nome, :descricao, :preco, :sales_seller_id, :admin_category_id, :picture)
    end
end
