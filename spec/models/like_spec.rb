require 'rails_helper'

RSpec.describe Like, type: :model do
    let(:user) { create(:user) }
    # let(:topic) { create(:topic) }
    let(:bookmark) { create(:bookmark) }
    # let(:like) { Like.create!(bookmark: bookmark, user: user) }

    it { should belong_to(:bookmark) }
    it { should belong_to(:user) }
end
