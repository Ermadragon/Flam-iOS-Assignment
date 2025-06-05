final class PlayerViewModel: ObservableObject {
    @Published var currentSong: Song?
    @Published var isPlaying: Bool = false
    @Published var progress: TimeInterval = 0

    private var cancellables = Set<AnyCancellable>()

    init() {
        bind()
    }

    private func bind() {
        let player = MusicPlayer.shared
        player.$currentSong.assign(to: &$currentSong)
        player.$isPlaying.assign(to: &$isPlaying)
        player.$playbackProgress.assign(to: &$progress)
    }

    func play() {
        MusicPlayer.shared.play()
    }

    func pause() {
        MusicPlayer.shared.pause()
    }

    func next() {
        MusicPlayer.shared.next()
    }

    func previous() {
        MusicPlayer.shared.previous()
    }
}
