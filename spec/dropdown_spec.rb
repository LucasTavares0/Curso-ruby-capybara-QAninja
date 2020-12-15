
describe 'Caixa de opções', :dropdown do

    before(:each) do

        #Acessando página
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        page.windows[0].maximize

         #Valores da lista de opções
         @opcoes =   ['Steve Rogers','Bucky','Tony Stark', 'Natasha Romanoff', 
         'Bruce Banner', 'Loki', 'Scott Lang']
    end

    it 'Selecionar todos os elementos da lista' do

        #Selecionando todos os elementos da lista de arrays
        cont = 0
        while(cont < @opcoes.length) do
            select(@opcoes[cont] , from: 'dropdown')
            sleep 1
            cont += 1
        end
    end

    it 'Selecionar um elemento especifico da lista' do

        #Selecionando um elemento aleatorio da lista de opcoes
        lista = find('.avenger-list')
        lista.find('option', text: @opcoes.sample).select_option
        sleep 1
        
        #Selecionando um item aleatório disponibilizado pela lista
        #lista.all('option').sample.select_option
    end
end