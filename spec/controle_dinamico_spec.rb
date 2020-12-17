describe 'Controles dinamicos', :dinamic do

    before(:each) do

        #acessando a tela
        visit 'https://training-wheels-protocol.herokuapp.com/dynamic_controls'
        page.windows[0].maximize

    end

    after(:each) do sleep 2 end

    it 'Habilita o campo, altera o valor e depois desabilita o campo' do

        #Verifica se o campo em questão está habilitado ou não para iniciar o teste
        if(page.has_field? 'movie', disabled: true)

            puts 'Campo desabilitado. Habilitando campo...'
            click_button 'Habilita'

            #validando se o botão está habilitado
            is_abled = page.has_field? 'movie', disabled: false
            expect(is_abled).to be true
        else
            puts 'Campo já está Habilitado...'
        end

        #Inserindo um novo valor para o campo 
        fill_in 'movie', with: 'Eu sou o Dougras'

        if(page.has_field? 'movie', disabled: false)
            
            puts 'Campo habilitado. Desabilitando campo...'
            click_button 'Desabilita'

            #validando se o botão está habilitado
            is_abled = page.has_field? 'movie', disabled: true
            expect(is_abled).to be true
        else
            puts 'Campo já está Desabilitado...'
        end
    end

end