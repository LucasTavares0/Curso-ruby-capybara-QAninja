
describe 'Mouse Hovers', :hovers do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/hovers'
        page.windows[0].maximize
    end

    after(:each) do sleep 2 end

    it 'Quando eu passo o mouse sobre o Blade' do

        bladeImage = find('img[alt=Blade]')
        bladeImage.hover 

        expect(page).to have_content 'Nome: Blade'
    end
end 