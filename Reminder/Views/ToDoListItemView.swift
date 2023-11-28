//
//  ToDoListItemView.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 20/11/23.
//

import SwiftUI
import SwiftData
import SwiftUIImageViewer

struct ToDoListItemView: View {
    @Bindable var item: ReminderStore
    @State private var shouldBeVisible = true
    @State private var isImageViewerPresented = false

    
    func hideItemAfterDelay() {
            if item.isDone {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.shouldBeVisible = false // Nasconde l'elemento dopo 2 secondi
                    }
                }
            }
        }
    
    var body: some View {
        HStack {
            if item.notes == "" {
                if shouldBeVisible { // Mostra il contenuto solo se shouldBeVisible è true
                    Button {
                        withAnimation {
                            item.isDone.toggle()
                            if item.isDone {
                                hideItemAfterDelay()
                            }
                        }
                    } label: {
                        if item.isDone {
                            Image(systemName: "circle.inset.filled")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.blue)
                                .onDisappear()
                        } else {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.gray)
                        }
                    }
                    .sensoryFeedback(.success, trigger: item.isDone)
                }
                HStack {
                    VStack(alignment: .leading){
                        Text(item.title)
                            .foregroundStyle(item.priorityStatus == "Low" ? .yellow : (item.priorityStatus == "Medium") ? .orange : (item.priorityStatus == "High") ? .red : .primary)
                        if let selectedPhotoData = item.image,
                           let uiImage = UIImage(data: selectedPhotoData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 10,
                                                            style: .continuous))
                                .onTapGesture {
                                    isImageViewerPresented = true
                                }
                                .fullScreenCover(isPresented: $isImageViewerPresented) {
                                    SwiftUIImageViewer(image: Image(uiImage: uiImage))
                                        .overlay(alignment: .topTrailing) {
                                            Button {
                                                isImageViewerPresented = false
                                            } label: {
                                                Image(systemName: "xmark")
                                                    .font(.headline)
                                            }
                                            .buttonStyle(.bordered)
                                            .clipShape(Circle())
                                            .tint(.red)
                                            .padding()
                                            
                                        }
                                }
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        if item.isSwitchFlagOn == true {
                            Image(systemName: "flag.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.orange)
                            if let selectDate = item.selectDate {
                                if (item.isSwitchOn || item.isSwitchDateOn) {
                                    Text("\(selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                        .font(.callout)
                                        .foregroundStyle(selectDate > Date.now ? .gray : .red)
                                }
                            }
                        } else {
                            if let selectDate = item.selectDate {
                                if (item.isSwitchOn || item.isSwitchDateOn) {
                                    Text("\(selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                        .font(.callout)
                                        .foregroundStyle(selectDate > Date.now ? .gray : .red)
                                } else if (!item.isSwitchOn && !item.isSwitchDateOn){
                                    Text("")
                                }
                            }
                        }
                    }
                    
                }
            } else {
                if shouldBeVisible { // Mostra il contenuto solo se shouldBeVisible è true
                    Button {
                        withAnimation {
                            item.isDone.toggle()
                            if item.isDone {
                                hideItemAfterDelay()
                            }
                        }
                    } label: {
                        if item.isDone {
                            Image(systemName: "circle.inset.filled")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.blue)
                            
                                .onDisappear()
                        } else {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.gray)
                        }
                    }
                    .sensoryFeedback(.success, trigger: item.isDone)
                }
                HStack {
                    VStack(alignment: .leading){
                        Text(item.title)
                            .foregroundStyle(item.priorityStatus == "Low" ? .yellow : (item.priorityStatus == "Medium") ? .orange : (item.priorityStatus == "High") ? .red : .primary)
                        Text(item.notes)
                            .font(.callout)
                            .foregroundStyle(.gray).opacity(0.8)
                        if let selectedPhotoData = item.image,
                           let uiImage = UIImage(data: selectedPhotoData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .clipShape(RoundedRectangle(cornerRadius: 4,
                                                            style: .continuous))
                                .onTapGesture {
                                    isImageViewerPresented = true
                                }
                                .fullScreenCover(isPresented: $isImageViewerPresented) {
                                    SwiftUIImageViewer(image: Image(uiImage: uiImage))
                                        .overlay(alignment: .topTrailing) {
                                            Button {
                                                isImageViewerPresented = false
                                            } label: {
                                                Image(systemName: "xmark")
                                                    .font(.headline)
                                            }
                                            .buttonStyle(.bordered)
                                            .clipShape(Circle())
                                            .tint(.red)
                                            .padding()
                                            
                                        }
                                }
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        if item.isSwitchFlagOn == true {
                            Image(systemName: "flag.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.orange)
                            if let selectDate = item.selectDate {
                                if (item.isSwitchOn || item.isSwitchDateOn) {
                                    Text("\(selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                        .font(.caption)
                                        .foregroundStyle(selectDate > Date.now ? .gray : .red)
                                }
                            }
                        } else {
                            if let selectDate = item.selectDate {
                                if (item.isSwitchOn || item.isSwitchDateOn) {
                                    Text("\(selectDate, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                        .font(.caption)
                                        .foregroundStyle(selectDate > Date.now ? .gray : .red)
                                } else if (!item.isSwitchOn && !item.isSwitchDateOn){
                                    Text("")
                                }
                            }
                        }
                    }
                    
                }
            }
            
        }
        .padding(2.5)
        
    }
}

