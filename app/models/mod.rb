require 'nokogiri'
require 'open-uri'

class Mod < ActiveRecord::Base
  has_and_belongs_to_many :servers

  validates_presence_of :steam_id
  validates_uniqueness_of :steam_id

  before_save :fetch_steam_attributes

  private
  def fetch_steam_attributes
    self.steam_url = "https://steamcommunity.com/sharedfiles/filedetails/?id=#{steam_id}"

    steam_page_html = open(steam_url)
    steam_page = Nokogiri::HTML(steam_page_html)

    name_element = steam_page.xpath("//*[@class='workshopItemTitle']").first
    self.steam_name = name_element.inner_text if name_element

    main_img_element = steam_page.xpath("//img[@class='workshopItemPreviewImageMain']").first
    if main_img_element
      img_url = main_img_element.attr('src')
    else
      first_attached_img_element = steam_page.xpath("//img[@class='workshopItemPreviewImageEnlargeable']").first
      img_url = first_attached_img_element.attr('src') if first_attached_img_element
    end
    if img_url
      img_url = img_url.gsub(/fit=inside\|\d+:\d+(&amp;)?/,'').
        gsub(/composite\-to=\*,\*\|\d+:\d+(&amp;)?/,'').
        gsub(/background\-color=[a-z]+(&amp;)?/,'')
    end

    self.steam_image_url = img_url

  end

end
