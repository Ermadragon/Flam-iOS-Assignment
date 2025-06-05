final class LocalMusicSource: MusicSource {
    func load(song: Song) {
        print("Loaded local song: \(song.title)")
    }
    
    func play() {
        print("Playing local song")
    }
    
    func pause() {
        print("Paused local song")
    }
    
    func stop() {
        print("Stopped local song")
    }
}
