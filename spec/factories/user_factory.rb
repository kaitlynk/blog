# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

FactoryGirl.define do
	factory :user do
		first_name 'Feifan'
		last_name 'Zhou'
		email 'feifan@tunetap.com'
		password 'letmein'
	end

	factory :alex, class: User do
		first_name 'Alex'
		last_name  'Meyers'
		email 'alex@daapr.com'
		password 'verynice'
	end
end
