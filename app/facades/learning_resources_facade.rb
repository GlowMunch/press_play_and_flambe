class LearningResourcesFacade
  def initialize
    @video_service = VideosService.new
    @image_service = ImagesService.new
  end

  def get_images(country)
    images = @image_service.photos(country)[:results]
  end

  def get_videos(country)
    videos = @video_service.vid_search(country)
  end

  def learning_results(country)
    videos = get_videos(country)
    images = get_images(country)
    LearningResources.new(country, videos, images)
  end

  private
end
