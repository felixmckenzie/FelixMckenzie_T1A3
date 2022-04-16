require_relative '../lib/quiz'

describe Quiz do 
    before do 
        Quiz.new
        Quiz.get_data
    end

    describe 'all' do
        it 'all includes an array of hashes' do
        expect(Quiz.all.empty?).to eq(false)
        end
    end

    describe 'question' do
        it 'includes a question' do
            expect(Quiz.all[0].prompt).to eq("Who is the developer of Ruby?")
        end
    end

    describe 'options' do
         it 'includes an array of options' do
            expect(Quiz.all[0].options).to eq(["a) Yukihiro Matsumoto", "b) Bill Gates", "c) Brendan Eich", "d) Satoshi Nakamoto"])
        end
    end

    describe 'answer' do 
        it 'includes an answer' do
            expect(Quiz.all[0].answer).to eq("a) Yukihiro Matsumoto")
        end
    end

    describe 'value' do
        it 'includes a question value' do
            expect(Quiz.all[0].value).to eq("$100")
         end
     end

end





