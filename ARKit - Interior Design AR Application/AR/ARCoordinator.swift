import ARKit
import RealityKit
import Combine

final class ARCoordinator: NSObject, ARSessionDelegate {
    private var arView: ARView!
    private var viewModel: ARViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: ARViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    func setupARView() -> ARView {
        arView = ARView(frame: .zero)
        arView.automaticallyConfigureSession = false
        arView.session.delegate = self

        let config = ARWorldTrackingConfiguration()
        config.sceneReconstruction = .meshWithClassification
        config.environmentTexturing = .automatic
        config.planeDetection = [.horizontal, .vertical]
        config.frameSemantics = .personSegmentationWithDepth // for occlusion
        arView.session.run(config)

        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        arView.environment.sceneUnderstanding.options.insert(.receivesLighting)

        installGestures()

        return arView
    }

    func updateFurnitureIfNeeded() {
        guard let item = viewModel.selectedFurniture else { return }
        loadFurniture(named: item.modelName)
        viewModel.selectedFurniture = nil
    }

    private func loadFurniture(named name: String) {
        guard let modelEntity = try? ModelEntity.loadModel(named: name) else { return }
        modelEntity.generateCollisionShapes(recursive: true)
        modelEntity.scale = SIMD3<Float>(repeating: 0.01)

        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(modelEntity)
        arView.scene.addAnchor(anchor)
    }

    private func installGestures() {
        arView.installGestures(.all, for: nil)
    }

    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        if let meshAnchors = frame.anchors.compactMap({ $0 as? ARMeshAnchor }), !meshAnchors.isEmpty {
            viewModel.isRoomScanned = true
        }
    }
}
