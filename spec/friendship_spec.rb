require 'rails_helper'

describe Friendship do
  describe '#create_friendship' do
    it 'this will create a new friendship' do
      user1 = User.create!(email: 'test1fg@emewail.com', name: 'tesdfqwt1', gravatar_url: 'http://www.gravfatar.com/avatar/%22',
                           password: '1231e23')
      user2 = User.create!(email: 'tesdft2@wefemail.com', name: 'tfgest2', gravatar_url: 'http://www.gravgatar.com/avatar/%22',
                           password: '1231fgdqw23')
      f = Friendship.create!(creator_id: user1.id, receiver_id: user2.id, status: false)
      expect(Friendship.find(f.id).id).to eql(Friendship.last.id)
    end
  end

  describe '#accept_friendship' do
    it 'This will accept a friendship' do
      user1 = User.create!(email: 'test1@nbewmail.com', name: 'tefdgsqt1', gravatar_url: 'http://www.gwqrghavatar.com/avatar/%22',
                           password: '123123')
      user2 = User.create!(email: 'tesot2@emapilqw.com', name: 'tewqiost2', gravatar_url: 'http://wwwkl.gravatar.com/avatar/%22',
                           password: '123o123')

      f = Friendship.create(creator_id: user1.id, receiver_id: user2.id, status: false)
      f.update(status: true)
      expect(Friendship.find(f.id).id).to eql(Friendship.last.id)
    end
  end

  describe '#reject_friendship' do
    it 'This will reject a frienship' do
      user1 = User.create!(email: 'tepipst1@easdmail.com', name: 'tedofst1', gravatar_url: 'http:/a/wwwi.gravatar.com/avatar/%22',
                           password: 'p1231psd23')
      user2 = User.create!(email: 'test2@esmail.icom', name: 'satuest2', gravatar_url: 'http://wwsw.igravatar.com/avatar/%22',
                           password: '1231o23')

      f = Friendship.create!(creator_id: user1.id, receiver_id: user2.id, status: false)

      expect(f.destroy!).to eql(f)
    end
  end
end
