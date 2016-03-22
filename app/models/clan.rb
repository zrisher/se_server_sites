class Clan < ActiveRecord::Base

  def navbar_logo_url
    ActionController::Base.helpers.image_path('urxp_logo_1_128x42.png')
  end
end
