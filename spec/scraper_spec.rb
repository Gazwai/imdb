require_relative "../scraper"

describe "#scrape_urls/0" do
  it "return an array of urls of the top 5 films from IMDB" do
    expected_result = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/",
    ]

    expect(scrape_urls).to eq(expected_result)
  end
end

describe "#scrape_movie_info/1" do
  it "return a hash from the movie requested" do
    url = "https://www.imdb.com/title/tt0468569/"
    expected_result = {
      cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
      director: "Christopher Nolan",
      summary: "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
      title: "The Dark Knight",
      year: 2008,
    }

    expect(scrape_movie_info(url)).to eq(expected_result)
  end
end
