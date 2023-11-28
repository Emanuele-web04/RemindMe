//
//  NotificationHandler.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 24/11/23.
//

import Foundation
import SwiftData
import UserNotifications

class NotificationHandler {

    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
//    func showNotification(item: ReminderStore) {
//        if item.isSwitchNotificationOn {
//            self.sendNotification(
//                date: item.selectDate ?? Date.now,
//                type: "date",
//                title: item.title,
//                body: item.notes
//            )
//        }
//    }
    
    func sendNotification(date: Date, type: String, title: String, body: String) -> String {
        var trigger: UNNotificationTrigger?
        
        // Create a trigger (either from date or time based)
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } 
        // Customise the content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        // Create the request
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request)
        
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        return identifier
    }
    
    func cancelNotification(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
}
