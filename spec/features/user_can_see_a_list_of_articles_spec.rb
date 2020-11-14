require "rails_helper"

feature 'List articles on index page' do
  context 'with articles in db' do
    before do
      create(:article, title: 'A breaking news item')
      create(:article, title: 'Some really breaking action') #Fake data, factory bots
      
      visit root_path
    end

    it 'displays first article title' do
      expect(page).to have_content 'A breaking news item'
    end

  it 'displays the second articles title' do
    expect(page).to have_content 'Some really breaking action'
    end
  end
end