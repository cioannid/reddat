require 'rails_helper'

RSpec.describe 'links/show.html.erb' do
  it 'renders the image inline' do
    link = build_stubbed(:link, url: 'http://example.com/image.jpeg')
    assign(:link, link)

    render

    expect(rendered).to have_selector "img[src='#{link.url}']"
  end
end
