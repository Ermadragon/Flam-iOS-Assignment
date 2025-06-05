enum MusicSourceType {
    case local
    case spotify

    func createSource() -> MusicSource {
        switch self {
        case .local:
            return LocalMusicSource()
        case .spotify:
            return SpotifyMusicSource()
        }
    }
}
