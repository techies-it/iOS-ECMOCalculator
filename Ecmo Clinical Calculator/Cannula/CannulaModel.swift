//
//  CannulaModel.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 04/09/24.
//

import Foundation
import SwiftUI


class CannulaModel: ObservableObject{
    
    @Published var bloodFlowOptions : [Int] = [100, 150, 175, 200, 250]
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
    
    @Published var bsaValue: Float {
        didSet {
            saveData()
        }
    }
    
    @Published var pediatricVANeckArray : [String] = []{
        didSet{
            saveData()
        }
    }//["Bio-Medicus NextGen Pediatric Arterial","Bio-Medicus NextGen Pediatric Venous"]
    @Published var pediatricVAGroinArray : [String] = []
    {
        didSet{
            saveData()
        }
    }
    @Published var pediatricVVDLArray : [String] = []{
        didSet{
            saveData()
        }
    }
    
    @Published var adultVANeckArray : [String] = []{
        didSet{
            saveData()
        }
    }
    @Published var adultVAGroinArray : [String] = []{
        didSet{
            saveData()
        }
    }
    @Published var adultVVDLArray : [String] = []{
        didSet{
            saveData()
        }
    }
    
    @Published var pediatricVANeckDictionary: [String: String] = [:]{
        didSet{
            saveData()
        }
    }
    
    
    @Published var pediatricVAGroinDictionary: [String: String] = [:]{
        didSet{
            saveData()
        }
    }

    
    @Published var pediatricVVDLDictionary: [String: String] = [:]{
        didSet{
            saveData()
        }
    }
    
    @Published var adultVANeckDictionary: [String: String] = [:]{
        didSet{
            saveData()
        }
    }
    
