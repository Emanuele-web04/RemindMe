//
//  ReminderStore.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData

@Model
class ReminderStore {
    var title: String
    var notes: String
    var isDone: Bool

    init(title: String = "", notes: String = "", isDone: Bool = false) {
        self.title = title
        self.notes = notes
        self.isDone = isDone
    }
}

