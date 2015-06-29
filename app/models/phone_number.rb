class PhoneNumber < ActiveRecord::Base

  validates :phone, format: { with: /\A1\d{10}\z/ }, presence: true

  # def self.create_code(phone)
  #   self.create!(phone: phone, verify_code: 1111)
  # end

  def validate!
    if Time.now - self.created_at < 1800
      self.update_attribute(:verified, true)
    end
  end

  def send_message_code
    require 'submail'
    message_config = {}
    message_config["appid"] = "10102"
    message_config["appkey"] = "dd33372eba6c478d665a9f7dd8ab052b"
    message_config["signtype"] = "md5"
    messagexsend = MessageXSend.new(message_config)
    messagexsend.set_project("0AtoR3")

    loop do
      messagexsend.add_to(self.phone)
      self.verify_code = SecureRandom.random_number.to_s[-5..-1]
      messagexsend.add_var("code", self.verify_code)
      result = JSON.parse(messagexsend.message_xsend())
      result['status'] == 'success' and break
    end
  end
end
