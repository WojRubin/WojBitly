class Converter
  def initialize
    @alfabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//) 
  end

  def to_bitly_link(id)
    return @alfabet[0] if id == 0
    bitly_link = ''
    base = @alfabet.length
    while id > 0
      bitly_link << @alfabet[id.modulo(base)]
      id /= base
    end
    bitly_link.reverse
  end

  def find_id_real_link(link)
    id = 0
    base = @alfabet.length
    link.each_char do |c| 
      return nil unless @alfabet.include? c
      id = id * base + @alfabet.index(c) 
    end
    return nil if id > 2000000000
    id
  end
end