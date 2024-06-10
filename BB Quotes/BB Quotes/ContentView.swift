//
//  ContentView.swift
//  BB Quotes
//
//  Created by Joel Espinal on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Breaking Bad View")
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            Text("Better Call Saul View")
                .tabItem {
                    Label("Better Call Saul", systemImage: "briefcase")
                }
        }
      
    }
}

#Preview {
    ContentView()
}
