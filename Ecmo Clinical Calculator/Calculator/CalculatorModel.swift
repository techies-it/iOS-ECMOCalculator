//
//  CalculatorModel.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 02/09/24.
//

import Foundation
import SwiftUI

class CalculatorModel: ObservableObject {
    
    
    @Published var weightInputLbs: String {
        didSet {
            saveData()
        }
    }
    @Published var weightInputKg: String {
        didSet {
            saveData()
        }
    }
    
    @Published var centimetersInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var inchesInput: String{
        didSet{
            saveData()
        }
    }
    
    @Published var weightInputBsa: String {
        didSet {
            saveData()
        }
    }
    
    @Published var heightInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var weightInputBbsa: String {
        didSet {
            saveData()
        }
    }
    @Published var fio2InputOI: String {
        didSet {
            saveData()
        }
    }
    @Published var mapInputOI: String {
        didSet {
            saveData()
        }
    }
    @Published var pao2InputOI: String {
        didSet {
            saveData()
        }
    }
    @Published var pao2InputRatio: String {
        didSet {
            saveData()
        }
    }
    @Published var fio2InputRatio: String {
        didSet {
            saveData()
        }
    }
    
    @Published var weightInputERCM: String{
        didSet{
            saveData()
        }
    }
    
    @Published var hematocritInputERCM: String{
        didSet{
            saveData()
        }
    }
    
    
    @Published var weightInputHLD: String {
        didSet {
            saveData()
        }
    }
    
    
    @Published var weightInputDilutionalHematorcrit: String {
        didSet {
            saveData()
        }
    }
    
    @Published var hctInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var eclsCircuitVolumeInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var hemoglobinInput: String {
        didSet {
            saveData()
        }
    }
    @Published var arterialOxygenSaturationInput: String {
        didSet {
            saveData()
        }
    }
    @Published var partialPressureOfOxygenInput: String {
        didSet {
            saveData()
        }
    }
    @Published var heartRateInput: String {
        didSet {
            saveData()
        }
    }
    @Published var strokeVolumeInput: String {
        didSet {
            saveData()
        }
    }
    @Published var bsaInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var cardiacOutputInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var cardiacIndexBsaInput: String {
        didSet {
            saveData()
        }
    }
    
    
    @Published var blank: String {
        didSet {
            saveData()
        }
    }
    @Published var poundsToKgResult: String {
        didSet {
            saveData()
        }
    }
    @Published var kgToPoundsResult: String {
        didSet {
            saveData()
        }
    }
    
    @Published var inchesToCentimetersResult: String{
        didSet{
            saveData()
        }
    }
    
    @Published var centimetersToInchesResult: String {
        didSet {
            saveData()
        }
    }
    @Published var bodySurfaceAreaResult: String {
        didSet {
            saveData()
        }
    }
    @Published var weightBasedBodySurfaceAreaResult: String {
        didSet {
            saveData()
        }
    }
    @Published var oxygenIndexResult: String {
        didSet {
            saveData()
        }
    }
    @Published var paO2ByFiO2RatioResult: String {
        didSet {
            saveData()
        }
    }
    @Published var showHeparinList: Bool {
        didSet {
            saveData()
        }
    }
    
    @Published var showCardiaIndexCalculatorList: Bool {
        didSet {
            saveData()
        }
    }
    
    @Published var heparinLoadingDoseResult: [String] {
        didSet {
            saveData()
        }
    }
    @Published var cardiacIndexCalculatorResult: [String] {
        didSet {
            saveData()
        }
    }
    @Published var estimatedRedCellMassResult: String {
        didSet {
            saveData()
        }
    }
    @Published var dilutionalHCTResult: String {
        didSet {
            saveData()
        }
    }
    @Published var cardiacOutputResult: String {
        didSet {
            saveData()
        }
    }
    @Published var cardiacIndexResult: String {
        didSet {
            saveData()
        }
    }
    @Published var systemicVascularResistanceResult: String {
        didSet {
            saveData()
        }
    }
    @Published var pulmonaryVascularResistanceResult: String {
        didSet {
            saveData()
        }
    }
    @Published var oxygenContentArterialResult: String {
        didSet {
            saveData()
        }
    }
    @Published var oxygenDeliveryResult: String {
        didSet {
            saveData()
        }
    }
    @Published var oxygenContentVenousResult: String {
        didSet {
            saveData()
        }
    }
    @Published var oxygenConsumptionResult: String {
        didSet {
            saveData()
        }
    }
    @Published var sweepGasResult: String {
        didSet {
            saveData()
        }
    }
    
