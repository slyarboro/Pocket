require 'rails_helper'
#
RSpec.describe Bookmark, type: :model do
  it { is_expected.to belong_to(:topic) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:likes) }

  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:topic) }
end
