//
//  CalculatorModel.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 02/09/24.
//

import Foundation
import SwiftUI

class CalculatorModel: ObservableObject {
    @Published var centimetersInput: String = ""
    @Published var weightInput: String = ""
    @Published var heightInput: String = ""
    @Published var fio2Input: String = ""
    @Published var mapInput: String = ""
    @Published var pao2Input: String = ""
    @Published var hemoglobinInput: String = ""
    @Published var arterialOxygenSaturationInput: String = ""
    @Published var partialPressureOfOxygenInput: String = ""
    @Published var heartRateInput: String = ""
    @Published var strokeVolumeInput: String = ""
    @Published var bsaInput: String = ""
    @Published var blank: String = ""
    
    @Published var centimetersToInchesResult: String = ""
    @Published var bodySurfaceAreaResult: String = ""
    @Published var weightBasedBodySurfaceAreaResult: String = ""
    @Published var oxygenIndexResult: String = ""
    @Published var paO2ByFiO2RatioResult: String = ""
    @Published var showHeparinList: Bool = false
    @Published var heparinLoadingDoseResult: [String] = [""]
    @Published var cardiacIndexCalculatorResult: String = ""
    @Published var estimatedRedCellMassResult: String = ""
    @Published var dilutionalHCTResult: String = ""
    @Published var cardiacOutputResult: String = ""
    @Published var cardiacIndexResult: String = ""
    @Published var systemicVascularResistanceResult: String = ""
    @Published var pulmonaryVascularResistanceResult: String = ""
    @Published var oxygenContentArterialResult: String = ""
    @Published var oxygenDeliveryResult: String = ""
    @Published var oxygenContentVenousResult: String = ""
    @Published var oxygenConsumptionResult: String = ""
    @Published var sweepGasResult: String = ""
    
    func calculateCentimetersToInches() {
        if let cm = Float(centimetersInput) {
            centimetersToInchesResult = calCentimetersToInches(centimeters: cm)
        } else {
            centimetersToInchesResult = "Invalid input"
        }
    }
    
    func calculateHeparinLoadingDose() {
        if let weight = Double(weightInput) {
            heparinLoadingDoseResult = calHeparinLoadingDose(weight: weight)
            withAnimation(.linear(duration: 0.4)) {
                showHeparinList = true
            }
        } else {
            withAnimation(.linear(duration: 0.3)){
                heparinLoadingDoseResult = ["Invalid input"]
                showHeparinList = false
            }
        }
    }
    
    func calculateOxygenIndex() {
        if let fio2 = Double(fio2Input), let map = Double(mapInput), let pao2 = Double(pao2Input) {
            oxygenIndexResult = calOxygenIndex(fio2: fio2, map: map, pao2: pao2)
        } else {
            oxygenIndexResult = "Invalid input"
        }
    }
    
    // Add other calculation functions as needed.
}
