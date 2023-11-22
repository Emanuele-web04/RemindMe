//
//  ToDoListItemView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI


struct ToDoListItemView: View {
    var item: ReminderStore
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    item.isDone.toggle()
                }// Toggle the isDone property with animation
            } label: {
                Image(systemName: item.isDone ? "circle.inset.filled" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(item.isDone ? .blue : .gray)
            }
            HStack {
                VStack(alignment: .leading){
                    Text(item.title)
                    Text(item.notes)
                        .font(.caption2)
                        .foregroundStyle(.gray).opacity(0.8)
                }
                Spacer()
                Text("\(item.selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                               .font(.callout)
            }
        }
        .padding(1.5)
        
    }
}

