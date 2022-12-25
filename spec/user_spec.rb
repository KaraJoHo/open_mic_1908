require './lib/user'
require './lib/joke'

RSpec.describe User do 
  let(:sal) {User.new("Sal")}
  let(:joke_1) {Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")}
  let(:joke_2) {Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")}
  describe '#initialize' do 
    it 'exists and has a name and jokes' do 
      expect(sal).to be_a(User)
      expect(sal.name).to eq("Sal")
      expect(sal.jokes).to eq([])
    end
  end
end