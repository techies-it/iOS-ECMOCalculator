//
//  CalculatorView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var model = CalculatorModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Clinical Calculator")
                    .font(.largeTitle)
                    .foregroundStyle(.titleLabel)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                ScrollView {
                    VStack(spacing: 5) {
                        ListItemView(titleLabel: "Pounds to Kilogram", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $model.weightInputLbs, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .onChange(of: model.weightInputLbs) { _ in
                                model.calculatePoundsToKg()
                            }
                        ResultText(result: model.poundsToKgResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Kilogram to Pounds", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $model.weightInputKg, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .onChange(of: model.weightInputKg) { _ in
                                model.calculateKgToPounds()
                            }
                        ResultText(result: model.kgToPoundsResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Inches to Centimeters", subTitleLabel: "in", placeHolderlabel: "in", textValue: $model.inchesInput, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .onChange(of: model.inchesInput) { _ in
                                model.calculateInchesToCentimeters()
                            }
                        ResultText(result: model.inchesToCentimetersResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Centimeters to Inches", subTitleLabel: "cm", placeHolderlabel: "cm", textValue: $model.centimetersInput, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .onChange(of: model.centimetersInput) { _ in
                                model.calculateCentimetersToInches()
                            }
                        ResultText(result: model.centimetersToInchesResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Body Surface Area", 
                                     subTitleLabel: "Height",subTitleLabel2: "Weight",
                                     placeHolderlabel: "cm",placeHolderlabel2:"kg", textValue: $model.heightInput, 
                                     textValue2: $model.weightInputBsa,
                                     textValue3: $model.blank,numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.weightInputBsa) { _ in
                                model.calculateBodySurfaceArea()
                            }
                        ResultText(result: model.bodySurfaceAreaResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Weight Based Body Surface Area", subTitleLabel: "Weight", placeHolderlabel: "kg", textValue: $model.weightInputBbsa, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .onChange(of: model.weightInputBbsa) { _ in
                                model.calculateWeightBasedBodySurfaceArea()
                            }
                        ResultText(result: model.weightBasedBodySurfaceAreaResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Oxygen Index", subTitleLabel: "MAP", subTitleLabel2: "FiO\u{2082}", subTitleLabel3: "PaO\u{2082}", placeHolderlabel: "cmH\u{2082}O", placeHolderlabel2: "%", placeHolderlabel3: "PaO\u{2082}", textValue: $model.mapInputOI, textValue2: $model.fio2InputOI, textValue3: $model.pao2InputOI, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.pao2InputOI) { _ in
                                model.calculateOxygenIndex()
                            }
                        ResultText(result: model.oxygenIndexResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "PaO\u{2082}/FiO\u{2082} Ratio",
                                     subTitleLabel: "PaO\u{2082}", subTitleLabel2: "FiO\u{2082}",
                                     placeHolderlabel: "mmHg", placeHolderlabel2: "%",  textValue: $model.pao2InputRatio, textValue2: $model.fio2InputRatio, textValue3: $model.blank, numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.fio2InputRatio) { _ in
                                model.calculatePao2Fio2Ratio()
                            }
                        ResultText(result: model.paO2ByFiO2RatioResult)
                            .padding(.horizontal, 30)
                        
                        
                        ListItemView(titleLabel: "Heparin Loading Dose", subTitleLabel: "Weight", placeHolderlabel: "kg", textValue: $model.weightInputHLD, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 20)
                            .onChange(of: model.weightInputHLD) { _ in
                                model.calculateHeparinLoadingDose()
                            }
                        if model.showHeparinList {
                            withAnimation {
                                ResultList(result: model.heparinLoadingDoseResult)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 20)
                            }
                        }
                        
                        ListItemView(titleLabel: "Cardiac Index Calculator",
                                     subTitleLabel: "BSA", placeHolderlabel: "m\u{00B2}", textValue: $model.bsaInput, textValue2: $model.blank, textValue3: $model.blank)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 20)
                            .onChange(of: model.bsaInput) { _ in
                                model.calculateCardiacIndexCalculator()
                            }
                        if model.showCardiaIndexCalculatorList {
                            withAnimation {
                                ResultList(result: model.cardiacIndexCalculatorResult)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 20)
                            }
                        }
                        
                        ListItemView(titleLabel: "Estimate Red Cell Mass",
                                     subTitleLabel: "Weight", subTitleLabel2: "Hematocrit",
                                     placeHolderlabel: "kg", placeHolderlabel2: "%",  textValue: $model.weightInputERCM, textValue2: $model.hematocritInputERCM, textValue3: $model.blank, numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.hematocritInputERCM) { _ in
                                model.calculateEstimatedRedCellMass()
                            }
                        ResultText(result: model.estimatedRedCellMassResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Dilutional Hematocrit(HCT)", subTitleLabel: "Weight", subTitleLabel2: "HCT", subTitleLabel3: "ECLS Circuit Vol.",
                                     placeHolderlabel: "kg", placeHolderlabel2: "%", placeHolderlabel3: "mL",
                                     textValue: $model.weightInputDilutionalHematorcrit, textValue2: $model.hctInput, textValue3: $model.eclsCircuitVolumeInput, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.eclsCircuitVolumeInput) { _ in
                                model.calculateDilutionalHematocrit()
                            }
                        ResultText(result: model.dilutionalHCTResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Cardiac Output",
                                     subTitleLabel: "HR", subTitleLabel2: "Stroke Vol",
                                     placeHolderlabel: "B/min", placeHolderlabel2: "mL",  textValue: $model.heartRateInput, textValue2: $model.strokeVolumeInput, textValue3: $model.blank, numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.strokeVolumeInput) { _ in
                                model.calculateCardiacOutput()
                            }
                        ResultText(result: model.cardiacOutputResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Cardiac Index",
                                     subTitleLabel: "CO", subTitleLabel2: "BSA",
                                     placeHolderlabel: "L/min", placeHolderlabel2: "m\u{00B2}",
                                     textValue: $model.cardiacOutputInput, textValue2: $model.cardiacIndexBsaInput, textValue3: $model.blank, numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cardiacIndexBsaInput) { _ in
                                model.calculateCardiacIndex()
                            }
                        ResultText(result: model.cardiacIndexResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Systemic Vascular Resistance", subTitleLabel: "MAP", subTitleLabel2: "CVP", subTitleLabel3: "CO",
                                     placeHolderlabel: "mmHg", placeHolderlabel2: "mmHg", placeHolderlabel3: "L/min",
                                     textValue: $model.mapValueSVRInput, textValue2: $model.cvpSVRInput, textValue3: $model.cardiacOutputInputSVR, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cardiacOutputInputSVR) { _ in
                                model.calculateSystemicVascularResistance()
                            }
                        ResultText(result: model.systemicVascularResistanceResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Pulmonary Vascular Resistance", subTitleLabel: "MPAP", subTitleLabel2: "PCWP", subTitleLabel3: "CO",
                                     placeHolderlabel: "mmHg", placeHolderlabel2: "mmHg", placeHolderlabel3: "L/min",
                                     textValue: $model.mpapInput, textValue2: $model.pcwpInput, textValue3: $model.cardiacOutputPVR, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cardiacOutputPVR) { _ in
                                model.calculatePulmonaryVascularResistance()
                            }
                        ResultText(result: model.pulmonaryVascularResistanceResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Oxygen Content(CaO\u{2082}) - Arterial", subTitleLabel: "Hgb", subTitleLabel2: "SaO\u{2082}", subTitleLabel3: "PaO\u{2082}",
                                     placeHolderlabel: "g/dL", placeHolderlabel2: "%", placeHolderlabel3: "mmHg",
                                     textValue: $model.hgbInput, textValue2: $model.sao2Input, textValue3: $model.pao2OCAInput, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.pao2OCAInput) { _ in
                                model.calculateOxygenContentArterial()
                            }
                        ResultText(result: model.oxygenContentArterialResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Oxygen Delivery (DO\u{2082})",
                                     subTitleLabel: "CO", subTitleLabel2: "CaO\u{2082}",
                                     placeHolderlabel: "L/min", placeHolderlabel2: "CaO\u{2082}",
                                     textValue: $model.coODInput, textValue2: $model.cao2Input, textValue3: $model.blank, numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cao2Input) { _ in
                                model.calculateOxygenDelivery()
                            }
                        ResultText(result: model.oxygenDeliveryResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Oxygen Content(CvO\u{2082}) - Venous", subTitleLabel: "Hgb", subTitleLabel2: "SvO\u{2082}", subTitleLabel3: "PvO\u{2082}",
                                     placeHolderlabel: "g/dL", placeHolderlabel2: "%", placeHolderlabel3: "mmHg",
                                     textValue: $model.hgbOCVInput, textValue2: $model.svo2OCVInput, textValue3: $model.pvo2OCVInput, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.pvo2OCVInput) { _ in
                                model.calculateOxygenContentVenous()
                            }
                        ResultText(result: model.oxygenContentVenousResult)
                            .padding(.horizontal, 30)
                        
                        ListItemView(titleLabel: "Oxygen Consumption (VO\u{2082})",
                                     subTitleLabel: "CO", subTitleLabel2: "CaO\u{2082}-CvO\u{2082}",
                                     placeHolderlabel: "L/min", placeHolderlabel2: "CaO\u{2082}-CvO\u{2082}",
                                     textValue: $model.coOCInput, textValue2: $model.cao2cvo2, textValue3: $model.blank, numberOfField: 2)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cao2cvo2) { _ in
                                model.calculateOxygenConsumption()
                            }
                        ResultText(result: model.oxygenConsumptionResult)
                            .padding(.horizontal, 30)
                        
                        
                        ListItemView(titleLabel: "Sweep Gas",
                                     subTitleLabel: "Current (PaCO\u{2082})", subTitleLabel2: "Current (Sweep Flow)", subTitleLabel3: "Desired (PaCO\u{2082})",
                                     placeHolderlabel: "mmHg", placeHolderlabel2: "L/min", placeHolderlabel3: "mmHg",
                                     textValue: $model.currentPaco2Input, textValue2: $model.sweepFlowInput, textValue3: $model.desiredPaco2Input, numberOfField: 3)
                            .padding(.horizontal, 30)
                            .onChange(of: model.desiredPaco2Input) { _ in
                                model.calculateSweepGas()
                            }
                        ResultText(result: model.sweepGasResult)
                            .padding(.horizontal, 30)
                        
                        
                    }
                }
            }
        }
    }
}



