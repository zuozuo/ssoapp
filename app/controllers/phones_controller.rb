class PhonesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def verify
    @pm = PhoneNumber.new
  end

  def create_code
    pm = PhoneNumber.new(phone: params[:phone])
    pm.send_message_code
    pm.save!
    render :json => pm
  end

  def submit_code
    @pm = PhoneNumber.new(phone_params)
    if @pm.is_valid?
      redirect_to sign_up_path(phone: params[:phone_number][:phone])
    else
      redirect_to verify_phones_path(phone: @pm.phone), notice: "所输入的验证码错误"
    end
  end

  private

    def phone_params
      params.require(:phone_number).permit(:phone, :verify_code)
    end
end
