//
//  ContentView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    
    @State private var searchText = ""
    var blockObject = Block()
    var listObj = ListObject()
    let gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 50), count: 2) // Adjust the spacing value as needed
    @State private var showingModal = false
    @Query private var items: [ReminderStore]
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    
                    ForEach(listObj.listObject) { list in
                        NavigationLink {
                            RemindersTasks(showingModal: .constant(false))
                        } label: {
                            HStack {
                                list.listIcon
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.white, Color.blue)
                                Text(list.listTag)
                                Spacer()
                                Text("\(items.count)")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                } header: {
                    VStack(alignment: .leading){
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(blockObject.calendarTypeNumber) { blocks in
                                BlockSchedule(block: blocks)
                                    .frame(width: 170)
                                    .textCase(.none)
                                    .foregroundStyle(Color.primary)
                                
                            }
                        }
                        Text("My Lists")
                            .textCase(nil)
                            .font(.title2)
                            .bold()
                            .fontDesign(.rounded)
                            .foregroundStyle(Color.primary)
                            .padding(.leading, -15)
                            .padding(.vertical, 5)
                    }
                    
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {}){
                            HStack{
                                Text("Edit lists")
                                Image(systemName: "square.and.pencil")
                            }
                        }
                        Button(action: {}){
                            HStack{
                                Text("Templates")
                                Image(systemName: "square.on.square")
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.blue)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    HStack(alignment: .center){
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
                        Spacer()
                        Button("Add List", action: {})
                            .foregroundStyle(.blue)
                        
                    }
                    .padding(.leading, -10)
                    .padding(.trailing, -10)
                    .font(.system(.body, design: .rounded))
                    
                }
                
            }
            // miett hstack
            .searchable(text: $searchText)
            .font(.system(.body, design: .rounded))
        }
    }
}

// Applies rounded design to the default body font style




#Preview {
    ContentView()
}

