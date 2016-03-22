module HasClan
  extend ActiveSupport::Concern

  included do
    before_action :get_clan
  end

  def get_clan
    #@company = company
    @clan = Clan.first
  end

end