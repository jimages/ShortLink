# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shortener do
  it "shorten a give URL to a 7 character lookup code" do
    url = "https://www.favoriatewebiste.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end


  it "gives each URL its own lookup code" do
    url = "https://www.favoriatewebiste.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = "https://www.favoriatewebiste.com/articles/how-to-bake"
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code

    expect(code_1).not_to eq(code_2)
  end

  it "always gives the same URL the same lookup code" do
    url = "https://www.favoriatewebiste.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = "https://www.favoriatewebiste.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code

    expect(code_1).to eq(code_2)
  end
end