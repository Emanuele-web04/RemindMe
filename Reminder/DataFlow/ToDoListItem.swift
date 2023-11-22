//
//  ToDoListItem.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI

struct ToDoListItem: Identifiable {
    var id = UUID()
    var title: String
    var notes: String
    var isDone: Bool
}
