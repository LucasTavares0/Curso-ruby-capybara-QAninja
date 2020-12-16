
describe 'Botões de Radio', :radio do

    before(:each) do

        #Abrindo a tela de teste
        visit 'https://training-wheels-protocol.herokuapp.com/radios'
        page.windows[0].maximize

        #Valores esperados no teste
        @opcoes_values = ['cap','iron-man','thor','the-avengers','guardians','ant-man','black-panther']

    end

    after(:each) do sleep 2 end

    it 'Selecionando uma opção aleatória', :randomchoose do

        #selecionando uma opção aleatória
        input_value = "input[value=#{@opcoes_values.sample}]"
        opcao_da_vez = find(input_value)

        opcao_da_vez.click 

    end

    it 'Selecionando todas as opções', :chooseall do

        @opcoes_values.each do |opcao|

            input_value = "input[value=#{opcao}]"
            opcao_da_vez = find(input_value)

            opcao_da_vez.click 
            sleep 0.5
        end
    end
end