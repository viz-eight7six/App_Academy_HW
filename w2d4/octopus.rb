FISH_ARRAY = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
  ]


def sluggish_octopus(fish_arr)
  fish_arr.each_with_index do |fish, idx|
    biggest_fish = true
    fish_arr.each_with_index do |fish2, idx2|
      next if idx == idx2
      biggest_fish = false if fish.length < fish2.length
    end
    return fish if biggest_fish
  end
end

class Array
# Merge Sort: O(n*lg(n))
  def merge_sort ( &prc)
    return self if self.length <= 1

    mid_idx = self.length / 2
    merge(
      merge_sort(self.take(mid_idx), &prc),
      merge_sort(self.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def self.merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end
end


def dominant_octopus(fish_arr)
  fish_arr.merge_sort(Proc.new{|x,y| x.length <=> y.length}).last
end

def clever_octopus(fish_arr)
  biggest_fish = fish_arr.first
  fish_arr.each do |fish|
    biggest_fish = fish if biggest_fish.length < fish.length
  end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, array)
  array.each_with_index { |move, idx| return idx if dir == move }
end

tile_hash = {
  "up" => 0,
   "right-up" => 1,
   "right" => 2,
   "right-down" => 3,
   "down" => 4,
   "left-down" => 5,
   "left" => 6,
   "left-up" => 7}

def constant_dance(dir, hash)
  hash[dir]
end
