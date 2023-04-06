require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { FactoryBot.build(:post) }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comments_count).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_count).only_integer.is_greater_than_or_equal_to(0) }

  it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
end
