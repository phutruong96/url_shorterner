class AuthService
  def self.link_owner?(link, user)
    link.user_id == user.id
  end
end
