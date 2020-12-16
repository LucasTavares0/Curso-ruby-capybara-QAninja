
describe 'Upload de arquivos', :upload do

    before(:each) do

        #Encontrando o caminho do projeto
        @arquivo_texto = Dir.pwd + '/spec/fixtures/Teste-upload.txt'
        @arquivo_imagem = Dir.pwd + '/spec/fixtures/Imagem-upload.jpg'

        #Abrindo tela de upload de arquivo
        visit 'https://training-wheels-protocol.herokuapp.com/upload'
        page.windows[0].maximize

    end

    after(:each) do sleep 3 end

    it 'Upload de arquivo de texto', :upload_txt do

        #anexando arquivo 
        attach_file('file-upload', @arquivo_texto)
        click_button 'file-submit'

        expect(find('#uploaded-file').text).to eq 'Teste-upload.txt'
    end

    it 'Upload de arquivo de imagem', :upload_img do

        #anexando arquivo 
        attach_file('file-upload', @arquivo_imagem)
        click_button 'file-submit'
        sleep 5

        expect(find('#new-image')[:src]).to include 'Imagem-upload.jpg'
    end
end