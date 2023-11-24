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
//
//    let modelContainer: ModelContainer
//    
//    init() {
//        do {
//            modelContainer = try ModelContainer(for: ReminderStore.self)
//        } catch {
//            fatalError("Could not initialize ModelContainer")
//        }
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(isSwitchOn: .constant(false), isSwitchDateOn: .constant(false))
        }
        .modelContainer(for: ReminderStore.self)
    }
}
