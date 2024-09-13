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
    
    @Published var mapValueSVRInput: String {
        didSet {
            saveData()
        }
    }
    @Published var cvpSVRInput: String {
        didSet {
            saveData()
        }
    }
    @Published var cardiacOutputInputSVR: String {
        didSet {
            saveData()
        }
    }
    
    @Published var mpapInput: String {
        didSet {
            saveData()
        }
    }
    @Published var pcwpInput: String {
        didSet {
            saveData()
        }
    }
    @Published var cardiacOutputPVR: String {
        didSet {
            saveData()
        }
    }
    
    @Published var hgbInput: String {
        didSet {
            saveData()
        }
    }
    @Published var sao2Input: String {
        didSet {
            saveData()
        }
    }
    @Published var pao2OCAInput: String {
        didSet {
            saveData()
        }
    }
  
    @Published var coODInput: String {
        didSet {
            saveData()
        }
    }
    @Published var cao2Input: String {
        didSet {
            saveData()
        }
    }
    
    @Published var hgbOCVInput: String {
        didSet {
            saveData()
        }
    }
    @Published var svo2OCVInput: String {
        didSet {
            saveData()
        }
    }
    @Published var pvo2OCVInput: String {
        didSet {
            saveData()
        }
    }
    
    @Published var coOCInput: String {
        didSet {
            saveData()
        }
    }
    @Published var cao2cvo2: String {
        didSet {
            saveData()
        }
    }
    @Published var currentPaco2Input: String {
        didSet {
            saveData()
        }
    }
  
    @Published var sweepFlowInput: String {
        didSet {
            saveData()
        }
    }
    @Published var desiredPaco2Input: String {
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
        
        self.mapValueSVRInput = UserDefaults.standard.string(forKey: "mapValueSVRInput") ?? ""
        self.cvpSVRInput = UserDefaults.standard.string(forKey: "cvpSVRInput") ?? ""
        self.cardiacOutputInputSVR = UserDefaults.standard.string(forKey: "cardiacOutputInputSVR") ?? ""
        
        self.mpapInput = UserDefaults.standard.string(forKey: "mpapInput") ?? ""
        self.pcwpInput = UserDefaults.standard.string(forKey: "pcwpInput") ?? ""
        self.cardiacOutputPVR = UserDefaults.standard.string(forKey: "cardiacOutputPVR") ?? ""
        
        self.hgbInput = UserDefaults.standard.string(forKey: "hgbInput") ?? ""
        self.sao2Input = UserDefaults.standard.string(forKey: "sao2Input") ?? ""
        self.pao2OCAInput = UserDefaults.standard.string(forKey: "pao2OCAInput") ?? ""
        
        self.coODInput = UserDefaults.standard.string(forKey: "coODInput") ?? ""
        self.cao2Input = UserDefaults.standard.string(forKey: "cao2Input") ?? ""

        self.hgbOCVInput = UserDefaults.standard.string(forKey: "hgbOCVInput") ?? ""
        self.svo2OCVInput = UserDefaults.standard.string(forKey: "svo2OCVInput") ?? ""
        self.pvo2OCVInput = UserDefaults.standard.string(forKey: "pvo2OCVInput") ?? ""
        
        self.coOCInput = UserDefaults.standard.string(forKey: "coOCInput") ?? ""
        self.cao2cvo2 = UserDefaults.standard.string(forKey: "cao2cvo2") ?? ""
        
        self.currentPaco2Input = UserDefaults.standard.string(forKey: "currentPaco2Input") ?? ""
        self.sweepFlowInput = UserDefaults.standard.string(forKey: "sweepFlowInput") ?? ""
        self.desiredPaco2Input = UserDefaults.standard.string(forKey: "desiredPaco2Input") ?? ""
        
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
        
        UserDefaults.standard.set(mapValueSVRInput, forKey: "mapValueSVRInput")
        UserDefaults.standard.set(cvpSVRInput, forKey: "cvpSVRInput")
        UserDefaults.standard.set(cardiacOutputInputSVR, forKey: "cardiacOutputInputSVR")

        UserDefaults.standard.set(mpapInput, forKey: "mpapInput")
        UserDefaults.standard.set(pcwpInput, forKey: "pcwpInput")
        UserDefaults.standard.set(cardiacOutputPVR, forKey: "cardiacOutputPVR")
        
        
        UserDefaults.standard.set(hgbInput, forKey: "hgbInput")
        UserDefaults.standard.set(sao2Input, forKey: "sao2Input")
        UserDefaults.standard.set(pao2OCAInput, forKey: "pao2OCAInput")
        
        UserDefaults.standard.set(coODInput, forKey: "coODInput")
        UserDefaults.standard.set(cao2Input, forKey: "cao2Input")
        
        UserDefaults.standard.set(hgbOCVInput, forKey: "hgbOCVInput")
        UserDefaults.standard.set(svo2OCVInput, forKey: "svo2OCVInput")
        UserDefaults.standard.set(pvo2OCVInput, forKey: "pvo2OCVInput")
        
        
        UserDefaults.standard.set(coOCInput, forKey: "coOCInput")
        UserDefaults.standard.set(cao2cvo2, forKey: "cao2cvo2")
        
        UserDefaults.standard.set(currentPaco2Input, forKey: "currentPaco2Input")
        UserDefaults.standard.set(sweepFlowInput, forKey: "sweepFlowInput")
        UserDefaults.standard.set(desiredPaco2Input, forKey: "desiredPaco2Input")
        
        
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
    
    func calculateSystemicVascularResistance(){
        if let mapValue = Float(mapValueSVRInput), let cvp = Float(cvpSVRInput), let cardiacOutputInputSVR = Float(cardiacOutputInputSVR){
            systemicVascularResistanceResult = calSystemicVascularResistance(mapValue: mapValue, cvp: cvp, cardiacOutput: cardiacOutputInputSVR)
        }
        else{
            systemicVascularResistanceResult = "--Dynes-sec/cm\u{2075}"
        }
    }
    
   
    func calculatePulmonaryVascularResistance(){
        if let mpap = Float(mpapInput), let pcwp = Float(pcwpInput), let cardiacOutputPVR = Float(cardiacOutputPVR){
            pulmonaryVascularResistanceResult = calPulmonaryVascularResistance(mpap: mpap, pcwp: pcwp, cardiacOutput: cardiacOutputPVR)
        }
        else{
            pulmonaryVascularResistanceResult = "--Dynes-sec/cm\u{2075}"
        }
    }
    
    func calculateOxygenContentArterial(){
        if let hgb = Float(hgbInput), let sao2 = Float(sao2Input), let pao2 = Float(pao2OCAInput){
            oxygenContentArterialResult = calOxygenContentArterial(hgb: hgb, sao2: sao2, pao2: pao2)
        }
        else{
            oxygenContentArterialResult = "--mL/dL"
        }
    }

    func calculateOxygenDelivery(){
        if let co = Float(coODInput), let cao2 = Float(cao2Input){
            oxygenDeliveryResult = calOxygenDelivery(co: co, cao2: cao2)
        }
        else{
            oxygenDeliveryResult = "--mL/min"
        }
    }
    
    
    func calculateOxygenContentVenous(){
        if let hgbOCV = Float(hgbOCVInput), let svo2 = Float(svo2OCVInput), let pvo2 = Float(pvo2OCVInput){
            oxygenContentVenousResult = calOxygenContentVenous(hgb: hgbOCV, svo2: svo2, pvo2: pvo2)
        }
        else{
            oxygenContentVenousResult = "--mL/dL"
        }
    }
    
    func calculateOxygenConsumption(){
        if let co = Float(coOCInput),let cao2cvo2 = Float(cao2cvo2){
            oxygenConsumptionResult = calOxygenConsumption(co: co, cao2cvo2: cao2cvo2)
        }
        else{
            oxygenConsumptionResult = "--mL/min"
        }
    }

    func calculateSweepGas(){
        if let currentPaco2 = Float(currentPaco2Input), let sweepFlow = Float(sweepFlowInput), let desiredPaco2 = Float(desiredPaco2Input){
            sweepGasResult = calSweepGas(currentPaco2: currentPaco2, sweepFlow: sweepFlow, desiredPaco2: desiredPaco2)
        }
        else{
            sweepGasResult = "--L/min"
        }
    }
    
   
}



