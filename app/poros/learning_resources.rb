class LearningResources
  attr_reader :country,
              :video,
              :images,
              :id

  def initialize(country, videos = [], images)
    @country  = country
    @video    = country_video(videos)
    @images   = country_image(images)
  end

  def country_video(videos)
    data =
    {
      title: videos[:items][1][:snippet][:title],
      youtube_video_id: videos[:items][1][:id][:videoId]
    }
  end

  def country_image(images)
    images[0..9].map do |image|
    {
      alt_tag: image[:alt_description],
      url: image[:urls][:raw]
    }
    end
  end
end