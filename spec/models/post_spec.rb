# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'ActiveModel validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_length_of(:description).is_at_most(65_530) }
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end