    @Published var adultVAGroinDictionary: [String: String] = [:]{
        didSet{
            saveData()
        }
    }
    
    
    @Published var adultVVDLDictionary: [String: String] = [:]{
        didSet{
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
   
    @Published var selectedBloodFlow: Int = 0 {
        didSet {
            saveData()
        }
    }
    @Published var selectedCI: Float = 0.0 {
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
        self.bsaValue = UserDefaults.standard.float(forKey: "bsaValue") ?? 0.0

        
        self.pediatricBloodFlow = UserDefaults.standard.float(forKey: "pediatricBloodFlow") ?? 0.0

        self.resultTargetBloodFlow = UserDefaults.standard.string(forKey: "resultTargetBloodFlow") ?? ""
        self.resultTargetBloodFlowArray = UserDefaults.standard.stringArray(forKey: "resultTargetBloodFlowArray") ?? [""]
        self.resultHighlightBloodFlow = UserDefaults.standard.integer(forKey: "resultHighlightBloodFlow")
        
        self.adultResultTargetBloodFlow = UserDefaults.standard.string(forKey: "adultResultTargetBloodFlow") ?? ""
        self.adultResultTargetBloodFlowArray = UserDefaults.standard.stringArray(forKey: "adultResultTargetBloodFlowArray") ?? [""]
        self.adultResultHighlightBloodFlow = UserDefaults.standard.integer(forKey: "adultResultHighlightBloodFlow")
        
        

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
        UserDefaults.standard.set(bsaValue, forKey: "bsaValue")
        
        UserDefaults.standard.set(isBsaResultVisible, forKey: "isBsaResultVisible")
        UserDefaults.standard.set(isBloodFlowVisible, forKey: "isBloodFlowVisible")
        UserDefaults.standard.set(isCIVisible, forKey: "isCIVisible")
        UserDefaults.standard.set(isHeightVisible, forKey: "isHeightVisible")
        UserDefaults.standard.set(isDropDownVisible, forKey: "isDropDownVisible")
        UserDefaults.standard.set(isCannulaListVisible, forKey: "isCannulaListVisible")
        
        UserDefaults.standard.set(pediatricVANeckDictionary, forKey: "pediatricVANeckDictionary")
        UserDefaults.standard.set(pediatricVAGroinDictionary, forKey: "pediatricVAGroinDictionary")
        UserDefaults.standard.set(pediatricVVDLDictionary, forKey: "pediatricVVDLDictionary")
        UserDefaults.standard.set(adultVANeckDictionary, forKey: "adultVANeckDictionary")
        UserDefaults.standard.set(adultVAGroinDictionary, forKey: "adultVAGroinDictionary")
        UserDefaults.standard.set(adultVVDLDictionary, forKey: "adultVVDLDictionary")

        UserDefaults.standard.set(pediatricVVDLArray, forKey: "pediatricVVDLArray")
        UserDefaults.standard.set(pediatricVANeckArray, forKey: "pediatricVANeckArray")
        UserDefaults.standard.set(pediatricVAGroinArray, forKey: "pediatricVAGroinArray")
        UserDefaults.standard.set(adultVANeckArray, forKey: "adultVANeckArray")
        UserDefaults.standard.set(adultVVDLArray, forKey: "adultVVDLArray")
        UserDefaults.standard.set(adultVAGroinArray, forKey: "adultVAGroinArray")

        
    }
    
    func handleHeightChange() {
        // Logic to handle height change, if required
        withAnimation(.linear(duration: 0.4)) {
            if let weight = Float(weightInputCannula), let height = Float(heightInputCannula){
                bsaResult = cannulaWeightBsa(weight: weight, height: height).1
                
                isBsaResultVisible = true
                isCIVisible = true
                selectedBloodFlow = 0
//                selectedCI = 0.0
                if isCannulaListVisible {
                    adultFrs()
                }
            }else{
                bsaResult = " "
                isBsaResultVisible = false
                isCIVisible = false
                isCannulaListVisible = false
                selectedCI = 0.0
            }
        }
    }
    
    func handleWeightChange() {
        guard let weightValue = Double(weightInputCannula) else {
            withAnimation(.linear(duration: 0.4)) {
//                if !self.heightInputCannula.isEmpty{
                    isHeightVisible = false
                    isBloodFlowVisible = false
                    isCIVisible = false
                    isCannulaListVisible = false
//                    selectedBloodFlow = 0
                    isDropDownVisible = false
                    self.heightInputCannula = ""
//                }
            }
            return
        }
        
        if weightValue <= 15 {//Pediatric
            withAnimation(.linear(duration: 0.4)) {
                isHeightVisible = false
                isDropDownVisible = true
                isBloodFlowVisible = true
                isCIVisible = false
                selectedBloodFlow = 0
                targetType = "Target Blood Flow (ml/kg/min)"
                isBsaResultVisible = false
                entryType = "Pediatric Entry"
                if selectedBloodFlow <= 0 {
                    isCannulaListVisible = false
                }else{
                    isCannulaListVisible = true
                }
            }
        } else { //Adult
            withAnimation(.linear(duration: 0.4)) {
                isHeightVisible = true
                isDropDownVisible = true
                isBloodFlowVisible = false
                selectedCI = 0
                targetType = "Target C.I."
                entryType = "Adult Entry"
                handleHeightChange()
                if heightInputCannula.isEmpty {
                        isCannulaListVisible = false
//                        isCIVisible = false
//                    isBsaResultVisible = false

                }else{
                    if selectedCI <= 0.0 {
                        isCannulaListVisible = false
                    }else{
                        isCannulaListVisible = true
                    }
//                    isBsaResultVisible = true
//                    isCIVisible = true


                }
            }
        }
        
    }

    
    func calculateTargetBloodFlow(){
        //calculate all values for array
        //keep it in array
        resultTargetBloodFlowArray.removeAll()
        if !weightInputCannula.isEmpty{
            if Float(weightInputCannula) ?? 0.0 <= 15.0{   //Pediatric Entry
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
                print("coming in this function")
                pediatricFrs()
            }
        }
        
    }
      
    func calculateWeightBasedBodySurfaceArea(){
        if let weight = Float(weightInputCannula), let height = Float(heightInputCannula){
            bsaResult = cannulaWeightBsa(weight: weight, height: height).1
            
            print("here getting \(bsaResult)")
            /*calculateTargetBloodFlow*/()
        }
        else{
            bsaResult = "--m\u{00B2}"
        }
        
    
    }
    
    func pediatricFrs(){
        //Call all pediatric list functions here
        
        pediatricVAGroinArray.removeAll()
        pediatricVAGroinDictionary.removeAll()
        
        pediatricVANeckArray.removeAll()
        pediatricVANeckDictionary.removeAll()
        
        pediatricVVDLArray.removeAll()
        pediatricVVDLDictionary.removeAll()
        
        print("value of pediatric Blood flow is \(pediatricBloodFlow) && \(resultTargetBloodFlow)")
        pediatricVANeck()
        pediatricVAGroin()
        pediatricVVDL()
    }
    
    func pediatricVANeck(){
        
        let (title,value) = vaNeckArterialCannulae(pediatricBloodFlow: pediatricBloodFlow)

        pediatricVANeckDictionary[title] = value
        pediatricVANeckArray.append(title)
        
        let (title1,value1) = vaNeckVenousCannulae(pediatricBloodFlow: pediatricBloodFlow)

        pediatricVANeckDictionary[title1] = value1
        pediatricVANeckArray.append(title1)
    }
    
    func pediatricVAGroin(){
        
        let (title,value) = vaGroinArterialCannulae(pediatricBloodFlow: pediatricBloodFlow)

        pediatricVAGroinDictionary[title] = value
        pediatricVAGroinArray.append(title)
        let (title1,value1) = vaGroinVenousCannulae(pediatricBloodFlow: pediatricBloodFlow)

        pediatricVAGroinDictionary[title1] = value1
        pediatricVAGroinArray.append(title1)

    }
    
    func pediatricVVDL(){
        
        let (title,value) = vvdlDualLumenCatheter(pediatricBloodFlow: pediatricBloodFlow)

        pediatricVVDLDictionary[title] = value
        pediatricVVDLArray.append(title)
        let (title1,value1) = vvdlCrescentdualECLSCannula(pediatricBloodFlow: pediatricBloodFlow)

        pediatricVVDLDictionary[title1] = value1
        pediatricVVDLArray.append(title1)

    }
    
    func adultFrs(){
        if !heightInputCannula.isEmpty {
            bsaValue = targetBloodFlowValue(weight: Float(weightInputCannula)!, height: Float(heightInputCannula)!, cIValues: selectedCI).0
            print("Value of bsa Value is \(bsaValue)")
            adultVANeckArray.removeAll()
            adultVANeckDictionary.removeAll()
            
            adultVAGroinArray.removeAll()
            adultVAGroinDictionary.removeAll()
            
            adultVVDLArray.removeAll()
            adultVVDLDictionary.removeAll()
            
            adultVANeck()
            adultVAGroin()
            adultVVDL()
        }
    }
    
    func adultVANeck(){
      
        let (title,value) = vaNeckFemoralArterialCannula(bsa: bsaValue)
        adultVANeckDictionary[title] = value
        adultVANeckArray.append(title)
        let (title2, value2) = vaNeckFemoralVenousCannula(bsa: bsaValue)
        adultVANeckDictionary[title2] = value2
        adultVANeckArray.append(title2)

        let (title3, value3) = arterialHLSCannula15(bsa: bsaValue)
        adultVANeckDictionary[title3] = value3
        adultVANeckArray.append(title3)

        let (title4, value4) = arterialHLSCannula23(bsa: bsaValue)
        adultVANeckDictionary[title4] = value4
        adultVANeckArray.append(title4)

        let (title5, value5) = venousHLSCannula15(bsa: bsaValue)
        adultVANeckDictionary[title5] = value5
        adultVANeckArray.append(title5)

        let (title6, value6) = venousHLSCannula23(bsa: bsaValue)
        adultVANeckDictionary[title6] = value6
        adultVANeckArray.append(title6)
        print(adultVANeckArray)
    }
    
    func adultVAGroin(){
        
        let (title,value) = vaNeckFemoralArterialCannula(bsa: bsaValue)
        adultVAGroinDictionary[title] = value
        adultVAGroinArray.append(title)
        let (title2, value2) = vaNeckFemoralVenousCannula(bsa: bsaValue)
        adultVAGroinDictionary[title2] = value2
        adultVAGroinArray.append(title2)

        let (title3, value3) = vaGroinMultiStageFemoralVenousCannulae(bsa: bsaValue)
        adultVAGroinDictionary[title3] = value3
        adultVAGroinArray.append(title3)

        let (title4, value4) = vaGroinArterialHLSCannula15(bsa: bsaValue)
        adultVAGroinDictionary[title4] = value4
        adultVAGroinArray.append(title4)

        let (title5, value5) = vaGroinArterialHLSCannula23(bsa: bsaValue)
        adultVAGroinDictionary[title5] = value5
        adultVAGroinArray.append(title5)

        let (title6, value6) = vaGroinVenousHLSCannula23(bsa: bsaValue)
        adultVAGroinDictionary[title6] = value6
        adultVAGroinArray.append(title6)

        let (title7, value7) = vaGroinVenousHLSCannula38(bsa: bsaValue)
        adultVAGroinDictionary[title7] = value7
        adultVAGroinArray.append(title7)

        let (title8, value8) = vaGroinVenousHLSCannula55(bsa: bsaValue)
        adultVAGroinDictionary[title8] = value8
        adultVAGroinArray.append(title8)

        let (title9, value9) = vaGroinEdwardVenousCannula(bsa: bsaValue)
        adultVAGroinDictionary[title9] = value9
        adultVAGroinArray.append(title9)

    }
    
    func adultVVDL(){
        
        let (title,value) = vvdlDualLumenCatheterAdult(bsa: bsaValue)
        adultVVDLDictionary[title] = value
        adultVVDLArray.append(title)
        let (title2, value2) = vvdlCresentLumenECLSCannula(bsa: bsaValue)
        adultVVDLDictionary[title2] = value2
        adultVVDLArray.append(title2)

    }
}


