
describe 'Caixa de opção', :dropdown do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
    end

    it 'item especifico simples' do       
        select('Loki', from: 'dropdown')
    end

    it 'item especifico com o find' do
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
    end

    it 'qualquer item', :sample do
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end

end