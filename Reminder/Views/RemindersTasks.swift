//
//  RemindersTasks.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData

struct RemindersTasks: View {
    @State private var isShowingModal2 = false
    @Environment (\.modelContext) var context
    @Environment (\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Query private var items: [ReminderStore]
    @State private var toDoToEdit: ReminderStore?
    @State private var isAddButtonDisabled = true


    
    func deleteItem(at offsets: IndexSet) {
            offsets.forEach { index in
                _ = items[index]
                // Assuming you have a data manager or a method to delete the item from your data source
            }
        }

    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(items.filter { !$0.isDone }) { item in
                        ToDoListItemView(item: item)
                            .swipeActions {
                                
                                Button(role: .destructive) {
                                    
                                    withAnimation(Animation.easeInOut(duration: 2.5)) {
                                        context.delete(item)
                                    }
                                    
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                
                                Button {
                                    toDoToEdit = item
                                    isAddButtonDisabled = false
                                    //isShowingModal2 = true
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.orange)
                                
                            }
                    }
                    .onDelete(perform: deleteItem)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: EmptyView()) // To ensure no back button is shown
        // Custom back button
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .bold()// Personalized icon
                Text("Lists") // Personalized text
            }
        })
        // Customize the title within the toolbar
        .listStyle(PlainListStyle())
        .accentColor(.blue) // This sets the color for all navigation bar items
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(alignment: .top, spacing: 15) {
                    Button(action: {}){
                        Image(systemName: "square.and.arrow.up")
                    }
                    Button(action: {}){
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            ToolbarItem(placement: .bottomBar) {
                HStack(spacing: 5) {
                    Button(action: {
                        isShowingModal2 = true
                        isAddButtonDisabled = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("New Reminder")
                            .bold()
                    }
                    Spacer()
                }
                
                
            }
            
            
        }
        .sheet(isPresented: $isShowingModal2){
            NewReminder()
        } .sheet(item: $toDoToEdit,
                 onDismiss: {
              toDoToEdit = nil
          },
                 content: { editItem in
              NavigationStack {
                  NewReminder(item: editItem)
                      .interactiveDismissDisabled()
              }
          })
        .navigationTitle("Reminders")
        .navigationBarTitleDisplayMode(.large)
        
        .accentColor(.blue)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// This preview will show the changes made above

