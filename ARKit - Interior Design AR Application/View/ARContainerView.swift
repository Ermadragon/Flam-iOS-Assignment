import SwiftUI

struct ARContainerView: View {
    @StateObject private var viewModel = ARViewModel()

    var body: some View {
        ZStack {
            ARViewRepresentable(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(sampleFurniture) { item in
                            Button(action: {
                                viewModel.selectedFurniture = item
                            }) {
                                Text(item.name)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(8)
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}

private let sampleFurniture = [
    FurnitureItem(name: "Chair", modelName: "chair.usdz"),
    FurnitureItem(name: "Table", modelName: "table.usdz")
]