    init() {
        // Load saved data from UserDefaults
        self.centimetersInput = UserDefaults.standard.string(forKey: "centimetersInput") ?? ""
        self.inchesInput = UserDefaults.standard.string(forKey: "inchesInput") ?? ""
        
        self.weightInputLbs = UserDefaults.standard.string(forKey: "weightInputLbs") ?? ""
        self.weightInputKg = UserDefaults.standard.string(forKey: "weightInputKg") ?? ""
        self.weightInputBsa = UserDefaults.standard.string(forKey: "weightInputBsa") ?? ""
        self.heightInput = UserDefaults.standard.string(forKey: "heightInput") ?? ""

        self.weightInputBbsa = UserDefaults.standard.string(forKey: "weightInputBbsa") ?? ""

        self.fio2InputOI = UserDefaults.standard.string(forKey: "fio2InputOI") ?? ""
        self.mapInputOI = UserDefaults.standard.string(forKey: "mapInputOI") ?? ""
        self.pao2InputOI = UserDefaults.standard.string(forKey: "pao2InputOI") ?? ""
        self.pao2InputRatio = UserDefaults.standard.string(forKey: "pao2InputRatio") ?? ""
        self.fio2InputRatio = UserDefaults.standard.string(forKey: "fio2InputRatio") ?? ""
        
        self.weightInputERCM = UserDefaults.standard.string(forKey: "weightInputERCM") ?? ""
        self.hematocritInputERCM = UserDefaults.standard.string(forKey: "hematocritInputERCM") ?? ""
        
        self.weightInputDilutionalHematorcrit = UserDefaults.standard.string(forKey: "hematocritInputERCM") ?? ""
        self.hctInput = UserDefaults.standard.string(forKey: "hctInput") ?? ""
        self.eclsCircuitVolumeInput = UserDefaults.standard.string(forKey: "eclsCircuitVolumeInput") ?? ""
        
        self.cardiacOutputInput = UserDefaults.standard.string(forKey: "cardiacOutputInput") ?? ""
        self.cardiacIndexBsaInput = UserDefaults.standard.string(forKey: "cardiacIndexBsaInput") ?? ""
        
        self.weightInputHLD = UserDefaults.standard.string(forKey: "weightInputHLD") ?? ""
        self.hemoglobinInput = UserDefaults.standard.string(forKey: "hemoglobinInput") ?? ""
        self.arterialOxygenSaturationInput = UserDefaults.standard.string(forKey: "arterialOxygenSaturationInput") ?? ""
        self.partialPressureOfOxygenInput = UserDefaults.standard.string(forKey: "partialPressureOfOxygenInput") ?? ""
        self.heartRateInput = UserDefaults.standard.string(forKey: "heartRateInput") ?? ""
        self.strokeVolumeInput = UserDefaults.standard.string(forKey: "strokeVolumeInput") ?? ""
        self.bsaInput = UserDefaults.standard.string(forKey: "bsaInput") ?? ""
        self.blank = UserDefaults.standard.string(forKey: "blank") ?? ""
        
        
        //Results
        self.poundsToKgResult = UserDefaults.standard.string(forKey: "poundsToKgResult") ?? ""
        self.kgToPoundsResult = UserDefaults.standard.string(forKey: "kgToPoundsResult") ?? ""
        self.centimetersToInchesResult = UserDefaults.standard.string(forKey: "centimetersToInchesResult") ?? ""
        self.inchesToCentimetersResult = UserDefaults.standard.string(forKey: "inchesToCentimetersResult") ?? ""
        
        self.bodySurfaceAreaResult = UserDefaults.standard.string(forKey: "bodySurfaceAreaResult") ?? ""
        self.weightBasedBodySurfaceAreaResult = UserDefaults.standard.string(forKey: "weightBasedBodySurfaceAreaResult") ?? ""
        self.oxygenIndexResult = UserDefaults.standard.string(forKey: "oxygenIndexResult") ?? ""
        self.paO2ByFiO2RatioResult = UserDefaults.standard.string(forKey: "paO2ByFiO2RatioResult") ?? ""
        self.showHeparinList = UserDefaults.standard.bool(forKey: "showHeparinList")
        self.showCardiaIndexCalculatorList = UserDefaults.standard.bool(forKey: "showCardiaIndexCalculatorList")
        
        self.heparinLoadingDoseResult = UserDefaults.standard.stringArray(forKey: "heparinLoadingDoseResult") ?? [""]
        self.cardiacIndexCalculatorResult = UserDefaults.standard.stringArray(forKey: "cardiacIndexCalculatorResult") ?? [""]
        
        self.estimatedRedCellMassResult = UserDefaults.standard.string(forKey: "estimatedRedCellMassResult") ?? ""
        
        self.dilutionalHCTResult = UserDefaults.standard.string(forKey: "dilutionalHCTResult") ?? ""
        self.cardiacOutputResult = UserDefaults.standard.string(forKey: "cardiacOutputResult") ?? ""
        self.cardiacIndexResult = UserDefaults.standard.string(forKey: "cardiacIndexResult") ?? ""
        self.systemicVascularResistanceResult = UserDefaults.standard.string(forKey: "systemicVascularResistanceResult") ?? ""
        self.pulmonaryVascularResistanceResult = UserDefaults.standard.string(forKey: "pulmonaryVascularResistanceResult") ?? ""
        self.oxygenContentArterialResult = UserDefaults.standard.string(forKey: "oxygenContentArterialResult") ?? ""
        self.oxygenDeliveryResult = UserDefaults.standard.string(forKey: "oxygenDeliveryResult") ?? ""
        self.oxygenContentVenousResult = UserDefaults.standard.string(forKey: "oxygenContentVenousResult") ?? ""
        self.oxygenConsumptionResult = UserDefaults.standard.string(forKey: "oxygenConsumptionResult") ?? ""
        self.sweepGasResult = UserDefaults.standard.string(forKey: "sweepGasResult") ?? ""
    }
    
