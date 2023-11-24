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
    @Binding var isSwitchOn: Bool
    @Binding var isSwitchDateOn: Bool
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
                    if let selectDate = item.selectDate {
                        if (isSwitchOn || isSwitchDateOn) {
                            Text("\(selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                .font(.callout)
                                .foregroundStyle(selectDate > Date.now ? .gray : .red)
                        } else if (!isSwitchOn && !isSwitchDateOn){
                            Text("")
                        }
                    }
                    
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
                    if let selectDate = item.selectDate {
                        Text(item.selectDate != nil
                             ? "\(selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))"
                             : "No Date")
                        .font(.callout)
                        .foregroundStyle(selectDate > .now ? .gray : .red)
                    }
                }
            }
            
        }
        .padding(1.5)
        
    }
}

