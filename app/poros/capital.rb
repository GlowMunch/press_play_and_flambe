class Capital
  attr_reader :id,
              :city

  def initialize(data)
    @city = data[0][:capital][0]
  end
 end