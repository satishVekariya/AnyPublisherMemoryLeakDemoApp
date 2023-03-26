//
//  ContentView.swift
//  AnyPublisherMemoryLeakDemo
//
//  Created by Satish Vekariya on 26/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack() {
            Text("Content screen")
        }
        .padding()
    }
}

class ContentViewModel: ObservableObject {
    private let serviceRepo = ContentRepoService()
}

import Combine

class ContentRepoService {
    let timerSequence = Timer.publish(every: 1, on: .main, in: .default).autoconnect().values
    
    init() {
        Task { [weak self] in
            await self?.setUpStreamIteration()
        }
        print("Init ContentRepoService")
    }
    
    deinit {
        print("Deinit ContentRepoService")
    }
    
    func setUpStreamIteration() async {
        for await time in timerSequence {
            await onTimerTick(time)
        }
    }
    
    private func onTimerTick(_ date: Date) async {
        // Do some work
        print("onTimerTick: ", time)
    }
}
