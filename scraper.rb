require "open-uri"
require "nokogiri"
# Get the top 5 movies on this page: https://www.imdb.com/chart/top/

def fetch_movies_url
  # Get the top 5 movies on this page
  url = "https://www.imdb.com/chart/top/"

  html_file = URI.parse(url).read("User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36")

  html_doc = Nokogiri::HTML.parse(html_file)

  html_doc.search(".ipc-title-link-wrapper").first(5).map do |element|
    element.attribute("href").value.split("?")
  end
end

def fetch_movie_info(url)


end
