feature 'User can see specific article' do
  before do
    create(:article, title: 'Pip is back!', content: 'Mio is happy')
    create(:article, title: 'Ruff says voff', content: 'Pip and Mio say mjau')

    visit root_path
    click_on 'Pip is back!'
  end

  context 'Article displays' do
    it 'shows a title' do
      expect(page).to have_content 'Pip is back!'
    end

    it 'shows the content' do
      expect(page).to have_content 'Mio is happy'
    end
  end
end