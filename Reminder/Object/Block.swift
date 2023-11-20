//
//  Block.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI

class Block: Identifiable {
    
    var calendarTypeNumber = [
        CalendarTypeNumber(iconCalendar: Image(systemName: "calendar.circle.fill"), type: "Today", number: 0, color: .blue),
        CalendarTypeNumber(iconCalendar: Image(systemName:"calendar.circle.fill"), type: "Schedules", number: 0, color: .red),
        CalendarTypeNumber(iconCalendar: Image(systemName:"tray.circle.fill"), type: "All", number: 0, color: Color.black.opacity(0.7)),
        CalendarTypeNumber(iconCalendar: Image(systemName:"flag.circle.fill"), type: "Flagged", number: 0, color: .orange),
        CalendarTypeNumber(iconCalendar: Image(systemName:"checkmark.circle.fill"), type: "Completed", number: 0, color: .secondary.opacity(0.7))
    ]
}
