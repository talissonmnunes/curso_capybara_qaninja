
describe 'Forms' do

    it 'login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in "userId",	with: "stark" 
        fill_in "password",	with: "jarvis!"
        
        click_button 'Login'

        aggregate_failures 'testing login' do
            expect(find('#flash').visible?).to be true
            expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
            expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
        end
    end

    it 'senha incorreta' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in "userId",	with: "stark" 
        fill_in "password",	with: "teste!"
        
        click_button 'Login'

        aggregate_failures 'testing login' do
            expect(find('#flash').visible?).to be true
            expect(find('#flash').text).to include 'Senha é invalida!'
            expect(find('#flash')).to have_content 'Senha é invalida!'
        end
    end

    it 'usuário não cadastrado' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in "userId",	with: "teste" 
        fill_in "password",	with: "jarvis!"
        
        click_button 'Login'

        aggregate_failures 'testing login' do
            expect(find('#flash').visible?).to be true
            expect(find('#flash').text).to include 'O usuário informado não está cadastrado!'
            expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
        end
    end
end