    private func saveData() {
        UserDefaults.standard.set(inchesInput,forKey: "inchesInput")
        UserDefaults.standard.set(centimetersInput, forKey: "centimetersInput")
        UserDefaults.standard.set(weightInputERCM, forKey: "weightInputERCM")
        UserDefaults.standard.set(hematocritInputERCM, forKey: "hematocritInputERCM")
        
        UserDefaults.standard.set(weightInputDilutionalHematorcrit, forKey: "weightInputDilutionalHematorcrit")
        UserDefaults.standard.set(hctInput, forKey: "hctInput")
        UserDefaults.standard.set(eclsCircuitVolumeInput, forKey: "eclsCircuitVolumeInput")
        
        UserDefaults.standard.set(cardiacOutputInput, forKey: "cardiacOutputInput")
        UserDefaults.standard.set(cardiacIndexBsaInput, forKey: "cardiacIndexBsaInput")
        
        UserDefaults.standard.set(weightInputLbs, forKey: "weightInputLbs")
        UserDefaults.standard.set(weightInputKg, forKey: "weightInputKg")
        UserDefaults.standard.set(heightInput, forKey: "heightInput")
        UserDefaults.standard.set(fio2InputOI, forKey: "fio2InputOI")
        UserDefaults.standard.set(mapInputOI, forKey: "mapInputOI")
        UserDefaults.standard.set(pao2InputOI, forKey: "pao2InputOI")
        UserDefaults.standard.set(pao2InputRatio, forKey: "pao2InputRatio")
        UserDefaults.standard.set(fio2InputRatio, forKey: "fio2InputRatio")
        UserDefaults.standard.set(weightInputHLD, forKey: "weightInputHLD")
        UserDefaults.standard.set(hemoglobinInput, forKey: "hemoglobinInput")
        UserDefaults.standard.set(arterialOxygenSaturationInput, forKey: "arterialOxygenSaturationInput")
        UserDefaults.standard.set(partialPressureOfOxygenInput, forKey: "partialPressureOfOxygenInput")
        UserDefaults.standard.set(heartRateInput, forKey: "heartRateInput")
        UserDefaults.standard.set(strokeVolumeInput, forKey: "strokeVolumeInput")
        UserDefaults.standard.set(bsaInput, forKey: "bsaInput")
        UserDefaults.standard.set(blank, forKey: "blank")
        
        
        //Results
        UserDefaults.standard.set(poundsToKgResult, forKey: "poundsToKgResult")
        UserDefaults.standard.set(kgToPoundsResult, forKey: "kgToPoundsResult")
        UserDefaults.standard.set(centimetersToInchesResult, forKey: "centimetersToInchesResult")
        UserDefaults.standard.set(inchesToCentimetersResult,forKey: "inchesToCentimetersResult")
        
        UserDefaults.standard.set(bodySurfaceAreaResult, forKey: "bodySurfaceAreaResult")
        UserDefaults.standard.set(weightBasedBodySurfaceAreaResult, forKey: "weightBasedBodySurfaceAreaResult")
        UserDefaults.standard.set(oxygenIndexResult, forKey: "oxygenIndexResult")
        UserDefaults.standard.set(paO2ByFiO2RatioResult, forKey: "paO2ByFiO2RatioResult")
        UserDefaults.standard.set(showHeparinList, forKey: "showHeparinList")
        UserDefaults.standard.set(showCardiaIndexCalculatorList, forKey: "showCardiaIndexCalculatorList")
        
        UserDefaults.standard.set(heparinLoadingDoseResult, forKey: "heparinLoadingDoseResult")
        UserDefaults.standard.set(cardiacIndexCalculatorResult, forKey: "cardiacIndexCalculatorResult")
        
        UserDefaults.standard.set(estimatedRedCellMassResult, forKey: "estimatedRedCellMassResult")
        UserDefaults.standard.set(dilutionalHCTResult, forKey: "dilutionalHCTResult")
        UserDefaults.standard.set(cardiacOutputResult, forKey: "cardiacOutputResult")
        UserDefaults.standard.set(cardiacIndexResult, forKey: "cardiacIndexResult")
        UserDefaults.standard.set(systemicVascularResistanceResult, forKey: "systemicVascularResistanceResult")
        UserDefaults.standard.set(pulmonaryVascularResistanceResult, forKey: "pulmonaryVascularResistanceResult")
        UserDefaults.standard.set(oxygenContentArterialResult, forKey: "oxygenContentArterialResult")
        UserDefaults.standard.set(oxygenDeliveryResult, forKey: "oxygenDeliveryResult")
        UserDefaults.standard.set(oxygenContentVenousResult, forKey: "oxygenContentVenousResult")
        UserDefaults.standard.set(oxygenConsumptionResult, forKey: "oxygenConsumptionResult")
        UserDefaults.standard.set(sweepGasResult, forKey: "sweepGasResult")
    }
    
