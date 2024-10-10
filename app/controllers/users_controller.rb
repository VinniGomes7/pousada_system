class UsersController < BaseController
  private

  def resource_params
    params.require(:user).permit(:nome, :email, :password, :role) 
  end
end