class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones

  end

  def place_stones
    (0..13).each do |i|
      next if i == 6 || i == 13
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13
      raise ArgumentError.new "Invalid starting cup"
    end
    if start_pos < 0
      raise ArgumentError.new "Invalid starting cup"
    end


  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    pos = start_pos
    until stones == 0
      if pos != 13
        @cups[pos] << :stone
        stones -= 1
        pos += 1
      else
        pos = 0
      end
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0...6].all? {|cup| cup.empty?}
    return true if @cups[7...13].all? {|cup| cup.empty?}
    false
  end

  def winner
  end
end
