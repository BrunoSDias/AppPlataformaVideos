class Admin::VideosController < Admin::ApplicationController
  before_action :set_course
  before_action :set_admin_video, only: %i[ show edit update destroy ]

  # GET /admin/videos or /admin/videos.json
  def index
    @admin_videos = Admin::Video.all
  end

  # GET /admin/videos/1 or /admin/videos/1.json
  def show
  end

  # GET /admin/videos/new
  def new
    @admin_video = Admin::Video.new
  end

  # GET /admin/videos/1/edit
  def edit
  end

  # POST /admin/videos or /admin/videos.json
  def create
    @admin_video = Admin::Video.new(admin_video_params)

    respond_to do |format|
      if @admin_video.save
        format.html { redirect_to admin_course_video_path(@course, @admin_video), notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @admin_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/videos/1 or /admin/videos/1.json
  def update
    respond_to do |format|
      if @admin_video.update(admin_video_params)
        format.html { redirect_to @admin_video, notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/videos/1 or /admin/videos/1.json
  def destroy
    @admin_video.destroy
    respond_to do |format|
      format.html { redirect_to admin_videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_video
      @admin_video = Admin::Video.find(params[:id])
    end

    def set_course
      @course = Admin::Course.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def admin_video_params
      params[:admin_video][:admin_course_id] = params[:course_id]
      params.require(:admin_video).permit(:nome, :descricao, :link, :admin_course_id)
    end
end
