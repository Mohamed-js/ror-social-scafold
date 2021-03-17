module FriendshipsHelper
    def invite_btn
        unless User.my_friends(current_user).include?(@user)
          render 'friendships/friend_request', user: @user
        end
    end
end
