//
//  UnitConver.swift
//  100Days (iOS)
//
//  Created by 叶思凡 on 2022/3/27.
//

import SwiftUI

struct UnitConver: View {
    let units = [UnitLength.meters,UnitLength.megameters, UnitLength.feet, UnitLength.fathoms]

    @State private var val: Double = 1
    @State private var preUnit = UnitLength.meters
    @State private var afterUnit = UnitLength.megameters
    
    var afterVal:Double {
        Measurement(value: val, unit: preUnit).converted(to: afterUnit).value
    }

    var body: some View {
        Form {
            Section {
                HStack {
                    TextField("Enter your name", value: $val, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("unit", selection: $preUnit) {
                        ForEach(units, id: \.symbol) {
                            Text($0.symbol).tag($0)
                        }
                    }
                    .frame(width: 100)
                }
                HStack {
                    Text(afterVal, format: .number)
                    Spacer()
                    Picker("unit", selection: $afterUnit) {
                        ForEach(units, id: \.symbol) {
                            Text($0.symbol).tag($0)
                        }
                    }
                    .frame(width: 100)
                }
            } header: {
                Text("length unit")
            }
        }
    }
}

struct UnitConver_Previews: PreviewProvider {
    static var previews: some View {
        UnitConver()
    }
}
