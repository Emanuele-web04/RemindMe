//
//  Details.swift
//  Reminder
//
//  Created by Emanuele Di Pietro on 18/11/23.
//

import SwiftUI

class DetailsDateTime {
    var detailDateTime = [
        DetailDateTime(iconDateTime: Image(systemName: "calendar"), typeDateTime: "Date", colorDT: .red, isSwitchDateOn: false, isSwitchTimeOn: true),
        DetailDateTime(iconDateTime: Image(systemName: "clock"), typeDateTime: "Time", colorDT: .blue, isSwitchDateOn: false, isSwitchTimeOn: true),
    ]
}

class DetailsFlag {
    var detailFlag = [
        DetailFlag(iconFlag: Image(systemName: "flag.square.fill"), typeFlag: "Flag", colorFlag: .orange, isSwithFlagOn: false),
    ]
}


