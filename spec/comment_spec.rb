require 'rails_helper'

RSpec.describe Comment, type: :model do
    

    it 'is not valid with without attributes' do
        expect(Comment.new()).to_not be_valid
    end

    it 'is not valid with without user' do
        expect(Comment.new(content:"afgsd", post_id: Post.first.id)).to_not be_valid
    end

    it 'is not valid with without post' do
        expect(Comment.new(content:"afgsd", user_id: User.first.id)).to_not be_valid
    end

    it 'is valid with attributes' do
        u = User.create!(email: 'teswsfgqerta1@email.com', name: 'testdsa1', gravatar_url: 'http://www.gravatar.cosam/awvatar/%22', password: '123s1e23')
        post = u.posts.build(content:"afgsd").save if !Post.first.nil?
        expect(u.comments.build(content:"asd", post_id: Post.first.id)).to be_valid
    end
end