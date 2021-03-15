require 'rails_helper'

RSpec.describe Post, type: :model do

    it 'is not valid with without attributes' do
        expect(Post.new(content:"")).to_not be_valid
    end

    it 'is valid with attributes' do
        u = User.create!(email: 'testa1@dfgemail.com', name: 'test1', gravatar_url: 'http://www.gravatar.com/awvatar/%22', password: '1231e23')
        expect(u.posts.build(content:"asd")).to be_valid
    end
end