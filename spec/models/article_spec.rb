require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(10) }
  end

  describe "associations" do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
