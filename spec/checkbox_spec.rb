
describe 'Caixas de seleção', :checkbox do

    before(:each) do

        #Acessando tela de checkbox
        visit 'https://training-wheels-protocol.herokuapp.com/checkboxes'
        page.windows[0].maximize
        sleep 1

        #Lista de opções a serem marcadas na tela
        @opcoes_values = ['cap','iron-man','thor','the-avengers','guardians','ant-man','black-panther']
    end

    after(:each) do sleep 1 end

    it 'Marcando ou desmarcando um opção aleatória', :randomcheck do

        #selecionando uma opção aleatória
        input_value = "input[value=#{@opcoes_values.sample}]"
        opcao_da_vez = find(input_value)

        #marcando ou desmarcando a opção de acordo com seu status atual
        if(opcao_da_vez.checked?)
            puts opcao_da_vez.value + " está desmarcada. Marcando opção..."
            opcao_da_vez.set(true)
        else
            puts opcao_da_vez.value + " está marcada. Desmarcando opção..."
            opcao_da_vez.set(true)
        end
    end 

    it 'Marcando todas as opções', :checkall do

        @opcoes_values.each do |opcao|

            #Selecionando a opção da vez
            input_value = "input[value=#{opcao}]"
            opcao_da_vez = find(input_value)

            #Marcando as opções não marcadas
            if(!opcao_da_vez.checked?)
                puts opcao_da_vez.value + " está desmarcada. Marcando opção..."
                opcao_da_vez.set(true)
                sleep 0.5
            else
                puts opcao_da_vez.value + " está marcada. Ignorando..."
            end
        end
    end

    it 'Desmarcando todas as opções', :uncheckall do 

        @opcoes_values.each do |opcao|

            #Selecionando a opção da vez
            input_value = "input[value=#{opcao}]"
            opcao_da_vez = find(input_value)

            #Desmarcando as opções marcadas
            if(!opcao_da_vez.checked?)
                puts opcao_da_vez.value + " está desmarcada. Ignorando..."
            else
                puts opcao_da_vez.value + " está marcada. Desmarcando opção..."
                opcao_da_vez.set(false)
                sleep 0.5
            end
        end
    end 
end