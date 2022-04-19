require_relative '../lib/gameplay.rb'



describe Gameplay do 
    before do 
        
        
        
    end

    describe 'new_game' do
        it 'new_game includes an array of hashes' do
        expect(new_game.empty?).to eq(false)
        end
        it 'checks that the array contains all the questions' do 
            expect(new_game.size).to eq(8)
        end
    end

    describe 'question' do
        it 'includes a question' do
            expect(new_game[0].prompt).to eq("Who is the developer of Ruby?")
        end
    end

    describe 'options' do
         it 'includes an array of options' do
            expect(new_game[0].options).to eq(["a) Yukihiro Matsumoto", "b) Bill Gates", "c) Brendan Eich", "d) Satoshi Nakamoto"])
        end
    end

    describe 'answer' do 
        it 'includes an answer' do
            expect(new_game[0].answer).to eq("a) Yukihiro Matsumoto")
        end
    end

    describe 'value' do
        it 'includes a question value' do
            expect(new_game[0].value).to eq("$100")
         end
     end

end





