require 'rails_helper'

describe Friendship do
  describe '#create_friendship' do
    it 'this will create a new friendship' do
      user1 = User.create!(email: 'test1@emewail.com', name: 'tesqwt1', gravatar_url: 'http://www.gravatar.com/avatar/%22',
                           password: '1231e23')
      user2 = User.create!(email: 'test2@weemail.com', name: 'test2', gravatar_url: 'http://www.gravatar.com/avatar/%22',
                           password: '1231qw23')
      f = Friendship.create!(creator_id: user1.id, receiver_id: user2.id, status: false)
      expect(Friendship.find(f.id).id).to eql(Friendship.last.id)
    end
  end

  describe '#accept_friendship' do
    it 'This will accept a friendship' do
      user1 = User.create!(email: 'test1@ewmail.com', name: 'tesqt1', gravatar_url: 'http://www.gwqravatar.com/avatar/%22',
                           password: '123123')
      user2 = User.create!(email: 'test2@emailqw.com', name: 'tewqst2', gravatar_url: 'http://www.gravatar.com/avatar/%22',
                           password: '123123')

      f = Friendship.create(creator_id: user1.id, receiver_id: user2.id, status: false)
      f.update(status: true)
      expect(Friendship.find(f.id).id).to eql(Friendship.last.id)
    end
  end

  describe '#reject_friendship' do
    it 'This will reject a frienship' do
      user1 = User.create!(email: 'test1@easdmail.com', name: 'tedfst1', gravatar_url: 'http:/a/www.gravatar.com/avatar/%22',
                           password: '1231sd23')
      user2 = User.create!(email: 'test2@esmail.com', name: 'satest2', gravatar_url: 'http://wwsw.gravatar.com/avatar/%22',
                           password: '123123')

      f = Friendship.create!(creator_id: user1.id, receiver_id: user2.id, status: false)

      expect(f.destroy!).to eql(f)
    end
  end
end
