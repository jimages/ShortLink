# frozen_string_literal: true
require 'rails_helper'

RSpec.describe LinksController , type: :controller do

  it 'can shorten a link provided by user' do
    @request.headers['Accept'] = 'text/javascript'

    url = 'https://www.myfavoritewebsite.com/articles/how-to-cook'
    post :create, params: { link: { original_url: url } }
    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to eq(true)
    expect(link.lookup_code.length).to eq(7)
    expect(link.persisted?).to eq(true)
    expect(response).to render_template('create')
  end

end

