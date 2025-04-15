require "open-uri"
require "nokogiri"

# Get the top 5 movies on this page: https://www.imdb.com/chart/top/
def scrape_urls
  # 1. define the url
  url = "https://www.imdb.com/chart/top/"

  # 2. open
  html_file = URI.parse(url).read(
    "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
    "Accept-Language" => "en",
  )

  # 3. parse
  html_doc = Nokogiri::HTML.parse(html_file)

  # 4. scrape and getting the url
  html_doc.search(".ipc-title-link-wrapper").first(5).map do |element|
    path = element.attribute("href").value.split("?").first

    "https://www.imdb.com#{path}"
  end

  # 5. return
end

# Create a method to scrape movie data from a specific movie page (ex. https://www.imdb.com/title/tt0111161/) - Title, Director, Cast, Year, Storyline, Rating
def scrape_movie_info(url)
  html_file = URI.parse(url).read(
    "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
    "Accept-Language" => "en",
  )

  html_doc = Nokogiri::HTML.parse(html_file)

  cast = html_doc.search("ul.ipc-metadata-list--dividers-all li:last-child li").first(3).map { |el| el.text.strip }

  director = html_doc.search(".ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link").first.text.strip
  summary = html_doc.search(".sc-42125d72-2.mmImo").text.strip
  title = html_doc.search(".hero__primary-text").text.strip
  year = html_doc.search(".ipc-inline-list.ipc-inline-list--show-dividers.sc-ec65ba05-2.joVhBE.baseAlt .ipc-inline-list__item").map do |element|
    element.text.strip
  end

  {
    cast: cast,
    director: director,
    summary: summary,
    title: title,
    year: year.first.to_i,
  }
end