#Preview {
    CalculatorView()
}

//struct ListItemView: View {
//    var titleLabel: String
//    var subTitleLabel: String
//    var subTitleLabel2: String = ""
//    var subTitleLabel3: String = ""
//    var placeHolderlabel: String
//    var placeHolderlabel2: String = ""
//    var placeHolderlabel3: String = ""
//    @Binding var textValue: String
//    @Binding var textValue2: String
//    @Binding var textValue3: String
//    @State var numberOfField: Int = 1
//    
//    var body: some View {
//        
//        VStack(alignment: .leading) {
//            Text(titleLabel)
//                .multilineTextAlignment(.leading)
//                .font(.subheadline)
//                .foregroundStyle(.textFieldText)
//            
//            if numberOfField == 1 {
//                Text(subTitleLabel)
//                    .multilineTextAlignment(.leading)
//                    .font(.system(size: 13))
//                    .foregroundStyle(.tealBlue)
//                InputTextField(placeholder: placeHolderlabel, inputText: $textValue)
//            } else if numberOfField == 2 {
//                HStack(spacing: 150) {
//                    Text(subTitleLabel)
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 13))
//                        .foregroundStyle(.tealBlue)
//                    Text(subTitleLabel2)
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 13))
//                        .foregroundStyle(.tealBlue)
//                }
//                HStack(spacing: 10) {
//                    InputTextField(placeholder: placeHolderlabel, inputText: $textValue)
//                    InputTextField(placeholder: placeHolderlabel2, inputText: $textValue)
//                }
//            }else if numberOfField == 3 {
//                HStack(spacing: 90) {
//                    Text(subTitleLabel)
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 13))
//                        .foregroundStyle(.tealBlue)
//                    Text(subTitleLabel2)
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 13))
//                        .foregroundStyle(.tealBlue)
//                    Text(subTitleLabel3)
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 13))
//                        .foregroundStyle(.tealBlue)
//                }
//                HStack(spacing: 10) {
//                    InputTextField(placeholder: placeHolderlabel, showResponse: false, inputText: $textValue)
//                    InputTextField(placeholder: placeHolderlabel2, showResponse: false, inputText: $textValue2)
//                    InputTextField(placeholder: placeHolderlabel3, inputText: $textValue3)
//                }
//            }
//        }
//        
//    }
//}
//
//struct InputTextField: View {
//    var placeholder: String
//    var showResponse: Bool = true
//    @Binding var inputText: String
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color(.textFieldBackground))
//                .frame(height: 50)
//            
//            TextField(placeholder, text: $inputText)
//                .foregroundStyle(.textFieldText)
//                .padding(.horizontal, 15)
//                .frame(height: 50)
//                .onChange(of: inputText) { newValue in
//                    if showResponse {
//                        if let _ = newValue.firstIndex(of: "."),
//                           newValue.components(separatedBy: ".").count - 1 > 1 {
//                            inputText = String(newValue.dropLast())
//                        }
//                    }
//                }
//        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(inputText.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1)
//        )
//    }
//}
//
//
//struct ResultText: View {
//    let result: String
//    
//    var body: some View {
//        Text(result)
//            .font(.subheadline).fontWeight(.heavy)
//            .foregroundStyle(.tealBlue)
//            .frame(maxWidth: .infinity, alignment: .trailing)
//    }
//}
//
//struct ResultList: View {
//    let result: [String]
//    
//    var body: some View {
//        VStack(spacing: 10) {
//            ForEach(result, id: \.self) { dose in
//                Text(dose)
//                    .foregroundColor(.blue)
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                Divider()
//                
//            }
//        }
//        .padding()
//        .background(.textFieldBackground)
//        .cornerRadius(10)
//        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
//        .transition(.opacity)
//    }
//}
// Functions
func calPoundsToKilograms(pounds : Float) -> String{
    let kilograms = pounds/2.2
    return " \(round(kilograms * 100)/100.0) Kg "
}
func calKilogramsToPounds(kilograms : Float) -> String{
    let pounds = kilograms * 2.2
    return " \(round(pounds * 100)/100.0) lbs "
}
func calInchesToCm(inches: Float) -> String{
    let cmValue = inches * 2.54
    return "\(round(cmValue * 100)/100.0) cm"
}
func calCmToInches(cms: Float) -> String{
    let inchValue = cms/2.54
    return "\(round(inchValue * 100)/100.0) in"
}

