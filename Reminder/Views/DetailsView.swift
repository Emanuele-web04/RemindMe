//
//  DetailsView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 18/11/23.
//

import SwiftUI

struct DetailsView: View {
    var detailDateTime = DetailsDateTime()
    var detailFlag = DetailsFlag()
    @State private var isSwitchDateOn = false
    @State private var isSwitchOn = false
    @State private var isSwitchFlagOn = false
    @State private var selectedDate = Date()
    @Binding var showingAlert: Bool
    @Binding var isAddButtonDisabled: Bool
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image(systemName: "calendar.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, .red)
                        Toggle("Date", isOn: $isSwitchDateOn)
                    }
                    Section {
                        if isSwitchDateOn {
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                            // Regola l'altezza secondo necessità
                        }
                    }
                    Section{
                        HStack {
                            Image(systemName: "clock.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.white, .blue)
                            Toggle("Time", isOn: $isSwitchOn)
                        }
                    }
                    Section {
                        if isSwitchOn {
                            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                                .datePickerStyle(WheelDatePickerStyle())
                            // Regola l'altezza secondo necessità
                        }
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "bell.square.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, .purple)
                        Text("Early Reminder")
                        Spacer()
                        Menu {
                            Button(action: {}){
                                HStack{
                                    Text("None")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("1 day before")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("2 day before")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("1 week before")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("1 month before")
                                    
                                }
                            }
                        } label: {
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundStyle(.gray).opacity(0.6)
                        }
                    }
                    Section{
                        HStack {
                            Image(systemName: "arrow.right.arrow.left.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.white, .gray.opacity(0.8))
                            Text("Repeat")
                            Spacer()
                            Menu {
                                Button(action: {}){
                                    HStack{
                                        Text("Never")
                                        
                                    }
                                }
                                Button(action: {}){
                                    HStack{
                                        Text("Daily")
                                        
                                    }
                                }
                                Button(action: {}){
                                    HStack{
                                        Text("Weekly")
                                        
                                    }
                                }
                                Button(action: {}){
                                    HStack{
                                        Text("Monthly")
                                        
                                    }
                                }
                                Button(action: {}){
                                    HStack{
                                        Text("Yearly")
                                        
                                    }
                                }
                            } label: {
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundStyle(.gray).opacity(0.6)
                            }
                        }
                    }
                }
                
                Section{
                    HStack {
                        Image(systemName: "flag.square.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, .orange)
                        Toggle("Flag", isOn: $isSwitchFlagOn)
                    }
                }
                Section {
                    HStack{
                        Image(systemName: "exclamationmark.square.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, Color.red)
                        Text("Priority")
                        Spacer()
                        Menu {
                            Button(action: {}){
                                HStack{
                                    Text("None")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("Low")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("Medium")
                                    
                                }
                            }
                            Button(action: {}){
                                HStack{
                                    Text("High")
                                    
                                }
                            }
                        } label: {
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundStyle(.gray).opacity(0.6)
                        }
                    }
                    
                }
                
                Section {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Add Image")
                    })
                }
            }
            .listSectionSpacing(15.0)
            .navigationBarTitle("Details", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        // Action for adding a new reminder
                    }
                    .foregroundStyle(isAddButtonDisabled == true ? .gray : .blue)
                    .bold()
                    .disabled(isAddButtonDisabled)
                }
            }
        }
        .accentColor(.blue)
    }
}

#Preview {
    DetailsView(showingAlert: .constant(false), isAddButtonDisabled: .constant(false))
        .accentColor(.blue)
}
