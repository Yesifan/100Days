//
//  UnitConver.swift
//  100Days (iOS)
//
//  Created by 叶思凡 on 2022/3/27.
//

import SwiftUI

struct UnitConver: View {
    let units = [UnitLength.meters,UnitLength.megameters, UnitLength.feet, UnitLength.fathoms]
    
    @State private var val: Double?
    @State private var preUnit = UnitLength.meters
    @State private var afterUnit = UnitLength.megameters
    
    var afterVal:Double? {
        guard let val = val else {
            return nil
        }
        return Measurement(value: val, unit: preUnit).converted(to: afterUnit).value
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    TextField("Enter the value", value: $val, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("unit", selection: $preUnit) {
                        ForEach(units, id: \.symbol) {
                            Text($0.symbol).tag($0)
                        }
                    }
                    .frame(width: 20)
                    .pickerStyle(.menu)
                }
                HStack {
                    if let afterVal = afterVal {
                        Text(afterVal, format: .number)
                    }else{
                        Text("Please enter a value first")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Picker("unit", selection: $afterUnit) {
                        ForEach(units, id: \.symbol) {
                            Text($0.symbol).tag($0)
                        }
                    }
                    .frame(width: 20)
                    .pickerStyle(.menu)
                }
            } header: {
                Text("Conversion length unit")
            }
        }
    }
}

struct UnitConver_Previews: PreviewProvider {
    static var previews: some View {
        UnitConver()
    }
}
