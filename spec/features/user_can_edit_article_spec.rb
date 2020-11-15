feature 'User can edit an article' do
  context 'edit an article'
    let(:article) { create(:article, title: 'Some crispy news', content: 'Bad bad content') } # Create a article
    before do   
      visit article_path(article) # go to article
      click_on 'Edit this Article'
    end

    it 'to change the content' do
      fill_in 'Content', with: 'It is almost Friday and that is good..' #update article
      click_on 'Update Article'
      expect(page).to have_content 'It is almost Friday and that is good..' 
    end
  end

