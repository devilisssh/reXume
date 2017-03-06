class SearchController < ApplicationController

  before_action :authenticate_user!

  def results
    search_data = ThinkingSphinx.search("#{params[:query]}")
    @data = SearchDataSanitizer.new(search_data).process
  end

  def new
    respond_to do |format|
      format.pdf do
        render pdf: "file_name"
      end
      format.html {}
    end
  end
end
