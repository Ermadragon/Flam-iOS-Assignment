final class SpotifyMusicSource: MusicSource {
    func load(song: Song) {
        print("Loaded Spotify song: \(song.title)")
    }
    
    func play() {
        print("Playing Spotify song")
    }
    
    func pause() {
        print("Paused Spotify song")
    }
    
    func stop() {
        print("Stopped Spotify song")
    }
}
