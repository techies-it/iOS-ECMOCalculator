//
//  CannulaModel.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 04/09/24.
//

import Foundation
import SwiftUI


class CannulaModel: ObservableObject{
    
    @Published var bloodFlowOptions = [100, 150, 175, 200, 250]
    @Published var CIFlowOptions : [Float] = [0.5, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6,2.8,3.0]

    
    @Published var resultTargetBloodFlowArray: [String] {
        didSet {
            saveData()
        }
    }
    
    @Published var resultTargetBloodFlow: String {
        didSet {
            saveData()
        }
    }

    @Published var resultHighlightBloodFlow: Int {
        didSet {
            saveData()
        }
    }
    
    @Published var adultResultTargetBloodFlowArray: [String] {
        didSet {
            saveData()
        }
    }
    
    @Published var adultResultTargetBloodFlow: String {
        didSet {
            saveData()
        }
    }

    @Published var adultResultHighlightBloodFlow: Int {
        didSet {
            saveData()
        }
    }
    
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
    
    @Published var pediatricBloodFlow: Float {
        didSet {
            saveData()
        }
    }
    
    
    @Published var bsaResult: String {
        didSet {
            saveData()
        }
    }
    
    @Published var pediatricVANeckDictionary: [String: String] = [:] {
        didSet {
            saveData()
        }
    }
    
    @Published var pediatricVAGroinDictionary: [String: String] = [:] {
        didSet {
            saveData()
        }
    }
    
    @Published var pediatricVVDLDictionary: [String: String] = [:] {
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
        self.selectedBloodFlow = UserDefaults.standard.integer(forKey: "selectedBloodFlow") 
        self.selectedCI = UserDefaults.standard.float(forKey: "selectedCI")
        self.isBsaResultVisible = UserDefaults.standard.bool(forKey: "isBsaResultVisible")
        self.isBloodFlowVisible = UserDefaults.standard.bool(forKey: "isBloodFlowVisible")
        self.isCIVisible = UserDefaults.standard.bool(forKey: "isCIVisible")
        self.isHeightVisible = UserDefaults.standard.bool(forKey: "isHeightVisible")
        self.isDropDownVisible = UserDefaults.standard.bool(forKey: "isDropDownVisible")
        self.isCannulaListVisible = UserDefaults.standard.bool(forKey: "isCannulaListVisible")
        
        
        //Results
        self.bsaResult = UserDefaults.standard.string(forKey: "bsaResult") ?? ""
        
        self.pediatricBloodFlow = UserDefaults.standard.float(forKey: "pediatricBloodFlow") ?? 0.0

        self.resultTargetBloodFlow = UserDefaults.standard.string(forKey: "resultTargetBloodFlow") ?? ""
        self.resultTargetBloodFlowArray = UserDefaults.standard.stringArray(forKey: "resultTargetBloodFlowArray") ?? [""]
        self.resultHighlightBloodFlow = UserDefaults.standard.integer(forKey: "resultHighlightBloodFlow")
        
        self.adultResultTargetBloodFlow = UserDefaults.standard.string(forKey: "adultResultTargetBloodFlow") ?? ""
        self.adultResultTargetBloodFlowArray = UserDefaults.standard.stringArray(forKey: "adultResultTargetBloodFlowArray") ?? [""]
        self.adultResultHighlightBloodFlow = UserDefaults.standard.integer(forKey: "adultResultHighlightBloodFlow")
        
//        self.pediatricVANeckDictionary = UserDefaults.standard.dictionary(forKey: "pediatricVANeckDictionary") ?? [String: Any]
        

    }
    
