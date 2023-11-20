//
//  ListObject.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI

class ListObject: Identifiable {
    var listObject = [
        Lists(listIcon: Image(systemName: "list.bullet.circle.fill"), listTag: "Reminders", listCounterTasks: 0),
    ]
}
