//
//  ToDoListItemView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData

struct ToDoListItemView: View {
    @Bindable var item: ReminderStore
    var body: some View {
        HStack {
            if item.notes == "" {
                Button {
                    withAnimation {
                        item.isDone.toggle()
                    }// Toggle the isDone property with animation
                } label: {
                    Image(systemName: item.isDone ? "circle.inset.filled" : "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(item.isDone ? .blue : .gray)
                        .sensoryFeedback(.success, trigger: item.isDone)
                }
                HStack {
                    VStack(alignment: .leading){
                        Text(item.title)
                    }
                    Spacer()
                    Text(item.selectDate != nil
                         ? "\(item.selectDate!, format: Date.FormatStyle(date: .numeric, time: .shortened))"
                         : "No Date")
                       .font(.callout)

                }
            } else {
                Button {
                    withAnimation {
                        item.isDone.toggle()
                    }// Toggle the isDone property with animation
                } label: {
                    Image(systemName: item.isDone ? "circle.inset.filled" : "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(item.isDone ? .blue : .gray)
                        .sensoryFeedback(.success, trigger: item.isDone)
                }
                HStack {
                    VStack(alignment: .leading){
                        Text(item.title)
                        Text(item.notes)
                            .font(.caption2)
                            .foregroundStyle(.gray).opacity(0.8)
                    }
                    Spacer()
                    Text(item.selectDate != nil
                         ? "\(item.selectDate!, format: Date.FormatStyle(date: .numeric, time: .shortened))"
                         : "No Date")
                    .font(.callout).foregroundStyle(.gray).opacity(0.8)

                }
            }
            
        }
        .padding(1.5)
        
    }
}

