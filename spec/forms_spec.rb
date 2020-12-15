
describe 'Forms de Login' do

    it 'Login com Email e Senha validos' do

        visit "https://training-wheels-protocol.herokuapp.com/login"
        page.windows[0].maximize

        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        puts find('#flash').text
        expect(find('#flash').visible?).to be true

    end
end