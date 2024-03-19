//
//  ViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 3/18/24.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    
    var dismissView: DismissAction?
    
    /// A property that tells the view to display the error that is set. If there is no error, the value will not change.
    @Published var displayError = false
    
    /// An `Error` that will be displayed in an alert when set.
    @Published var error: Error? {
        didSet {
            displayError = error != nil
        }
    }
    
    /// If true, the view model will dismiss the linked view when a deep link for a video is activated.
    var shouldDismissForVideoDeepLink = true
    
    /// If false, the view model will prevent the display of any video deep links.
    var supportsVideoDeepLink = true
    
    init() { }
    
    func onAppear() { }
    func onDisappear() { }
}

struct ViewModelLinkingViewModifier: ViewModifier {
    @StateObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject var router: Router
    
    @State var displayError = false {
        didSet {
            if viewModel.displayError != displayError {
                viewModel.displayError = displayError
            }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                viewModel.dismissView = dismiss
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDisappear()
            }
            .alert("Oops, something went wrong", isPresented: $displayError) {
                Button("Ok", role: .cancel) {
                    viewModel.displayError = false
                }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "")
            }
            .onChange(of: viewModel.displayError) { newValue in
                self.displayError = newValue
            }
    }
}

extension View {
    /// Automatically displays an alert whenever an error is set. When an error occurs, set the `error` property of the view model to display an error.
    func linkToViewModel(_ viewModel: ViewModel) -> some View {
        modifier(ViewModelLinkingViewModifier(viewModel: viewModel))
    }
}
