feature "Visitor can write an article" do
  before do
    visit root_path
    click_on 'Create Article'
  end

  context 'by providing all necessary information' do
    before do
      fill_in 'Title', with: 'Another great demo from Emma'
      fill_in 'Content', with: 'Learning Rails is weird'
      click_on 'Create Article'
    end
  
    it 'User should be on article show page' do
      article = Article.find_by(title: 'Another great demo from Emma')
      expect(current_path).to eq article_path(article)
    end

    it 'is expected to save a new article in the database' do
        expect(Article.count).to eq 1
    end  

    it 'is expected to respond with a flash message' do
      expect(page).to have_content 'Article was successfully updated'
    end

    it 'is expected to re-route user to applications root path' do
      expect(current_path).to eq root_path
    end
  end

  context "User doesn't enter a title for the article" do
    before do
      fill_in "Title", with: "Another great demo from Emma"
      click_on "Create Article"
    end

    it 'User should see error message' do
      expect(page).to have_content "Title can't be blank"
    end
  end
  
  context "User doesn't enter any text in the article" do
    before do
      fill_in "Content", with: "Learning Rails is weird"
      click_on "Create Article"
    end

    it 'User should see error message' do
      expect(page).to have_content "Content can't be blank"
    end
  end

end
