class Artist
    attr_accessor :name
    attr_reader :songs
    @@song_count = 0

    def initialize(name)
        @name = name
        @songs = []
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
        @songs << song
        @@song_count += 1
    end

    def add_song_by_name(song_name)
        @song_name = Song.new("#{song_name}")
        self.add_song(@song_name)
    end

    def self.song_count
        Song.all.count
    end

end