import SwiftUI
import RealityKit
import ARKit

struct ARViewRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: ARViewModel

    func makeCoordinator() -> ARCoordinator {
        ARCoordinator(viewModel: viewModel)
    }

    func makeUIView(context: Context) -> ARView {
        return context.coordinator.setupARView()
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        context.coordinator.updateFurnitureIfNeeded()
    }
}
