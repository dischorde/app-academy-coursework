require 'byebug'

class Card
  attr_reader :revealed, :face_value

  def self.make_card_pairs(num_pairs)
    card_pairs = []
    pool = ("a".."z").to_a.shuffle
    pool = pool.take(num_pairs).map(&:to_sym)

    pool.each do |face_val|
      card_pairs << Card.new(face_val)
      card_pairs << Card.new(face_val)
    end

    card_pairs.shuffle
  end

  def initialize(face_value)
    @revealed = false
    @face_value = face_value
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    @revealed ? "#{@face_value}" : "#"
  end

  def ==(other_card)
    object.is_a?(self.class) && @face_value == other_card.face_value
  end
end
