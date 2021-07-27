class Sales::VideosController < Sales::ApplicationController
  before_action :set_course
  before_action :set_sales_video, only: %i[ show edit update destroy ]

  # GET /sales/videos or /sales/videos.json
  def index
    @sales_videos = Sales::Video.all
  end

  # GET /sales/videos/1 or /sales/videos/1.json
  def show
  end

  # GET /sales/videos/new
  def new
    @access_token = params[:access_token]
    @sales_video = Sales::Video.new
  end

  # GET /sales/videos/1/edit
  def edit
  end

  # POST /sales/videos or /sales/videos.json
  def create
    @sales_video = Sales::Video.new(sales_video_params)

    respond_to do |format|
      if @sales_video.save
        format.html { redirect_to sales_seller_course_video_path(@seller, @course, @sales_video), notice: "Video foi criado com sucesso." }
        format.json { render :show, status: :created, location: @sales_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/videos/1 or /sales/videos/1.json
  def update
    respond_to do |format|
      if @sales_video.update(sales_video_params)
        format.html { redirect_to sales_seller_course_video_path(@seller, @course, @sales_video), notice: "Video foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @sales_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/videos/1 or /sales/videos/1.json
  def destroy
    @sales_video.destroy
    respond_to do |format|
      format.html { redirect_to sales_seller_course_videos_path(@seller, @course), notice: "Video foi removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_video
      @sales_video = Sales::Video.find(params[:id])
    end

    def set_course
      @course = Sales::Course.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def sales_video_params
      params[:sales_video][:sales_course_id] = params[:course_id]
      params.require(:sales_video).permit(:nome, :descricao, :link, :sales_course_id)
    end
end
