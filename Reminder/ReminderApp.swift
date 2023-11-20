//
//  ReminderApp.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI
import SwiftData
@main
struct ReminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(.blue)
        }
        .modelContainer(for: ReminderStore.self)
    }
}
