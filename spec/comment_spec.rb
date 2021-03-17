require 'rails_helper'

RSpec.describe Comment, type: :model do
    

    it 'is not valid with without attributes' do
        expect(Comment.new()).to_not be_valid
    end

    it 'is not valid with without user' do
        expect(Comment.new(content:"afggsd", post_id: Post.first.id)).to_not be_valid
    end

    it 'is not valid with without post' do
        expect(Comment.new(content:"afgdsd", user_id: User.first.id)).to_not be_valid
    end

    it 'is valid with attributes' do
        u = User.create!(email: 'teswsfggqerta1@email.com', name: 'testdsda1', gravatar_url: 'http://www.gravfatar.cosam/awvatar/%22', password: '123s1de23')
        post = u.posts.build(content:"afgssd").save if !Post.first.nil?
        expect(u.comments.build(content:"asdd", post_id: Post.first.id)).to be_valid
    end
end