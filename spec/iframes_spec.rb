

describe 'Iframes', :iframes do
    describe 'nice', :nice_iframe do
        before(:each) do
            visit '/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            within_frame('burgerId') do
                product = find('.menu-item-info-box', text: 'REFRIGERANTE')
                product.find('a').click

                expect(find('#cart')).to have_content 'R$ 4,50'
            end
        end
    end

    describe 'bad', :bad_iframe do
        before(:each) do
            visit '/bad_iframe'
        end

        it 'carrinho deve estar vazio' do
            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio'
            end
        end
    end
end