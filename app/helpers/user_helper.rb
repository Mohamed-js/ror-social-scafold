module UserHelper
    def users_list(user, current_user, partial)
        unless user == current_user
            render partial, :user => user
        end
    end

    def friend_or_not(user, current_user)
        unless User.my_friends(current_user).include?(user)
            render 'friendships/friend_request', user: user
        end
    end
end