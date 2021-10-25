
describe 'Drag and Drop', :drag_and_drop do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'
    end

    it 'homem aranha no vermelho' do
        stark = find('.team-stark .column')
        cap = find ('.team-cap .column')

        spiderman = find('img[alt$=Aranha]')
        spiderman.drag_to stark

        aggregate_failures 'testing drag and drop' do
            expect(stark).to have_css 'img[alt$=Aranha]'
            expect(cap).not_to have_css 'img[alt$=Aranha]'
        end

    end
end