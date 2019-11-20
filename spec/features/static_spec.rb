require 'rails_helper'

RSpec.describe 'navigate' do
  # describe 'homepage' do
  it 'navigates homepage' do
    visit root_path
    expect(page.status_code).to eql(200)
  end
end