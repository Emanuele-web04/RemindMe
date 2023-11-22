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
    @State private var isSwitchTagOn = false
    @State private var isSwitchMessageOn = false
    @State private var isSwitchLocationOn = false
    @State private var isSwitchOn = false
    @State private var isSwitchFlagOn = false
    @State private var selectedDate = Date()
    //@State private var item = ReminderStore()
    @Binding var showingAlert: Bool
    @Binding var isAddButtonDisabled: Bool
    @State private var selectedOption = 0
    @State private var pickerOptions = ["None", "Low", "Medium", "High"]
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        ZStack {
                            Rectangle ()
                                .frame(width: 25, height:25)
                                .cornerRadius(5)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.red)
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.white, .red)
                        }
                        Toggle("Date", isOn: $isSwitchDateOn)
                    }
                    Section {
                        if isSwitchDateOn {
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                            // Regola l'altezza secondo necessità
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: isSwitchDateOn)
                    Section{
                        HStack {
                            ZStack {
                                Rectangle ()
                                    .frame(width: 25, height:25)
                                    .cornerRadius(5)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(.blue)
                                Image(systemName: "clock.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.white, .blue)
                            }
                            Toggle("Time", isOn: $isSwitchOn)
                        }
                    }
                    Section {
                        if isSwitchOn {
                            DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                                    .datePickerStyle(WheelDatePickerStyle())
                                                .transition(.opacity)
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
                            ZStack {
                                Rectangle ()
                                    .frame(width: 25, height:25)
                                    .cornerRadius(5)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(.gray).opacity(0.5)
                                Image(systemName: "repeat")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.white)
                            }
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
                
                Section {
                    HStack {
                            Image(systemName: "number.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.white, .gray.opacity(0.8))
                        NavigationLink {
                            
                        } label: {
                            Text("Tags")
                        }
                    }
                }
                
                Section {
                    HStack {
                            Image(systemName: "location.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.white, .blue)
                        Toggle("Location", isOn: $isSwitchLocationOn)
                    }
                }
                
                Section {
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 25, height:25)
                                .cornerRadius(5)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.green)
                            Image(systemName: "message.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(Color.white)
                        }
                        Toggle("When Messaging", isOn: $isSwitchMessageOn)
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
                        Picker("Priority", selection: $selectedOption) {
                            ForEach(0..<pickerOptions.count) { index in
                                Text(pickerOptions[index])
                            }
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
