require 'card'
RSpec.describe 'a playing card' do
  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7
    }
    Card.new(**defaults.merge(params))
  end
  it 'should have a suit' do
    raise unless card(suit: :spades).suit == :spades
  end
  it 'should have a rank' do
    raise unless card(rank: 4).rank == 4
    raise unless card(rank: :king).rank == 13
  end
  describe 'a jack' do
    it 'should rank higher than a 10' do
      raise unless card(rank: :jack).rank > card(rank: 10).rank
    end
  end
  describe 'a queen' do
    it 'should rank higher than a jack' do
      raise unless card(rank: :queen).rank > card(rank: :jack).rank
    end
  end
  describe 'a king' do
    it 'should rank higher than a queen' do
      raise unless card(rank: :king).rank > card(rank: :jack).rank
    end
  end
end