require './lib/joke'
require './lib/user'
require './lib/open_mic'

RSpec.describe OpenMic do 
  let(:open_mic) {OpenMic.new({location: "Comedy Works", date: "11-20-18"})}
  let(:sal) {User.new("Sal")}
  let(:ali) {User.new("Ali")}
  let(:joke_1) {Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")}
  let(:joke_2) {Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")}

  describe '#initialize' do 
    it 'exists and has attributes' do 
      expect(open_mic).to be_a(OpenMic)
      expect(open_mic.location).to eq("Comedy Works")
      expect(open_mic.date).to eq("11-20-18")
      expect(open_mic.performers).to eq([])
    end
  end

  describe '#welcome' do 
    it 'can add performers' do 
      open_mic.welcome(sal)
      open_mic.welcome(ali)

      expect(open_mic.performers).to eq([sal, ali])
    end
  end

  describe '#repeated_jokes?' do 
    it 'returns true if one perfmoer learns a joke from another' do 
      open_mic.welcome(sal)
      open_mic.welcome(ali) 
      ali.learn(joke_1) 
      ali.learn(joke_2) 

      expect(ali.jokes).to eq([joke_1, joke_2])

      expect(open_mic.repeated_jokes?).to eq(false)

      ali.tell(sal, joke_1) 

      expect(sal.jokes).to eq([joke_1])

      expect(open_mic.repeated_jokes?).to eq(true)
    end
  end
end