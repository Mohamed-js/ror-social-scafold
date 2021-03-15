require 'rails_helper'

RSpec.describe User, type: :model do

    # Create  a user

    it "should be valid user" do 
        u3 = User.new(name:"hamada", email:"asads@jg.asd", password:"asdasds")
        expect(u3).to be_valid
    end

    # Create a post
    it "should be valid post" do 
        u3 = User.create(name:"hamada", email:"asads@jg.asd", password:"asdasds")
        post = u3.posts.build(content:"asdsa")
        expect(post).to be_valid
    end

    # Create a comment
    it "should be valid comment" do 
        u = User.create!(email: 'teswsfgqe2rta1@email.com', name: 'test3sa1', gravatar_url: 'http://www.gravatar2.cosam/awvatar/%22', password: '12323s1e23')
        post = u.posts.build(content:"afgs21d").save if !Post.first.nil?
        expect(u.comments.build(content:"a2sd", post_id: Post.first.id)).to be_valid
    end
    
    # Create a friendship
    it "should be valid friendship" do 
        u = User.create!(email: 'teswsfgqe2rta1@email.com', name: 'test3sa1', gravatar_url: 'http://www.gravatar2.cosam/awvatar/%22', password: '12323s1e23')
        u3 = User.create(name:"hamada", email:"asads@jg.asd", password:"asdasds")
        f = Friendship.create!(creator_id: u.id, receiver_id: u3.id, status: false)
        expect(u.comments.build(content:"a2sd", post_id: Post.first.id)).to be_valid
    end
    
    # Delete a friendship
    it 'This will reject a frienship' do
        user1 = User.create!(email: 'tesqewrt1@easdmail.com', name: 'teedfst1', gravatar_url: 'http:/a/wwwew.gravatar.com/avatar/%22',
                             password: '123e1sd23')
        user2 = User.create!(email: 'tesqwert2@esmail.com', name: 'satewst2', gravatar_url: 'http://wwsw.gwravatar.com/avatar/%22',
                             password: '1231e23')
  
        f = Friendship.create!(creator_id: user1.id, receiver_id: user2.id, status: false)
  
        expect(f.destroy!).to eql(f)
    end
    
end