# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	has_secure_password
	def name
		"#{ self.first_name } #{ self.last_name }"
	end

	def as_json(options)
		super(
			except: [:password_digest, :first_name, :last_name]).merge({ name: self.name })
	end
end