    func calculatePoundsToKg() {
        if let lbs = Float(weightInputLbs) {
            poundsToKgResult = calPoundsToKilograms(pounds: lbs)
        } else {
            poundsToKgResult = "--kg"
        }
    }
    
    func calculateKgToPounds() {
        if let lbs = Float(weightInputKg) {
            kgToPoundsResult = calKilogramsToPounds(kilograms: lbs)
        } else {
            kgToPoundsResult = "--lbs"
        }
    }
    
    func calculateInchesToCentimeters(){
        if let inches = Float(inchesInput){
            inchesToCentimetersResult = calInchesToCm(inches: inches)
        } else {
            inchesToCentimetersResult = "--cm"
        }
    }
    
    func calculateCentimetersToInches() {
        if let cm = Float(centimetersInput) {
            centimetersToInchesResult = calCmToInches(cms: cm)
        } else {
            centimetersToInchesResult = "--in"
        }
    }
  
    
    func calculateBodySurfaceArea(){
        if let weight = Float(weightInputBsa),let height = Float(heightInput){
            bodySurfaceAreaResult = calBodySurfaceArea(weight: weight, height: height)
        }
        else{
            bodySurfaceAreaResult = "--m\u{00B2}"
        }
    }
    
    func calculateWeightBasedBodySurfaceArea(){
        if let weight = Float(weightInputBbsa){
            weightBasedBodySurfaceAreaResult = calWeightBsa(weight: weight)
        }
        else{
            weightBasedBodySurfaceAreaResult = "--m\u{00B2}"
        }
    }
    
    func calculateOxygenIndex() {
        if let fio2 = Float(fio2InputOI), let map = Float(mapInputOI), let pao2 = Float(pao2InputOI) {
            oxygenIndexResult = calOxygenIndex(mapValue: map, fio2: fio2, pao2: pao2)
        } else {
            oxygenIndexResult = "--"
        }
    }
   

