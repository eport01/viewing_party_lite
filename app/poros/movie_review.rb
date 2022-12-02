class MovieReview 
  attr_reader :author,
              :content

  def initialize(attributes)
    # @review_results = attributes[:results]
    @author = attributes[:author]
    @content = attributes[:content]
  end
end