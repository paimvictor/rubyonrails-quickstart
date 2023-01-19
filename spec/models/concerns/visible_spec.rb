require 'rails_helper'

RSpec.describe Visible, type: :concern do
  describe "validations" do
    it "validates that the status is included in the VALID_STATUSES" do
      expect(create(:article, status: "public")).to be_valid
      expect(create(:article, status: "private")).to be_valid
      expect(create(:article, status: "archived")).to be_valid
      expect(Article.new(title: "TestTitle", body: "TestTestTest", status: "invalid")).to be_invalid
    end
  end

  describe "class methods" do
    it "returns the count of public records" do
      article_1 = create(:article)
      article_2 = create(:article)
      create(:article, status: "private")
      create(:article, status: "archived")
      expect(Article.public_count).to eq(2)
    end
  end

  describe "instance methods" do
    it "returns whether the record is archived" do
      archived_article = create(:article, status: "archived")
      public_article = create(:article, status: "public")
      expect(archived_article.archived?).to be_truthy
      expect(public_article.archived?).to be_falsey
    end
  end
end