func calBodySurfaceArea(weight: Float, height: Float) -> String{
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsa = 0.007184 * weightPower * heightPower
    return "\(round(bsa * 100)/100.0) m\u{00B2}"
}

func calWeightBsa(weight: Float)-> String{
    let calculatedWeightBSA = ((weight * 4) + 7) / (90 + weight)
    return "\(round(calculatedWeightBSA * 100)/100.0)  m\u{00B2}"
}

func calOxygenIndex(mapValue: Float, fio2: Float, pao2: Float) -> String{
    
    let oxygenIndexValue =  ((mapValue * (fio2 / 100)) / pao2) * 100
    return "\(round(oxygenIndexValue*10)/10.0)"
}

func calPao2fio2Ratio(pao2: Float, fio2: Float) -> String{
    let ratio = (pao2 / (fio2 / 100))
    return "\(String(format: "%.0f", ratio))"
}

func calHeparingLoadingDose(weight: Float) -> [String]{
    let loadingDoseArray: [Int] = [25,50,75,100,200,300,400]
    var doseArray: [String] = []
    var doseArrayValue = 0
    
    for number in loadingDoseArray{
        doseArrayValue = number * Int(weight)
        doseArray.append("\(number)u/Kg = \(doseArrayValue) units")
    }
    return doseArray
}

