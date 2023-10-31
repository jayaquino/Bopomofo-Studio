//
//  DeveloperControlsViewModel.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr. on 11/26/22.
//

import Foundation
import Combine
import CoreBopomofoStudio
import ChatGPTAIProvider

@MainActor
class DeveloperControlsViewModel: ObservableObject {
    let contentStore: ContentStore
    let aiStore: AIStore
    
    @Published var didSeeOnboarding = false
    @Published var timerOverride = false
    @Published var soundTipOverride = false
    @Published var messages: [AIMessage] = []
    @Published var input = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(contentStore: ContentStore, aiStore: AIStore) {
        self.contentStore = contentStore
        self.aiStore = aiStore
        addSubscribers()
    }
    
    private func addSubscribers() {
        $didSeeOnboarding
            .sink { [weak self] didSeeOnboarding in
                if didSeeOnboarding {
                    self?.resetDidSeeOnboarding()
                }
            }
            .store(in: &cancellables)
        
        $timerOverride
            .sink { [weak self] timerOverride in
                self?.overrideTestTimerToFiveSeconds()
            }
            .store(in: &cancellables)
        
        $soundTipOverride
            .sink { [weak self] soundTipOverride in
                self?.overrideDidPlaySoundAtLeastOnce()
            }
            .store(in: &cancellables)
        
        $input
            .debounce(for: 5, scheduler: DispatchQueue.main)
            .sink { [weak self] input in
                guard let self, !input.isEmpty else { return }
                Task {
                    await self.sendMessage()
                }
            }
            .store(in: &cancellables)
    }
    
    func resetDidSeeOnboarding() {
        UserDefaults.didSeeOnboarding = false
    }
    
    func overrideTestTimerToFiveSeconds() {
        contentStore.timerValue = 5
    }
    
    func overrideDidPlaySoundAtLeastOnce() {
        UserDefaults.didPlayASoundAtLeastOnce = false
    }
    
    func sendMessage() async {
        let newMessage = AIMessage(id: UUID(), role: .user, content: input, createdAt: Date())
        messages.append(newMessage)
        
        do {
            let response = try await aiStore.sendMessage(messages: messages)
            guard let receivedAIMessage = response.choices.first?.message else { return }
            let receivedMessage = AIMessage(id: UUID(), role: receivedAIMessage.role, content: receivedAIMessage.content, createdAt: Date())
            messages.append(receivedMessage)
        } catch {
            print("error", error.localizedDescription)
        }
    }
}
