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

end


