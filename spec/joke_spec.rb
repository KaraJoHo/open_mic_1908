require './lib/joke'

RSpec.describe Joke do 
  let(:joke) {Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")}
  
  describe '#initialize' do 
    it 'exists ad has attributes' do
      expect(joke).to be_a(Joke)
      expect(joke.id).to eq(1)
      expect(joke.setup).to eq("Why did the strawberry cross the road?")
      expect(joke.punchline).to eq("Because his mother was in a jam.")
    end
  end
end