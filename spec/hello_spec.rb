describe "Primeiro script de teste" do
    it "visitar a pagina" do
        
        visit "https://training-wheels-protocol.herokuapp.com/"
        sleep 5 
        
        puts page.title
        expect(page.title).to eql "Training Wheels Protocol"
    end 
end 