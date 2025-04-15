require_relative "../scraper.rb"

describe "#fetch_movies_url" do
  it "returns an array of 5 urls of the top 5 movies on IMDB" do
    expected_result = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/",
    ]

    expect(get_top_5_movie_urls).to eq(expected_result)
  end
end

describe "#fetch_movie_info(url)" do
  it "returns a hash with the movie info" do
    the_dark_knight_url = "https://www.imdb.com/title/tt0468569/"
    movie = fetch_movie_info(the_dark_knight_url)

    expected_result = {
      cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
      director: "Christopher Nolan",
      summary: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008,
    }

    expect(movie).to be.eq(expected_result)
  end
end
