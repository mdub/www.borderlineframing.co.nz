# project.assume_content_negotiation = true
# project.assume_directory_index = true

project.helpers do

  def quote(from, &block)
    include("/_partials/quote.html.haml", from: from, &block)
  end

end
