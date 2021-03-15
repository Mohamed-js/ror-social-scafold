require 'rails_helper'

describe User do

    it 'this will create a new user' do
        User.create!(email: 'test1@email.com', name: 'test1', gravatar_url: 'http://www.gravatar.com/avatar/%22', password: '123123')
    end

    it 'this will not create a user with more than max name length' do
        User.create(email: 'test1@email.com', name: 'test11111111111111111111111111111111111111111111111', gravatar_url: 'http://www.gravatar.com/avatar/%22', password: '123123')
    end
end