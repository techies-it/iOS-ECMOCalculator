//
//  CannulaModel.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 04/09/24.
//

import Foundation
import SwiftUI

class CannulaModel: ObservableObject{
    
    @Published var weightInputCannula: String {
        didSet {
            saveData()
        }
    }
    
    @Published var heightInputCannula: String {
        didSet {
            saveData()
        }
    }
    
    @Published var bsaResult: String {
        didSet {
            saveData()
        }
    }
    
    @Published var entryType: String = "Enter Weight" {
        didSet {
            saveData()
        }
    }
    
    @Published var targetType: String = "Target Blood Flow (ml/kg/min)"{
        didSet {
            saveData()
        }
    }
    
    @Published var isBsaResultVisible: Bool {
        didSet {
            saveData()
        }
    }
    @Published var isBloodFlowVisible: Bool {
        didSet {
            saveData()
        }
    }
    @Published var isCIVisible: Bool {
        didSet {
            saveData()
        }
    }

    @Published var isHeightVisible: Bool {
        didSet {
            saveData()
        }
    }
    @Published var isDropDownVisible: Bool {
        didSet {
            saveData()
        }
    }
    @Published var isCannulaListVisible: Bool {
        didSet {
            saveData()
        }
    }
   
    @Published var selectedBloodFlow: Int? {
        didSet {
            saveData()
        }
    }
    @Published var selectedCI: Float? {
        didSet {
            saveData()
        }
    }
    @Published var width: Double? {
        didSet {
            saveData()
        }
    }
    
    init() {

        self.weightInputCannula = UserDefaults.standard.string(forKey: "weightInputCannula") ?? ""
        self.heightInputCannula = UserDefaults.standard.string(forKey: "heightInputCannula") ?? ""
        self.entryType = UserDefaults.standard.string(forKey: "entryType") ?? ""
        self.targetType = UserDefaults.standard.string(forKey: "targetType") ?? ""
        self.selectedBloodFlow = UserDefaults.standard.integer(forKey: "selectedBloodFlow") ?? nil
        self.selectedCI = UserDefaults.standard.float(forKey: "selectedCI")
        self.bsaResult = UserDefaults.standard.string(forKey: "bsaResult") ?? ""
        self.isBsaResultVisible = UserDefaults.standard.bool(forKey: "isBsaResultVisible")
        self.isBloodFlowVisible = UserDefaults.standard.bool(forKey: "isBloodFlowVisible")
        self.isCIVisible = UserDefaults.standard.bool(forKey: "isCIVisible")
        self.isHeightVisible = UserDefaults.standard.bool(forKey: "isHeightVisible")
        self.isDropDownVisible = UserDefaults.standard.bool(forKey: "isDropDownVisible")
        self.isCannulaListVisible = UserDefaults.standard.bool(forKey: "isCannulaListVisible")

    }
    
    private func saveData(){
        UserDefaults.standard.set(weightInputCannula, forKey: "weightInputCannula")
        UserDefaults.standard.set(heightInputCannula, forKey: "heightInputCannula")
        UserDefaults.standard.set(entryType, forKey: "entryType")
        UserDefaults.standard.set(targetType, forKey: "targetType")
        UserDefaults.standard.set(selectedBloodFlow, forKey: "selectedBloodFlow")
        UserDefaults.standard.set(selectedCI, forKey: "selectedCI")
        UserDefaults.standard.set(bsaResult, forKey: "bsaResult")
        UserDefaults.standard.set(isBsaResultVisible, forKey: "isBsaResultVisible")
        UserDefaults.standard.set(isBloodFlowVisible, forKey: "isBloodFlowVisible")
        UserDefaults.standard.set(isCIVisible, forKey: "isCIVisible")
        UserDefaults.standard.set(isHeightVisible, forKey: "isHeightVisible")
        UserDefaults.standard.set(isDropDownVisible, forKey: "isDropDownVisible")
        UserDefaults.standard.set(isCannulaListVisible, forKey: "isCannulaListVisible")
    }
    
    func handleHeightChange() {
        // Logic to handle height change, if required
        if let weight = Float(weightInputCannula), let height = Float(heightInputCannula){
            bsaResult = cannulaWeightBsa(weight: weight, height: height)
            isBsaResultVisible = true
            isCIVisible = true
            selectedBloodFlow = nil

        }else{
            bsaResult = " "
            isBsaResultVisible = false
            isCIVisible = false
            isCannulaListVisible = false
            selectedCI = nil
        }
    }
    
    func handleWeightChange() {
        guard let weightValue = Double(weightInputCannula) else {
            isHeightVisible = false
            isBloodFlowVisible = false
            isCIVisible = false
            isCannulaListVisible = false
            selectedBloodFlow = nil
            return
        }
        
        if weightValue <= 15 {//Pediatric
            isHeightVisible = false
            isDropDownVisible = true
            isBloodFlowVisible = true
            isCIVisible = false
            selectedBloodFlow = nil
            targetType = "Target Blood Flow (ml/kg/min)"
            bsaResult = " "
            entryType = "Pediatric Entry"
        } else {//Adult
            isHeightVisible = true
            isDropDownVisible = true
            isBloodFlowVisible = false
            selectedCI = nil
            targetType = "Target C.I."
            entryType = "Adult Entry"
        }
        if heightInputCannula.isEmpty {
            isCannulaListVisible = false
        }
    }
}
