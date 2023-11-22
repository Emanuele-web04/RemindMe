//
//  ReminderStore.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData

@Model
final class ReminderStore: Identifiable {
    var id: UUID
    var title: String
    var notes: String
    var isDone: Bool
    var selectDate: Date?
    
    init(title: String = "", notes: String = "", isDone: Bool = false, selectDate: Date = .now) {
        self.title = title
        self.notes = notes
        self.isDone = isDone
        self.selectDate = selectDate
        self.id = UUID()
    }
}

extension ReminderStore {
    
    static var dummy: ReminderStore {
        .init(title: "Item 1",
              notes: "Item 2",
              isDone: false,
              selectDate: .now)
    }
}

