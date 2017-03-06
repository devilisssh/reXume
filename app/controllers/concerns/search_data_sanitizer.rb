class SearchDataSanitizer

  def initialize(search_data=[])
    @search_data = search_data
  end

  def process
    @search_data.collect do |sd|
      if sd.is_a?(Resume)
        sd.user
      elsif sd.is_a?(User)
        sd
      else
        sd.resume.user
      end
    end.uniq.compact
  end
end