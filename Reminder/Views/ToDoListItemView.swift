//
//  ToDoListItemView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData

struct ToDoListItemView: View {
    var item: ReminderStore
    @State private var isCircleFilled = false
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Button {
                    isCircleFilled.toggle()
                } label: {
                    Image(systemName: isCircleFilled ? "circle.inset.filled" : "circle")
                        .foregroundStyle(.blue)
                }
                Text(item.title)
                Text(item.notes)
                    .font(.caption)
                    .foregroundStyle(.gray).opacity(0.8)
            }
        }
        .frame(width: .infinity)
    }
}

