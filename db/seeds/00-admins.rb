module SeedAdmin
  def self.seed
    new_user            = User.find_or_initialize_by(email: 'admin@site.com')
    new_user.full_name  = 'Admin Test'
    new_user.username   = 'admin'
    new_user.type       = 'Admin'
    new_user.phone      = '085603155491'
    new_user.password              = '123123123'
    new_user.password_confirmation = '123123123'
    new_user.save
  end
end
