module Entities
  class User
    attr_accessor :id, :name, :email

    def nil_user?
      id.blank? && name.blank? && email.blank?
    end

    def self.nil
      @user ||= User.new
    end
  end
end
