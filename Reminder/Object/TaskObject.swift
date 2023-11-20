//
//  TaskObject.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    // Add functions to modify tasks here
}

