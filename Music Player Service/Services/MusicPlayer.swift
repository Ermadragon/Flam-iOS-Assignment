final class MusicPlayer: ObservableObject {
    static let shared = MusicPlayer()
    private init() {}

    @Published private(set) var currentSong: Song?
    @Published private(set) var isPlaying = false
    @Published private(set) var playbackProgress: TimeInterval = 0

    private var queue: [Song] = []
    private var currentIndex = 0
    private var source: MusicSource?

    func setSource(_ source: MusicSource) {
        self.source = source
    }

    func addToQueue(_ song: Song) {
        queue.append(song)
    }

    func play() {
        guard let source else { return }
        guard !queue.isEmpty else { return }

        currentSong = queue[currentIndex]
        source.load(song: queue[currentIndex])
        source.play()
        isPlaying = true
    }

    func pause() {
        source?.pause()
        isPlaying = false
    }

    func next() {
        guard currentIndex + 1 < queue.count else { return }
        currentIndex += 1
        play()
    }

    func previous() {
        guard currentIndex - 1 >= 0 else { return }
        currentIndex -= 1
        play()
    }

    func reorderQueue(from: Int, to: Int) {
        let song = queue.remove(at: from)
        queue.insert(song, at: to)
    }

    func removeSong(at index: Int) {
        queue.remove(at: index)
    }

    func clearQueue() {
        queue.removeAll()
    }
}
