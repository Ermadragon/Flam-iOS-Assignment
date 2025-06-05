import Combine

final class ARViewModel: ObservableObject {
    @Published var selectedFurniture: FurnitureItem?
    @Published var isRoomScanned = false
}
