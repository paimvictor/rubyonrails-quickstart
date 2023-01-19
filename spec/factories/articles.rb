FactoryBot.define do
    factory :article do
      title { "Test Title" }
      body { "Valid Body" }
      status { "public" }
      after(:create) { |article| create_list(:comment, 3, article: article) }
    end
  end
  