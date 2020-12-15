
describe 'Forms de Login', :login do

    before(:each) do

        #urls de teste
        @url_pos_login = 'https://training-wheels-protocol.herokuapp.com/secure'
        @url_pre_login = 'https://training-wheels-protocol.herokuapp.com/login'

        #mensagens para validacao
        @msg_login_sucesso = 'Olá, Tony Stark. Você acessou a área logada!'
        @msg_erro_email = 'O usuário informado não está cadastrado!'
        @msg_erro_senha = 'Senha é invalida!'

        #massa de teste
        @email_valido = 'stark'
        @senha_valida = 'jarvis!'
        @email_invalido = 'lucas'
        @senha_invalida = '112233'

        #Acessando tela de Login 
        visit @url_pre_login
        page.windows[0].maximize

    end

    it 'Login com Email e Senha validos' do

        #Realizando login
        fill_in 'userId', with: @email_valido
        fill_in 'password', with: @senha_valida
        click_button 'Login'

        #Validações pós Login
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include @msg_login_sucesso
        
        expect(page.current_url).to eq @url_pos_login
    end

    it 'Login com Email inválido' do

        #Realizando login
        fill_in 'userId', with: @email_invalido
        fill_in 'password', with: @senha_valida
        click_button 'Login'

        #Validações pós Login
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include @msg_erro_email
        
        expect(page.current_url).to eq @url_pre_login

    end

    it 'Login com Email válido e Senha inválida' do

        #Realizando login
        fill_in 'userId', with: @email_valido
        fill_in 'password', with: @senha_invalida
        click_button 'Login'

        #Validações pós Login
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include @msg_erro_senha
        
        expect(page.current_url).to eq @url_pre_login

    end 

    it 'Login com Email e Senha em branco' do

        #Realizando login
        fill_in 'password', with: ''
        click_button 'Login'

        #Validações pós Login
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include @msg_erro_email
        
        expect(page.current_url).to eq @url_pre_login

    end 

end