require './lib/user'
require './lib/joke'

RSpec.describe User do 
  let(:sal) {User.new("Sal")}
  let(:ali) {User.new("Ali")}
  let(:joke_1) {Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")}
  let(:joke_2) {Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")}
  describe '#initialize' do 
    it 'exists and has a name and jokes' do 
      expect(sal).to be_a(User)
      expect(sal.name).to eq("Sal")
      expect(sal.jokes).to eq([])
    end
  end

  describe '#learn' do 
    it 'can learn jokes and have those added to the list of jokes' do 
      sal.learn(joke_1)
      sal.learn(joke_2)
      
      expect(sal.jokes).to eq([joke_1, joke_2])
    end
  end

  describe '#tell' do 
    it 'can tell another user a joke and that user has new jokes added to their list' do 
      sal.tell(ali, joke_1)
      sal.tell(ali, joke_2)

      expect(ali.jokes).to eq([joke_1, joke_2])
    end
  end
end