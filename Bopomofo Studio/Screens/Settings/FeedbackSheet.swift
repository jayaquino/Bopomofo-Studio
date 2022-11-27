//
//  FeedbackSheet.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/27/22.
//

import SwiftUI

struct FeedbackSheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            feedbackTextField
                .frame(maxWidth: 500, maxHeight: .infinity)
                .padding()
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .textFieldStyle(.roundedBorder)
            
            Button {
                viewModel.sendFeedback()
            } label: {
                Text("Send")
                    .font(.footnote)
            }
            .padding()
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("FEEDBACK_ALERT_TITLE"), dismissButton: .default(Text("ALERT_CONTINUE_BUTTON"), action: {
                dismiss()
            }))
        }
    }
    
    @ViewBuilder private var feedbackTextField: some View {
        if #available(iOS 16.0, *) {
            TextField("SEND_FEEDBACK_TEXTFIELD", text: $viewModel.feedback, axis: .vertical)
        } else {
            TextField("SEND_FEEDBACK_TEXTFIELD", text: $viewModel.feedback)
        }
    }
}

struct FeedbackSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSheet(viewModel: SettingsViewModel(contentStore: dev.contentStore, analytics: dev.analytics))
    }
}
