//
//  Lists.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI

struct Lists: Identifiable {
    var id = UUID()
    var listIcon: Image
    var listTag: String
    var listCounterTasks: Int
}
