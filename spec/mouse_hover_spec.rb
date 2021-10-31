
describe 'Mouse hover', :mouse_hover do
    before(:each) do
        visit '/hovers'
    end

    it 'quando passo o mouse sobre o blade' do
        card = find('img[alt*=Blade]') #asterisco = contém determinado elemento na tela
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o pantera negra' do
        card = find('img[alt^=Pantera]') #acento circunflexo = contém elemento iniciado com "valor" na tela
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passo o mouse sobre o homem aranha' do
        card = find('img[alt$=Aranha]') #dolar = contém elemento finalizando com "valor" na tela
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end
end