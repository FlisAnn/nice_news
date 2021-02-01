feature 'User can sign up for an account' do
  context 'on sign-up form' do
    before do
      visit root_path
      click_on 'Sign up here'
    end
    
    it 'is expected for user to fill in the sign up form' do
      fill_in 'Email', with: 'pips@mio.se'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Sign up'
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end
end