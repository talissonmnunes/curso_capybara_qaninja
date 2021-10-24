
describe 'Botões de radio', :radio do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/radios'
    end

    it 'seleção por id' do
        choose('cap')
    end

    it 'seleção por find e css' do
        find('input[value="guardians"]').click
    end

end