    private func saveData(){
        UserDefaults.standard.set(weightInputCannula, forKey: "weightInputCannula")
        UserDefaults.standard.set(resultTargetBloodFlow, forKey: "resultTargetBloodFlow")
        UserDefaults.standard.set(resultTargetBloodFlowArray,forKey: "resultTargetBloodFlowArray")
        UserDefaults.standard.set(resultHighlightBloodFlow,forKey: "resultHighlightBloodFlow")

        UserDefaults.standard.set(adultResultTargetBloodFlow, forKey: "resultTargetBloodFlow")
        UserDefaults.standard.set(adultResultTargetBloodFlowArray,forKey: "resultTargetBloodFlowArray")
        UserDefaults.standard.set(adultResultHighlightBloodFlow,forKey: "resultHighlightBloodFlow")
        
        UserDefaults.standard.set(pediatricBloodFlow,forKey: "pediatricBloodFlow")

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
        
//        UserDefaults.standard.set(pediatricVANeckDictionary, forKey: "pediatricVANeckDictionary")
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
        } else { //Adult
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

    
    func calculateTargetBloodFlow(){
        //calculate all values for array
        //keep it in array
        resultTargetBloodFlowArray.removeAll()
        if !weightInputCannula.isEmpty{
            if Float(weightInputCannula)! <= 15.0{   //Pediatric Entry
                for i in 0..<bloodFlowOptions.count{
                    
                    if let weight = Float(weightInputCannula){
                        resultTargetBloodFlow = calTargetBloodFlow(weight: weight, option: Float(bloodFlowOptions[i])).0
                    }
                    else{
                        resultTargetBloodFlow = "--L/min"
                    }
                    resultTargetBloodFlowArray.append(resultTargetBloodFlow)
                }
            }
        }
        
    }
    
    func highlightBloodFlow(selectedValue: Int){
        for i in 0..<bloodFlowOptions.count{
            if bloodFlowOptions[i] == selectedValue{
                resultHighlightBloodFlow = i
                pediatricBloodFlow = calTargetBloodFlow(weight: Float(weightInputCannula)!, option: Float(bloodFlowOptions[i])).1

                pediatricFrs()
            }
        }
        
    }
      
    func calculateWeightBasedBodySurfaceArea(){
        if let weight = Float(weightInputCannula), let height = Float(heightInputCannula){
            bsaResult = cannulaWeightBsa(weight: weight, height: height)
            print("here getting \(bsaResult)")
            /*calculateTargetBloodFlow*/()
        }
        else{
            bsaResult = "--m\u{00B2}"
        }
        
    
    }
    
    func pediatricFrs(){
        //Call all pediatric list functions here
        print("value of pediatric Blood flow is \(pediatricBloodFlow) && \(resultTargetBloodFlow)")
        pediatricVANeck()
        pediatricVAGroin()
        pediatricVVDL()
    }
    
    func pediatricVANeck(){
       
        pediatricVANeckDictionary[vaNeckArterialCannulae(pediatricBloodFlow: pediatricBloodFlow).0] = vaNeckArterialCannulae(pediatricBloodFlow: pediatricBloodFlow).1
        pediatricVANeckDictionary[vaNeckVenousCannulae(pediatricBloodFlow: pediatricBloodFlow).0] = vaNeckVenousCannulae(pediatricBloodFlow: pediatricBloodFlow).1
        
    }
    
    func pediatricVAGroin(){
        pediatricVAGroinDictionary[vaGroinArterialCannulae(pediatricBloodFlow: pediatricBloodFlow).0] = vaGroinArterialCannulae(pediatricBloodFlow: pediatricBloodFlow).1
        pediatricVAGroinDictionary[vaGroinVenousCannulae(pediatricBloodFlow: pediatricBloodFlow).0] = vaGroinVenousCannulae(pediatricBloodFlow: pediatricBloodFlow).1
    }
    
    func pediatricVVDL(){
        pediatricVVDLDictionary[vvdlDualLumenCatheter(pediatricBloodFlow: pediatricBloodFlow).0] = vvdlDualLumenCatheter(pediatricBloodFlow: pediatricBloodFlow).1
        pediatricVVDLDictionary[vvdlCrescentdualECLSCannula(pediatricBloodFlow: pediatricBloodFlow).0] = vvdlCrescentdualECLSCannula(pediatricBloodFlow: pediatricBloodFlow).1
    }
    
    func adultFrs(){
        
    }
}


