class Client::UsersController < Client::ApplicationController
  before_action :set_client_user, only: %i[ show edit update destroy ]

  # GET /client/users or /client/users.json
  def index
    @client_users = Client::User.all
  end

  # GET /client/users/new
  def new
    @client_user = Client::User.new
  end

  # GET /client/users/1/edit
  def edit
  end

  # POST /client/users or /client/users.json
  def create
    @client_user = Client::User.new(client_user_params)

    respond_to do |format|
      if @client_user.save
        format.html { redirect_to '/client', notice: "Usuário criado com sucesso!" }
        format.json { render :show, status: :created, location: @client_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client/users/1 or /client/users/1.json
  def update
    respond_to do |format|
      if @client_user.update(client_user_params)
        format.html { redirect_to '/client', notice: "Dados atualizados com sucesso!" }
        format.json { render :show, status: :ok, location: @client_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_user
      @client_user = Client::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_user_params
      params.require(:client_user).permit(:nome, :telefone, :cpf, :email, :password_digest)
    end
end
