FactoryBot.define do
    factory :comment do
      commenter { "Test Commenter" }
      body { "Test Comment Body" }
      status { "public" }
    end
  end