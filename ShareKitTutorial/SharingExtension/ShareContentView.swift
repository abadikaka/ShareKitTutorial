//
//  ShareContentView.swift
//  SharingExtension
//
//  Created by Michael Abadi Santoso on 2/21/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import SwiftUI
import SelectorUIViewKitTutorial
import NetworkKitTutorial

/// The view of the share content
struct ShareContentView: View {

    @ObservedObject var model = SourcesListViewModel()

    private let selector = SelectorEngine()
    private let scene = SelectorEngine()
    
    var body: some View {
        LoadingView(isShowing: $model.loading) {
            self.scene.getSelectorView(withUsers: self.model.sources)
        }
    }

}

/// Custom ActivityIndicator for the loading view
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

/// Loading View that wrap the activity indicator
struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(self.isShowing), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }

}

/// ViewModel for getting the model object
class SourcesListViewModel: ObservableObject {
    
    @Published var loading = false
    @Published var sources = [User]()

    private let network = NetworkKit()
    
    init() {
        fetchSources()
    }
    
    private func fetchSources() {
        loading = true
        network.sendRequest(Request(), type: .get) { result, error in
            guard let result = result else { return }
            self.loading = false
            if let finalResult = result as? [[String: Any]] {
                for user in finalResult {
                    let jsonData = try! JSONSerialization.data(withJSONObject: user, options: .prettyPrinted)
                    let finalUser = try! JSONDecoder().decode(User.self, from: jsonData)
                    self.sources.append(finalUser)
                }
            }
        }
    }
}
