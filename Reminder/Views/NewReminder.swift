//
//  NewReminder.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//


import SwiftUI
import SwiftData
struct NewReminder: View {
    var blockObject = Block()
    var listObj = ListObject()
    @State var item = ReminderStore()
    @Binding var isAddButtonDisabled: Bool
    @Binding var isSwitchOn: Bool
    @Binding var isSwitchDateOn: Bool
    @Environment (\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    @State private var showingAlert = false
    @State private var newItemPresented = false
    @State var dismissed = false
    @FocusState var isTextFieldFocused
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Title", text: $item.title)
                        .onChange(of: item.title, initial: isAddButtonDisabled) {
                            isAddButtonDisabled = false
                        }
                        .focused($isTextFieldFocused)
                                    .onAppear {
                                        DispatchQueue.main.async {
                                            self.isTextFieldFocused = true
                                        }
                                    }
                        .accentColor(.blue)
                    ZStack(alignment: .leading) {
                        if item.notes.isEmpty {
                            Text("Notes")
                                .padding(.bottom, 70)
                                .foregroundColor(.gray).opacity(0.6) // Il colore del placeholder
                                .padding([.leading, .bottom], 5) // Spaziatura per allineare il testo del placeholder con il TextEditor
                        }
                        TextEditor(text: $item.notes)
                        // Spaziatura per allineare il bordo del TextEditor con il placeholder
                    }
                    .accentColor(.blue)
                    .onTapGesture {
                        if item.notes.isEmpty {
                            // Questo è necessario per far sparire il placeholder quando l'utente tocca il TextEditor
                            item.notes = ""
                        }
                    }
                    .frame(minHeight: 100)
                    .padding(.leading, -4)
                }
                Section{
                    NavigationLink {
                        DetailsView(isSwitchOn: $isSwitchOn, isSwitchDateOn: $isSwitchDateOn ,item: $item, dismissed: $dismissed, isAddButtonDisabled: $isAddButtonDisabled)
                            .onDisappear() {
                                if !isAddButtonDisabled {
                                    if dismissed {
                                        withAnimation {
                                            context.insert(item)
                                        }
                                        dismiss()
                                    }
                                }
                            }
                    } label: {
                        Text("Details")
                    }
                    
                }
                Section{
                    ForEach(listObj.listObject) { list in
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                list.listIcon
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.white, Color.blue)
                                Text("List")
                                Spacer()
                                Text(list.listTag)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .listSectionSpacing(15.0)
            .navigationBarTitle("New Reminder", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showingAlert = true
                    }
                    .foregroundStyle(Color.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        withAnimation {
                            context.insert(item)
                        }
                        dismiss()
                        item.selectDate = nil
                    }
                    .disabled(item.title == "")
                    .interactiveDismissDisabled()
                    .foregroundStyle(item.title == "" ? .gray : .blue)
                    .bold()
                }
            }
            .confirmationDialog(
                        "Discard Changes?",
                        isPresented: $showingAlert
                    ) {
                        Button("Discard Changes", role: .destructive) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        Button("Cancel", role: .cancel) {
                            showingAlert = false
                        }
                    }
        }
        
    }
    
}