func calCardiacIndexCalculator(bsa: Float) -> [String]{
    let ciArray = [1.0,1.5,1.8,2.0,2.2,2.4,2.6,2.8,3.0]
    
    var resultCIArray : [String] = []
    var calculatedValue = 0.00
    
    for number in ciArray{
        calculatedValue = number * Double(bsa)
        resultCIArray.append("CI \(number) = \(String(format: "%.2f", calculatedValue)) L/min")
    }
    return resultCIArray
}
func calEstimatedRedCellMass(weight: Float, hematocrit: Float) -> String {
    let resultERCM = (weight * 75 * (hematocrit / 100))
    return "\(String(format: "%.2f", resultERCM)) mL"
}
func calDilutionalHematocrit(weight: Float, hct: Float, circuitVol: Float) -> String{
    let resultDilHematocrit = (((weight * 75) * (hct / 100)) / (circuitVol + (weight * 75))) * 100
    return "\(String(format: "%.1f", resultDilHematocrit)) %"
}
func calCardiacOutput(heartRate: Float, strokeVol: Float) -> String{
    let resultCardiacOutput = (heartRate * strokeVol) / 1000.0
    return "\(String(format: "%.2f", resultCardiacOutput)) L/min"
}
func calCardiacIndex(cardiacOutput: Float, bsa: Float) -> String{
    let resultCardiacIndex = cardiacOutput/bsa
    return "\(String(format: "%.1f", resultCardiacIndex)) L/min/m\u{00B2}"
}
func calSystemicVascularResistance(mapValue: Float, cvp: Float, cardiacOutput: Float)-> String{
    let vascularResistance = ((mapValue - cvp)/cardiacOutput) * 80
    return "\(String(format: "%.0f", vascularResistance)) Dynes-sec/cm\u{2075}"
}
func calPulmonaryVascularResistance(mpap: Float, pcwp: Float, cardiacOutput: Float) -> String{
    let vascularResistance = ((mpap - pcwp) / cardiacOutput) * 80
    return "\(String(format: "%.0f", vascularResistance)) Dynes-sec/cm\u{2075}"
}
func calOxygenContentArterial(hgb: Float, sao2: Float, pao2: Float) -> String{
    let resultArterialOC = (hgb * 1.34 * (sao2 / 100)) + (pao2 * 0.003)
    return "\(String(format: "%.0f", resultArterialOC)) mL/dL"
}
func calOxygenDelivery(co: Float, cao2: Float) -> String{
    let resultDo2 = (co * cao2) * 10
    return "\(String(format: "%.0f", resultDo2)) mL/min"
}
func calOxygenContentVenous(hgb: Float, svo2: Float, pvo2: Float)-> String{
    let resultContent = (hgb * 1.34 * (svo2 / 100)) + (pvo2 * 0.003)
    return "\(String(format: "%.2f", resultContent)) mL/dL"
}
func calOxygenConsumption(co: Float, cao2cvo2: Float) -> String{
    let oxygenConsumption = (co * cao2cvo2) * 10
    return "\(String(format: "%.0f", oxygenConsumption)) mL/min"
}
func calSweepGas(currentPaco2: Float, sweepFlow: Float,desiredPaco2: Float ) -> String{
    let sweepGas = (currentPaco2 * sweepFlow) / desiredPaco2
    return "\(String(format: "%.1f", sweepGas)) L/min"
}
//func calBodySurfaceArea(weight: Double, height: Double) -> String {
//    let heightPower = pow(height, 0.725)
//    let weightPower = pow(weight, 0.425)
//    let resultBSA = 0.007184 * heightPower * weightPower
//    return String(format: "%.2f m²", resultBSA)
//}

