require 'rails_helper'

RSpec.describe Post, type: :model do
    it 'is not valid with without attributes' do
        expect(Post.new(content:"")).to_not be_valid
    end

    it 'is valid with attributes' do
        expect(Post.new(content:"vgsfdg", user_id:1)).to be_valid
    end
end