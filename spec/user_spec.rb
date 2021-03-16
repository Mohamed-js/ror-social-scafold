require 'rails_helper'

describe User do

    it 'this will create a new user' do
        User.create!(email: 'tescxta1@vemail.com', name: 'tesscdt1', gravatar_url: 'http://www.gravatar.com/awvaxtar/%22', password: '1231ze23')
    end

    it 'this will not create a user with more than max name length' do
        User.create(email: 'tzestxsd1@email.com', name: 'test111111c11111111111111111111f111111111111111111111', gravatar_url: 'http:/we/cwww.gravatar.com/avatar/%22', password: '12312v3')
    end
end