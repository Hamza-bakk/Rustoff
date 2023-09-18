class UsersController < ApplicationController
  
  # GET /users or /users.json
  def index
    @users = User.all
  end
  
  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    redirect_to profile_path(@user)
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        # Condition pour créer un panier si nécessaire
        if @user.cart.nil?
          @cart = Cart.create(user: @user)
        end
        
        UserMailer.with(user: @user).welcome_email.deliver_now
        
        format.html { redirect_to user_url(@user), notice: "L'utilisateur a été créé avec succès." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "L'utilisateur a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to root_path, notice: "L'utilisateur a été détruit avec succès." }
      format.json { head :no_content }
    end
  end
  
  
  def update_avatar
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Redirection ou réponse réussie
    else
      # Gestion des erreurs, redirection ou réponse d'échec
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :login, :avatar)
  end
end
