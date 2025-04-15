require_relative "scraper"
require "yaml"

movie_urls = scrape_urls

movies = movie_urls.map do |url|
  scrape_movie_info(url)
end

filepath = "movies.yml"

File.open(filepath, "wb") do |file|
  file.write(movies.to_yaml)
end
