//
//  StatisticsView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 8/29/23.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject var viewModel: StatisticsViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Timer: \(viewModel.timerValue, specifier: "%.0f") s")
                    Slider(value: $viewModel.timerValue, in: 30...300, step: 10) { _ in
                        viewModel.resetValues()
                    }
                }
                Toggle("Pronunciation Assistance", isOn: $viewModel.pronunciationAssistance)
                
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        if let topicScores = viewModel.topicScores {
                            if topicScores.isEmpty {
                                Text("There are no records for the selected values.")
                            } else {
                                if let categoryModels = viewModel.categoryModels {
                                    ForEach(categoryModels, id: \.self) { category in
                                        ForEach(category.topicList, id: \.self) { topic in
                                            
                                            HStack(spacing: 16) {
                                                Text("\(topic.topicName) ")
                                                
                                                if let topicScore = viewModel.topicScores?[topic] {
                                                    Text(topicScore / 100, format: .percent)
                                                } else {
                                                    Text("NO_RECORD_AVAILABLE_TITLE")
                                                }
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                }
                            }
                        } else {
                            ProgressView()
                                .padding()
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8 ) {
                        Text("TIMER_MEANING_DESCRIPTION")
                        Text("PRONUNCIATION_ASSISTANCE_DESCRIPTION")
                        Text("PERCENT_MEANING_DESCRIPTION")
                        Text("ZERO_PERCENT_MEANING_DESCRIPTION")
                        Text("NO_RECORD_AVAILABLE_DESCRIPTION")
                    }
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(16)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .onChange(of: viewModel.pronunciationAssistance) { _ in
            viewModel.resetValues()
        }
        .task {
            await viewModel.calculateScorePercentages()
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: StatisticsViewModel(contentStore: dev.contentStore))
    }
}
