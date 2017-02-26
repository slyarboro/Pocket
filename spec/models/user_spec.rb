require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { User.create!(name: "Test User", username: "testuser", email: "email@domain.com", password: "password") }

   it { is_expected.to have_many(:topics)}

   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_presence_of(:username) }
   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_presence_of(:password) }

end
