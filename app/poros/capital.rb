class Capital
  attr_reader :capital

  def initialize(data)
    @capital = data[:capital][0]
  end
 end