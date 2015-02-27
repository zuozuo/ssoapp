class PhoneNumber < ActiveRecord::Base

  def self.create_code(phone)
    self.create!(phone: phone, verify_code: 1111)
  end

  def is_valid?
    pm = PhoneNumber.where(phone: self.phone).first
    pm or return false
    pm.verify_code == self.verify_code
  end

end
