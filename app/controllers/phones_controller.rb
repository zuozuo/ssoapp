class PhonesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def verify
    @pm = PhoneNumber.new
  end

  def create_code
    if params[:phone].blank?
      redirect_to :back, alert: "电话号码不能为空"
    elsif User.where(phone: params[:phone]).exists?
      render :json => "电话号码：#{params[:phone]} 已经存在,请使用该电话号码直接登陆金顾问网站，如果忘记密码请找回密码。"
    else
      pm = PhoneNumber.create!(phone: params[:phone])
      pm.send_message_code
      pm.save!
      render json: "验证码已发送至手机#{params[:phone]}"
    end
  end

  def submit_code
    @pm = PhoneNumber.where(phone_params).first
  end

  private

    def phone_params
      params.require(:phone_number).permit(:phone, :verify_code)
    end
end