//func calWeightBasedBodySurfaceArea(weight: Double) -> String {
//    let resultBSA = ((weight * 4) + 7) / (90 + weight)
//    return String(format: "%.2f m²", resultBSA)
//}
//
//func calOxygenIndex(fio2: Double, map: Double, pao2: Double) -> String {
//    let resultOxygenIndex = (fio2 * map / pao2) * 100
//    return String(format: "%.2f %%", resultOxygenIndex)
//}
//
//func calPaO2ByFiO2Ratio(fio2: Double, map: Double, pao2: Double) -> String {
//    let resultPaO2ByFiO2Ratio = (fio2 * map / pao2) * 100
//    return String(format: "%.0f", resultPaO2ByFiO2Ratio)
//}
//
//func calHeparinLoadingDose(weight: Double) -> [String] {
//    var result = [""]
////    let dosages = [25, 50, 75, 100, 200, 300, 400]
////    for dosage in dosages {
////        let dose = Double(dosage) * weight
////        result += "\(dosage)u/Kg = \(String(format: "%.1f", dose)) units\n"
////    }
//            let doses = [25, 50, 100, 200, 300, 400]
//            return doses.map { "\($0)u/Kg = \($0 * Int(weight)) units" }
//    return result
//}
//
//func calCardiacIndexCalculator(BSA: Double) -> String {
//    var result = ""
//    let cardiacIndexes = [1.0, 1.5, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0]
//    for index in cardiacIndexes {
//        let ci = index * BSA
//        result += "CI \(index) = \(String(format: "%.2f", ci)) L/min\n"
//    }
//    return result
//}
//
//func calEstimatedRedCellMass(weight: Double, hematocrit: Double) -> String {
//    let resultERCM = weight * hematocrit
//    return "\(Int(round(resultERCM)))"
//}
//
//func calDilutionalHCT(weight: Double, hematocrit: Double, eclsCircuit: Double) -> String {
//    let totalHCT = weight + eclsCircuit
//    let resultHCT = hematocrit / totalHCT
//    return String(format: "%.2f %%", resultHCT * 100)
//}
//
//func calCardiacOutput(heartRate: Double, strokeVolume: Double) -> String {
//    let resultCardiacOutput = (heartRate * strokeVolume) / 1000
//    return String(format: "%.2f", resultCardiacOutput)
//}
//
//func calCardiacIndex(cardiacOutput: Double, bsa: Double) -> String {
//    let resultCardiacIndex = cardiacOutput / bsa
//    return String(format: "%.2f", resultCardiacIndex)
//}
//
//func calSystemicVascularResistance(map: Double, cvp: Double, co: Double) -> String {
//    let resultSVR = 80 * (map - cvp) / co
//    return String(format: "%.2f", resultSVR)
//}
//
//func calPulmonaryVascularResistance(mpap: Double, pcwp: Double, co: Double) -> String {
//    let resultPVR = 80 * (mpap - pcwp) / co
//    return String(format: "%.2f", resultPVR)
//}
//
//func calOxygenContentArterial(hemoglobin: Double, arterialOxygenSaturation: Double, partialPressureOfOxygen: Double) -> String {
//    let result = 1.34 * hemoglobin * arterialOxygenSaturation / 100 + 0.0031 * partialPressureOfOxygen
//    return String(format: "%.2f", result)
//}
//
//func calOxygenDelivery(cardiacOutput: Double, oxygenContentArterial: Double) -> String {
//    let result = cardiacOutput * oxygenContentArterial * 10
//    return String(format: "%.2f", result)
//}
//
//func calOxygenContentVenous(hemoglobin: Double, venousOxygenSaturation: Double, partialPressureOfOxygen: Double) -> String {
//    let result = 1.34 * hemoglobin * venousOxygenSaturation / 100 + 0.0031 * partialPressureOfOxygen
//    return String(format: "%.2f", result)
//}
//
//func calOxygenConsumption(cardiacOutput: Double, oxygenContentArterial: Double, oxygenContentVenous: Double) -> String {
//    let result = cardiacOutput * (oxygenContentArterial - oxygenContentVenous) * 10
//    return String(format: "%.2f", result)
//}
//
//func calSweepGas(currentPatientArterial: Double, currentSweepGasFlowRate: Double, desiredPatientArterial: Double) -> String {
//    let result = currentSweepGasFlowRate * (desiredPatientArterial / currentPatientArterial)
//    return String(format: "%.2f", result)
//}


