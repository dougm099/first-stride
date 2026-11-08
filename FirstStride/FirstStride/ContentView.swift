//
//  ContentView.swift
//  FirstStride
//
//  Created by alani quintanilla on 9/25/25.
//

import SwiftUI

// App entry point. Creates the one shared AuthViewModel here so every
// screen below sees the same login state through environmentObject.
struct ContentView: View {
    @StateObject private var auth = AuthViewModel()

    var body: some View {
        SplashView()
            .environmentObject(auth)
    }
}

#Preview {
    ContentView()
}
