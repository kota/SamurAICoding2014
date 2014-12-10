class SamuraiAi
  def read_game_info
    @total_turns,@num_daimyos,@num_lords = self.read_integers
    @military_strength = self.read_integers
  end
  
  def read_turn_info
    @turn,@time = STDIN.gets.split(' ')
    @turn = @turn.to_i
    @ints = []
    @num_lords.times do |i|
      @ints << self.read_integers
    end
    @rs = self.read_integers
    if @time == 'D'
      @ns = self.read_integers
    end
  end

  def start
    write_command "READY"
    read_game_info
    while(true)
      read_turn_info
      self.write_command(generate_move)
    end
  end

  def write_command(str)
    STDOUT.puts str
    STDOUT.flush
  end

  def read_integers
    STDIN.gets.split(' ').map(&:to_i)
  end

  def generate_move
    if @time == 'D'
      rands = (0..4).map{ rand(5) }
    else
      rands = (0..1).map{ rand(5) }
    end
    rands.join(" ")
  end

end

SamuraiAi.new.start
