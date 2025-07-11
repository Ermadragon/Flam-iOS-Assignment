struct Song: Identifiable, Equatable {
    let id: UUID
    let title: String
    let artist: String
    let duration: TimeInterval
    let url: URL?
    
    init(title: String, artist: String, duration: TimeInterval, url: URL? = nil) {
        self.id = UUID()
        self.title = title
        self.artist = artist
        self.duration = duration
        self.url = url
    }
}
