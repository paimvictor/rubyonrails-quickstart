require 'rails_helper'

RSpec.describe Visible, type: :concern do
  describe "validations" do
    it "validates that the status is included in the VALID_STATUSES" do
      expect(Article.new(title: "TestTitle", body: "TestTestTest", status: "public")).to be_valid
      expect(Article.new(title: "TestTitle", body: "TestTestTest", status: "private")).to be_valid
      expect(Article.new(title: "TestTitle", body: "TestTestTest", status: "archived")).to be_valid
      expect(Article.new(title: "TestTitle", body: "TestTestTest", status: "invalid")).to be_invalid
    end
  end

  describe "class methods" do
    it "returns the count of public records" do
      article_1 = Article.create(title: "TestTitle", body: "TestTestTest", status: "public")
      article_2 = Article.create(title: "TestTitle", body: "TestTestTest", status: "public")
      Article.create(title: "TestTitle", body: "TestTestTest", status: "private")
      Article.create(title: "TestTitle", body: "TestTestTest", status: "archived")
      expect(Article.public_count).to eq(2)
    end
  end

  describe "instance methods" do
    it "returns whether the record is archived" do
      archived_article = Article.create(title: "TestTitle", body: "TestTestTest", status: "archived")
      public_article = Article.create(title: "TestTitle", body: "TestTestTest", status: "public")
      expect(archived_article.archived?).to be_truthy
      expect(public_article.archived?).to be_falsey
    end
  end
end
