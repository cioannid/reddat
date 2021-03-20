require 'rails_helper'

RSpec.describe 'links/_link.html.erb' do
  context 'if the url is an image' do
    it 'renders the image inline' do
      link = build_stubbed(:link, url: 'http://example.com/image.png')

      render partial: 'links/link.html.erb', locals: { link: link }

      expect(rendered).to have_selector "img[src='#{link.url}']"
    end
  end
end
