//
//  DetailsView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 18/11/23.
//

import SwiftUI
import SwiftData
struct DetailsView: View {
    @State var dateTime: Date = .now
    @Binding var isSwitchOn: Bool
    @Binding var isSwitchDateOn: Bool
    @State private var isSwitchTagOn = false
    @State private var isSwitchMessageOn = false
    @State private var isSwitchLocationOn = false
    @State private var isSwitchFlagOn = false
    //@State private var selectedDate = Date()
    @Binding var item: ReminderStore
    @Binding var dismissed : Bool
    @Environment (\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var isAddButtonDisabled : Bool
    @State private var selectedOption = 0
    @State private var pickerOptions = ["None", "Low", "Medium", "High"]
   
    func addItem() {
        withAnimation {
            context.insert(item)
        }
    }
    
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
                            .onChange(of: isSwitchDateOn) { value in
                                            if !value {
                                                item.selectDate = nil
                                            }
                                        }
                    }
                    Section {
                        if isSwitchDateOn {
                            withAnimation {
                                DatePicker("", selection: Binding($item.selectDate) ?? .constant(Date()), displayedComponents: .date)
                                            .datePickerStyle(GraphicalDatePickerStyle())
                                            .transition(.opacity)
                            }
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
                                .onChange(of: isSwitchOn) { value in
                                        if !value {
                                            item.selectDate = nil
                                        }
                                    }
                        }
                    }
                    Section {
                        if isSwitchOn {
                            DatePicker("", selection: Binding($item.selectDate) ?? .constant(Date()), displayedComponents: .hourAndMinute)
                                .datePickerStyle(WheelDatePickerStyle())
                                .transition(.opacity)
                        }
                    }
                }
                
                
                Section {
                    if isSwitchOn {
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
                    } else if isSwitchDateOn {
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
                    /*if selectionDate.title != "" {
                     Button("Add") {
                     dismiss()
                     }*/
                    Button("Add") {
                        if !isAddButtonDisabled {
                            dismissed = true
                            withAnimation {
                                context.insert(item)
                            }
                        }
                        dismiss()
                    }
                        .disabled(item.title == "")
                        .interactiveDismissDisabled()
                        .foregroundStyle(item.title == "" ? .gray : .blue)
                        .bold()
                    
                }
            }
        }
        
        
        .accentColor(.blue)
    }
}


