//
//  CalendarTypeNumber.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI

struct CalendarTypeNumber: Identifiable {
    var id = UUID()
    var iconCalendar: Image
    var type: String
    var number: Int
    var color: Color
}
