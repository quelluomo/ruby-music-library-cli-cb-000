class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    songs.map do |song|
      song.artist
    end.uniq
  end

end
