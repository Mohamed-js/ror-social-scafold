require 'rails_helper'

describe User do

    it 'this will create a new user' do
        User.create!(email: 'tescxta1@email.com', name: 'tessdt1', gravatar_url: 'http://www.gravatar.com/awvatar/%22', password: '1231e23')
    end

    it 'this will not create a user with more than max name length' do
        User.create(email: 'testsd1@email.com', name: 'test11111111111111111111111111f111111111111111111111', gravatar_url: 'http:/we/www.gravatar.com/avatar/%22', password: '123123')
    end
end