    func calculatePao2Fio2Ratio(){
        if let pao2 = Float(pao2InputRatio),let fio2 = Float(fio2InputRatio){
            paO2ByFiO2RatioResult = calPao2fio2Ratio(pao2: pao2, fio2: fio2)
        }
        else{
            paO2ByFiO2RatioResult = "--s"
        }
    }
   
    
    func calculateHeparinLoadingDose() {
        if let weight = Float(weightInputHLD) {
            heparinLoadingDoseResult = calHeparingLoadingDose(weight: weight)
            withAnimation(.linear(duration: 0.4)) {
                showHeparinList = true
            }
        } else {
            withAnimation(.linear(duration: 0.3)){
                heparinLoadingDoseResult = ["--"]
                showHeparinList = false
            }
        }
    }
    
 
    func calculateCardiacIndexCalculator(){
        if let bsa = Float(bsaInput){
            cardiacIndexCalculatorResult = calCardiacIndexCalculator(bsa: bsa)
            withAnimation(.linear(duration: 0.4)) {
                showCardiaIndexCalculatorList = true
            }
        }
        else{
            withAnimation(.linear(duration: 0.3)){
                cardiacIndexCalculatorResult = ["--"]
                showCardiaIndexCalculatorList = false
            }
        }
    }
    
    func calculateEstimatedRedCellMass(){
        if let weight = Float(weightInputERCM), let hematocrit = Float(hematocritInputERCM){
            estimatedRedCellMassResult  = calEstimatedRedCellMass(weight: weight, hematocrit: hematocrit)
        }
        else{
            estimatedRedCellMassResult = "--mL"
        }
    }
   
    func calculateDilutionalHematocrit(){
        if let weight = Float(weightInputDilutionalHematorcrit), let hct = Float(hctInput), let eclsCircuitVolume = Float(eclsCircuitVolumeInput){
            dilutionalHCTResult  = calDilutionalHematocrit(weight: weight, hct: hct, circuitVol: eclsCircuitVolume)
        }
        else{
            dilutionalHCTResult = "--%"
        }
    }
    

    func calculateCardiacOutput(){
        if let heartRate = Float(heartRateInput), let strokeVolume = Float(strokeVolumeInput){
            cardiacOutputResult = calCardiacOutput(heartRate: heartRate, strokeVol: strokeVolume)
        }
        else{
            cardiacOutputResult = "--L/min"
        }
    }
    
  
    func calculateCardiacIndex(){
        if let cardiacOutput = Float(cardiacOutputInput), let bsa = Float(cardiacIndexBsaInput){
            cardiacIndexResult = calCardiacIndex(cardiacOutput: cardiacOutput, bsa: bsa)
        }
        else{
            cardiacIndexResult = "--L/min/m\u{00B2}"
        }
    }
    
    // ------
    
//    func calSystemicVascularResistance(mapValue: Float, cvp: Float, cardiacOutput: Float)-> String{
//        let vascularResistance = ((mapValue - cvp)/cardiacOutput) * 80
//        return "\(String(format: "%.0f", vascularResistance)) Dynes-sec/cm\u{2075}"
//    }
    
    
    
//    func calPulmonaryVascularResistance(mpap: Float, pcwp: Float, cardiacOutput: Float) -> String{
//        let vascularResistance = ((mpap - pcwp) / cardiacOutput) * 80
//        return "\(String(format: "%.0f", vascularResistance)) Dynes-sec/cm\u{2075}"
//    }
//    func calOxygenContentArterial(hgb: Float, svo2: Float, pao2: Float) -> String{
//        let resultArterialOC = (hgb * 1.34 * (svo2 / 100)) + (pao2 * 0.003)
//        return "\(String(format: "%.0f", resultArterialOC)) mL/dL"
//    }
//    func calOxygenDelivery(co: Float, cao2: Float) -> String{
//        let resultDo2 = (co * cao2) * 10
//        return "\(String(format: "%.0f", resultDo2)) mL/min"
//    }
//    func calOxygenContentVenous(hgb: Float, svo2: Float, pvo2: Float)-> String{
//        let resultContent = (hgb * 1.34 * (svo2 / 100)) + (pvo2 * 0.003)
//        return "\(String(format: "%.2f", resultContent)) mL/dL"
//    }
//    func calOxygenConsumption(co: Float, cao2cvo2: Float) -> String{
//        let oxygenConsumption = (co * cao2cvo2) * 10
//        return "\(String(format: "%.0f", oxygenConsumption)) mL/min"
//    }
//    func calSweepGas(currentPaco2: Float, sweepFlow: Float,desiredPaco2: Float ) -> String{
//        let sweepGas = (currentPaco2 * sweepFlow) / desiredPaco2
//        return "\(String(format: "%.1f", sweepGas)) L/min"
//    }
    
    // Add other calculation functions as needed.
}



