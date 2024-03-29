require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'is valid if it has an original URL and a short code' do
    link = Link.new(
      original_url: "https://www.favoriatesite.com/articles/how-to-cook",
      lookup_code: "123456"
    )
    expect(link.valid?).to be(true)
  end


  it 'is invalid if the URL is not foratted properly' do
    link = Link.new(
      original_url: "o2jri9pj2ijijf",
      lookup_code: "123456"
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if it does not have a lookup code' do
    link = Link.new(
      original_url: "https://www.favoriatesite.com/articles/how-to-cook"
    )
    expect(link.valid?).to be(false)
  end


  it 'is invalid if it does not have original URL' do
    link = Link.new(
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if the lookup code already exists' do
    link = Link.new(
      original_url: "https://www.favoriatesite.com/articles/how-to-cook",
      lookup_code: "123456"
    )
    link.save

    link2 = Link.new(
      original_url: "https://www.favoriatesite.com/articles/how-to-cook",
      lookup_code: "123456"
    )

    expect(link2.valid?).to be(false)
  end

  it 'generate a Link with a unique lookup code' do
    url = "https://www.favoriatewebiste.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)

    link2 = shortener.generate_short_link
    expect(link2.valid?).to be(true)
  end

end


