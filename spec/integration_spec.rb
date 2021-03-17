require 'rails_helper'

RSpec.describe User, type: :model do

    # Create  a user

    it "should be valid user" do 
        u3 = User.new(name:"hamdada", email:"asadsg@jg.asd", password:"asdahsds")
        expect(u3).to be_valid
    end

    # Create a post
    it "should be valid post" do 
        u3 = User.create(name:"hamtada", email:"asads@jgr.asd", password:"asdawsds")
        post = u3.posts.build(content:"asdtsa")
        expect(post).to be_valid
    end

    # Create a comment
    it "should be valid comment" do 
        u = User.create!(email: 'teswsfgqe2rta1@emyail.com', name: 'testt3sa1', gravatar_url: 'http://www.gravatar2.cosam/awvartar/%22', password: '12323ks1e23')
        post = u.posts.build(content:"afgs21d").save if !Post.first.nil?
        expect(u.comments.build(content:"a2sd", post_id: Post.first.id)).to be_valid
    end
    
    # Create a friendship
    it "should be valid friendship" do 
        u = User.create!(email: 'teswsfgqe2rtya1@email.com', name: 'teste3sa1', gravatar_url: 'http://wwjw.gravatar2.cosam/awvatar/%22', password: '12323ks1e23')
        u3 = User.create(name:"hamasda", email:"asahds@jg.asd", password:"asjkdasds")
        f = Friendship.create!(creator_id: u.id, receiver_id: u3.id, status: false)
        expect(u.comments.build(content:"a2sdd", post_id: Post.first.id)).to be_valid
    end
    
    # Delete a friendship
    it 'This will reject a frienship' do
        user1 = User.create!(email: 'tedsqewrt1@easdmail.com', name: 'teeddfst1', gravatar_url: 'http:/a/wwwew.gravatar.com/avatar/%22',
                             password: '1s23e1asd23')
        user2 = User.create!(email: 'tesqwert2@esdfmail.com', name: 'satedwsst2', gravatar_url: 'http://wdwsw.gwravatar.com/avatar/%22',
                             password: '1231e2f3')
  
        f = Friendship.create!(creator_id: user1.id, receiver_id: user2.id, status: false)
  
        expect(f.destroy!).to eql(f)
    end
    
end