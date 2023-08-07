class Capital
  attr_reader :capital

  def initialize(data)
    @capital = data[0][:capital][0]
  end
 end