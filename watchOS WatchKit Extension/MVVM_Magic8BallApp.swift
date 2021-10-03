//
//  MVVM_Magic8BallApp.swift
//  watchOS WatchKit Extension
//
//  Created by Steven Zhang on 2021-10-02.
//

import SwiftUI

@main
struct MVVM_Magic8BallApp: App {
    
    @StateObject private var advisor = AdviceViewModel()
    
    var body: some Scene {
        WindowGroup {

            TabView {

                NavigationView {
                    ContentView(advisor: advisor)
                }
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Ask")
                }

                NavigationView {
                    HistoryView(advisor: advisor)
                }
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
            }
        }
    }
}
