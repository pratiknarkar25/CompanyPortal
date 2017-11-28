# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'ActiveModel validations' do
    it { should validate_presence_of(:content) }
    it { should belong_to(:commentable) }
    it { should belong_to(:user) }
  end
end
