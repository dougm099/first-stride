# First-Stride

A SwiftUI fitness app backed by Firebase. This is an early-stage project: it has working auth and a workout log, with the dashboard still a placeholder.

## What it does

- Splash screen that routes you to sign-in or the app based on whether Firebase has a user session.
- Firebase Auth with three options: sign in with email/password, create an account, or continue as a guest (anonymous).
- Workout logging to Firestore: workout type, duration in minutes, and optional distance in km, stored per user.
- A slide-over side menu to move between Dashboard, Workouts, and Profile screens.

## Firebase setup (required to run it)

You need your own Firebase project with **Authentication** and **Firestore** enabled:

1. In the Firebase console, enable the Email/Password and Anonymous sign-in providers.
2. Create a Firestore database (start in test mode while developing).
3. Add an iOS app to the project and download `GoogleService-Info.plist` into the `FirstStride/FirstStride` folder in Xcode. This file is **not in the repo** on purpose (it contains your project keys); see `.gitignore`.

The Firestore collection is `workouts`, one document per workout with fields `id`, `userId`, `date` (Timestamp), `type`, `durationMinutes`, and optional `distanceKm`.

## Source layout

- `FirstStrideApp.swift` — app entry, configures Firebase and the SwiftData container.
- `ContentView.swift` — creates the single shared `AuthViewModel` and passes it down.
- `SplashView.swift` — startup screen, routes to auth or the app shell based on login state.
- `AuthView.swift` / `AuthViewModel.swift` — sign-in UI and the Firebase auth logic behind it.
- `AppShell.swift` — side menu navigation between the three main screens.
- `DashboardView.swift` — placeholder for now; will hold workout stats.
- `WorkoutsView.swift` — add/list workouts via `FirestoreService`.
- `FirestoreService.swift` — all Firestore reads and writes in one place.
- `ProfileView.swift` — shows the current user's Firebase info.

Note: `Item.swift` is a leftover from the Xcode template and isn't used yet.
