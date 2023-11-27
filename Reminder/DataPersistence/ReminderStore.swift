//
//  ReminderStore.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import Foundation
import SwiftData

@Model
final class ReminderStore: Identifiable {
    var id: UUID
    var title: String
    var notes: String
    var isDone: Bool
    var selectDate: Date?
    var isSwitchOn: Bool
    var isSwitchDateOn: Bool
    var isSwitchFlagOn: Bool
    var priorityStatus: String
    
    @Attribute(.externalStorage)
    var image: Data?
    
    init(title: String = "", 
         notes: String = "",
         isDone: Bool = false,
         selectDate: Date = .now,
         isSwitchOn: Bool = false,
         isSwitchDateOn: Bool = false,
         isSwitchFlagOn: Bool = false,
         priorityStatus: String = "None"
    ) {
        self.title = title
        self.notes = notes
        self.isDone = isDone
        self.selectDate = selectDate
        self.id = UUID()
        self.isSwitchOn = isSwitchOn
        self.isSwitchDateOn = isSwitchDateOn
        self.isSwitchFlagOn = isSwitchFlagOn
        self.priorityStatus = priorityStatus
    }
}

extension ReminderStore {
    
    static var dummy: ReminderStore {
        .init(title: "Item 1",
              notes: "Item 2",
              isDone: false,
              selectDate: .now,
              isSwitchOn: false,
              isSwitchDateOn: false,
              isSwitchFlagOn: false,
              priorityStatus: "None"
        )
    }
}

