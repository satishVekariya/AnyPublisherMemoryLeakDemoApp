//
//  AnyPublisherMemoryLeakDemoApp.swift
//  AnyPublisherMemoryLeakDemo
//
//  Created by Satish Vekariya on 26/03/2023.
//

import SwiftUI

@main
struct AnyPublisherMemoryLeakDemoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink("Open settings") {
                        ContentView()
                    }
                }
            }
        }
    }
}