//struct CalculatorViewOne: View {
//    
//    @State private var centimetersInput: String = ""
//    @State private var weightInput: String = ""
//    @State private var heightInput: String = ""
//    @State private var fio2Input: String = ""
//    @State private var mapInput: String = ""
//    @State private var pao2Input: String = ""
//    @State private var hemoglobinInput: String = ""
//    @State private var arterialOxygenSaturationInput: String = ""
//    @State private var partialPressureOfOxygenInput: String = ""
//    @State private var heartRateInput: String = ""
//    @State private var strokeVolumeInput: String = ""
//    @State private var bsaInput: String = ""
//    @State private var blank: String = ""
//    
//    @State private var centimetersToInchesResult: String = ""
//    @State private var bodySurfaceAreaResult: String = ""
//    @State private var weightBasedBodySurfaceAreaResult: String = ""
//    @State private var oxygenIndexResult: String = ""
//    @State private var paO2ByFiO2RatioResult: String = ""
//    @State private var showHeparinList: Bool = false
//    @State private var heparinLoadingDoseResult: [String] = [""]
//    @State private var cardiacIndexCalculatorResult: String = ""
//    @State private var estimatedRedCellMassResult: String = ""
//    @State private var dilutionalHCTResult: String = ""
//    @State private var cardiacOutputResult: String = ""
//    @State private var cardiacIndexResult: String = ""
//    @State private var systemicVascularResistanceResult: String = ""
//    @State private var pulmonaryVascularResistanceResult: String = ""
//    @State private var oxygenContentArterialResult: String = ""
//    @State private var oxygenDeliveryResult: String = ""
//    @State private var oxygenContentVenousResult: String = ""
//    @State private var oxygenConsumptionResult: String = ""
//    @State private var sweepGasResult: String = ""
//    
//    @State var textValue = String()
//    @State var resultString: String = ""
//    var body: some View {
//        VStack(spacing: 0) {
//            VStack{
//                Text("Clinical Calculator")
//                    .font(.largeTitle)
//                    .foregroundStyle(.titleLabel)
//                    .padding(.top, 10) // Add some padding at the top if needed
//                    .padding(.bottom, 10)
//                ScrollView {
//                    VStack(spacing: 5){
//                        //Ponds to Kilogram
//                        ListItemView(titleLabel: "Pounds to Kilogram", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $centimetersInput, textValue2: $blank, textValue3: $blank)
//                            .padding(.horizontal, 30)
//                            .onChange(of: centimetersInput) { _ in
//                                if let cm = Float(centimetersInput) {
//                                    centimetersToInchesResult = calCentimetersToInches(centimeters: cm)
//                                } else {
//                                    centimetersToInchesResult = "Invalid input"
//                                }
//                            }
//                        ResultText(result: centimetersToInchesResult)
//                            .padding(.horizontal, 30)
//                        //Kilogram to Pounds
//                        ListItemView(titleLabel: "Kilogram to Pounds", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $weightInput, textValue2: $blank, textValue3: $blank)
//                            .padding(.horizontal, 30)
//                        ResultText(result: "70.5")
//                            .padding(.horizontal, 30)
//                        
//                        //Inches To Centimetres
//                        ListItemView(titleLabel: "Inches To Centimetres", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $weightInput, textValue2: $blank, textValue3: $blank)
//                            .padding(.horizontal, 30)
//                            .padding(.bottom, 20)
//                            .onChange(of: weightInput) { _ in
//                                if let weight = Double(weightInput) {
//                                    heparinLoadingDoseResult = calHeparinLoadingDose(weight: weight)
//                                    withAnimation(.linear(duration: 0.4)) {
//                                        showHeparinList = true
//                                    }
//                                } else {
//                                    withAnimation(.linear(duration: 0.3)){
//                                        heparinLoadingDoseResult = ["Invalid input"]
//                                        showHeparinList = false
//                                    }
//
//                                }
//                            }
//                        if showHeparinList {
//                            withAnimation{
//                                ResultList(result: heparinLoadingDoseResult)
//                                    .padding(.horizontal, 30)
//                                    .padding(.vertical, 20)
//                            }
//                            
//                        }
//                        //Centimetres To Inches
//                        ListItemView(titleLabel: "Centimetres To Inches", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $textValue, textValue2: $blank, textValue3: $blank)
//                            .padding(.horizontal, 30)
//                        ResultText(result: "70.5")
//                            .padding(.horizontal, 30)
//                        
//                        //Body Surface Area
//                        ListItemView(titleLabel: "Body Surface Area", subTitleLabel: "Height", subTitleLabel2: "weight", subTitleLabel3: "weight", placeHolderlabel: "cm", placeHolderlabel2: "kg", placeHolderlabel3: "kg", textValue: $fio2Input, textValue2:$mapInput, textValue3:$pao2Input, numberOfField: 3)
//                            .padding(.horizontal, 30)
//                            .onChange(of: pao2Input) { _ in
//                                if let fio2 = Double(fio2Input), let map = Double(mapInput), let pao2 = Double(pao2Input) {
//                                    oxygenIndexResult = calOxygenIndex(fio2: fio2, map: map, pao2: pao2)
//                                } else {
//                                    oxygenIndexResult = "Invalid input"
//                                }
//                            }
//                        ResultText(result: oxygenIndexResult)
//                            .padding(.horizontal, 30)
//                    }
//                }
//                
//            }
//        }
//    }
//}
