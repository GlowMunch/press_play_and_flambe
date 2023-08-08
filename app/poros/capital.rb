#make poro similar to the
#service its pulling from
class Capital
  attr_reader :id,
              :city

  def initialize(data)
    @city = data[:capital][0]
  end
end