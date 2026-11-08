//
//  ProfileView.swift
//  FirstStride
//
//  Created by alani quintanilla on 9/25/25.
//
import SwiftUI
import FirebaseAuth

// Just shows whatever Firebase knows about the current user.
// Guests only have a UID, so email only shows up for email accounts.
struct ProfileView: View {
    var body: some View {
        VStack(spacing: 12) {
            if let u = Auth.auth().currentUser {
                Text("User ID:")
                Text(u.uid).font(.footnote).textSelection(.enabled)
                if let email = u.email { Text(email) }
                if u.isAnonymous { Text("Signed in as Guest").foregroundStyle(.secondary) }
            } else {
                Text("Not signed in")
            }
            Spacer()
        }
        .padding()
    }
}

