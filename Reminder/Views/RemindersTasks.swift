//
//  RemindersTasks.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData

struct RemindersTasks: View {
    @Binding var showingModal: Bool
    @Query private var items: [ReminderStore]
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ToDoListItemView(item: item)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Reminders")
            .accentColor(.blue)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack(){
                        Button(action: {
                            showingModal = true
                        }) {
                            HStack(spacing: 5){
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 25, height: 25)
                                Text("New Reminder")
                                    .bold()
                                    .foregroundStyle(.blue)
                            }
                            
                        }
                        .sheet(isPresented: $showingModal) {
                            // Content of the modal view goes here
                            NewReminder()
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    RemindersTasks(showingModal: .constant(false))
        .accentColor(.blue)
}
