class RegistrationsController < Devise::RegistrationsController

  def create
    if PhoneNumber.where(phone: user_params[:phone], verified: true).exists?
      @user = User.create!(user_params.merge(email: "#{user_params[:phone]}@jinguwen.com"))
      sign_in(@user)
    else
      @msg = "所输入的电话号码尚未被验证。"
    end
  end

  private

  def after_sign_up_path_for(resource)
    root_path
  end

  def user_params
    params.require(:user).permit(:phone, :password, :password_confirmation)
  end

end 
