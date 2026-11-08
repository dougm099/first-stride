//
//  WorkoutsView.swift
//  FirstStride
//
//  Created by alani quintanilla on 9/25/25.
//
import SwiftUI
import FirebaseAuth

// Workout log. The "Add Sample Workout" button just writes one hard-coded
// 30-min run so I can test Firestore without building the real entry form yet.
struct WorkoutsView: View {
    @State private var status = ""
    @State private var workouts: [Workout] = []
    let store = FirestoreService()

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button("Add Sample Workout") {
                    Task {
                        guard let uid = Auth.auth().currentUser?.uid else { return }
                        let w = Workout(userId: uid, date: .now, type: "Run", durationMinutes: 30, distanceKm: 5.0)
                        do {
                            try await store.addWorkout(w)
                            status = "Saved!"
                            try await load()
                        } catch {
                            status = "Error: \(error.localizedDescription)"
                        }
                    }
                }
                Button("Refresh") {
                    Task { try? await load() }
                }
            }

            Text(status).font(.footnote).foregroundStyle(.secondary)

            List(workouts) { w in
                VStack(alignment: .leading) {
                    Text("\(w.type) • \(w.durationMinutes) min")
                        .font(.headline)
                    if let d = w.distanceKm {
                        Text("\(String(format: "%.2f", d)) km").font(.subheadline)
                    }
                    Text(w.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        // Loads the list when the view first appears.
        // try? on purpose: a failed load shouldn't crash the screen.
        .task { try? await load() }
    }

    private func load() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        workouts = try await store.recentWorkouts(for: uid)
    }
}

