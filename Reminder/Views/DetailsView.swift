//
//  DetailsView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 18/11/23.
//

import SwiftUI
import SwiftData
import PhotosUI

struct DetailsView: View {
    @State var dateTime: Date = .now
    @State private var isSwitchTagOn = false
    @State private var isSwitchMessageOn = false
    @State private var isSwitchLocationOn = false
    //@State private var selectedDate = Date()
    @State var selectedPhoto: PhotosPickerItem?

    @Binding var item: ReminderStore
    @Binding var dismissed : Bool
    @State private var notification = NotificationHandler()
    @Environment (\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var isAddButtonDisabled : Bool
    
    
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
                        Toggle("Date", isOn: $item.isSwitchDateOn)
                    }
                    Section {
                        if item.isSwitchDateOn {
                            withAnimation {
                                DatePicker("", selection: Binding($item.selectDate) ?? .constant(Date()), displayedComponents: .date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
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
                                    .foregroundStyle(.blue)
                                Image(systemName: "clock.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.white, .blue)
                            }
                            Toggle("Time", isOn: $item.isSwitchOn)
                            
                        }
                    }
                    Section {
                        if item.isSwitchOn {
                            DatePicker("", selection: Binding($item.selectDate) ?? .constant(Date()), displayedComponents: .hourAndMinute)
                                .datePickerStyle(WheelDatePickerStyle())
                                .transition(.opacity)
                        }
                    }
                }
                
                
                Section {
                    if item.isSwitchOn {
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
                    } else if item.isSwitchDateOn {
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
                        Toggle("Flag", isOn: $item.isSwitchFlagOn)
                    }
                }
                Section {
                    HStack{
                        Image(systemName: "exclamationmark.square.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, Color.red)
                        Picker("Priority", selection: $item.priorityStatus) {
                            Text("None").tag("None")
                            Text("Low").tag("Low")
                            Text("Medium").tag("Medium")
                            Text("High").tag("High")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.gray)
                    }
                }
                
                
                
                Section {
                    
                    if let selectedPhotoData = item.image,
                       let uiImage = UIImage(data: selectedPhotoData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .padding(2.0)
                    }
                    
                    PhotosPicker(selection: $selectedPhoto,
                                 matching: .images,
                                 photoLibrary: .shared()) {
                        Label("Add Image", systemImage: "photo")
                    }
                    
                    if item.image != nil {
                        
                        Button(role: .destructive) {
                            withAnimation {
                                selectedPhoto = nil
                                item.image = nil
                            }
                        } label: {
                            Label("Remove Image", systemImage: "xmark")
                                .foregroundStyle(.red)
                        }
                    }
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
                        let formattedDate = item.selectDate?.formatted(.dateTime.day().month().hour().minute()) ?? Date.now.formatted(.dateTime.day().month().hour().minute())
                        notification.sendNotification(
                            date: item.selectDate ?? Date.now,
                            type: "date",
                            title: item.title,
                            body: "You created a reminder for \(formattedDate)"
                        )
                        if !isAddButtonDisabled {
                            dismissed = true
                            withAnimation {
                                context.insert(item)
                            }
                            dismiss()
                        }
                        
                    }
                }
            }
        }
        .task(id: selectedPhoto) {
                    if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                        item.image = data
                    }
                }
        
        .accentColor(.blue)
    }
}


