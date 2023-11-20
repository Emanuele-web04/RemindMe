//
//  BlockSchedule.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 17/11/23.
//

import SwiftUI

struct BlockSchedule: View {
    var block: CalendarTypeNumber
    var body: some View {
            ZStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        block.iconCalendar
                            .resizable()
                            .frame(width: 30, height: 30)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, block.color)
                            .padding(.bottom, 5)
                        Text(block.type)
                            .foregroundStyle(Color.secondary)
                            .fontWeight(.bold)
 
                    }
                    Spacer()
                    VStack{
                        Text("\(block.number)")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                    }
                }
                .padding(10)
                
            }
            .background(Color("AccentColorWB"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

#Preview {
    BlockSchedule(block: CalendarTypeNumber(iconCalendar: Image(systemName: "calendar"), type: "hello", number: 0, color: .blue))
}

