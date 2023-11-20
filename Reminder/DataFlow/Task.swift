//
//  Task.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
}

