
describe 'Caixa de seleção', :dropdown do

    before(:all) do
        
        #urls de teste
        @url_dropdown = 'https://training-wheels-protocol.herokuapp.com/dropdown'

        #Valores da lista de opções
        @opcoes =   ['Steve Rogers','Bucky','Tony Stark', 'Natasha Romanoff', 
                    'Bruce Banner', 'Loki', 'Scott Lang']
    end

    it 'Selecionar todos os elementos da lista' do

        #Acessando página
        visit @url_dropdown
        page.windows[0].maximize

        #Selecionando todos os elementos da lista de arrays
        cont = 0
        while(cont < @opcoes.length) do
            select(@opcoes[cont] , from: 'dropdown')
            sleep 1
            cont += 1
        end
        
        sleep 2
    end

    it 'Selecionar um elemento especifico da lista' do

        #Acessando página
        visit @url_dropdown
        page.windows[0].maximize

        #Selecionando um elemento aleatorio da lista de opcoes
        lista = find('.avenger-list')
        lista.find('option', text: @opcoes.sample).select_option

        #Selecionando um item aleatório disponibilizado pela lista
        #lista.all('option').sample.select_option
        
        sleep 2
    end
end