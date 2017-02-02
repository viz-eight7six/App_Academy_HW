class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
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
    elsif start_pos < 0
      raise ArgumentError.new "Invalid starting cup"
    end


  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    side = (current_player_name == @player1 ? 1 : 2)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    pos = start_pos
    until stones.empty?
      pos += 1
      pos = 0 if pos > 13
      if pos == 6
        @cups[pos] << stones.pop if side == 1
      elsif pos == 13
        @cups[pos] << stones.pop if side == 2
      else
        @cups[pos] << stones.pop
      end
    end
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
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
    return :draw if @cups[6] == @cups[13]
    return @player1 if @cups[6].length > @cups[13].length
    return @player2 if @cups[13].length > @cups[6].length
  end
end
