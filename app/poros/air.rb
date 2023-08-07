class Air
  attr_reader :id,
              :aqi,
              :pm25_concentration,
              :co_concentration

  def initialize(data)
    @id                 = nil
    @aqi                = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"][:concentration]
    @co_concentration   = data[:CO][:concentration]
  end
 end