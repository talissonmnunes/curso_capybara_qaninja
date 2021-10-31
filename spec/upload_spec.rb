
describe 'Upload de arquivos', :upload do
    before(:each) do
        @arquivo = Dir.pwd + '/spec/upload_archives/arquivo.txt'
        @imagem = Dir.pwd + '/spec/upload_archives/ArcheAge_sample.jpg'

        visit '/upload'
    end

    it 'upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'upload de imagem' do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        img = find('#new-image')
        expect(img[:src]).to include '/uploads/ArcheAge_sample.jpg'
    end

end