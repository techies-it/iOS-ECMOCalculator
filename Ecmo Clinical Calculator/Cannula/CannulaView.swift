//
//  CannulaView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct CannulaView: View {
   
    @StateObject private var model = CannulaModel()
    
    
        var body: some View {
            VStack(spacing: 0) {
                ScrollView{
                    Text("Cannula Selection")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(.titleLabel)
                        .padding(.top, 5)
                        .padding(.bottom, 15)
                    VStack{
                        Text(model.entryType.isEmpty ? "Enter Weight" : model.entryType)
                            .font(.system(size: 13, weight: .medium))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                            .padding(.leading, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack(spacing: 0) {
                        GeometryReader { geometry in
                        HStack(spacing: 4) {
                            // Weight Input
                            VStack{
                                Text("Weight")
                                    .font(.system(size: 11))
                                    .foregroundStyle(.tealBlue)
                                    .padding(.leading, 5)
                                    .frame(width: (geometry.size.width - 10) / 3, height: 20, alignment: .leading)
                                TextField("kg", text: $model.weightInputCannula)
                                    .font(.system(size: 13))
                                    .keyboardType(.decimalPad)
                                    .foregroundStyle(.textFieldText)
                                    .padding(.horizontal, 15)
                                    .frame(width: (geometry.size.width - 10) / 3, height: 50)         .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(model.weightInputCannula.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1))
                                    .background(.textFieldBackground)
                                    .onChange(of: model.weightInputCannula) { newValue in
                                        if let _ = newValue.firstIndex(of: "."),
                                           newValue.components(separatedBy: ".").count - 1 > 1 {
                                            model.weightInputCannula = String(newValue.dropLast())
                                        }
                                        model.handleWeightChange()
                                        model.calculateTargetBloodFlow()
                                    
                                    }
                            }
    
    
                            if model.isHeightVisible {
                                // Height Input (Visible only if weight > 15)
                                VStack{
                                    Text("Height")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.tealBlue)
                                        .padding(.leading, 5)
                                        .frame(width: (geometry.size.width - 10) / 3, height: 20, alignment: .leading)
                                    TextField("Height (cm)", text: $model.heightInputCannula)
                                        .font(.system(size: 13))
                                        .foregroundStyle(.textFieldText)
                                        .keyboardType(.decimalPad)
                                        .padding(.horizontal, 15)
                                        .frame(width: (geometry.size.width - 10) / 3, height: 50) .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(model.heightInputCannula.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1))
                                        .background(.textFieldBackground)
    
                                        .onChange(of: model.heightInputCannula) { newValue in
                                            if let _ = newValue.firstIndex(of: "."),
                                               newValue.components(separatedBy: ".").count - 1 > 1 {
                                                model.heightInputCannula = String(newValue.dropLast())
                                            }
                                            model.handleHeightChange()
                                            //calculate BSA
    //                                        model.calculateWeightBasedBodySurfaceArea()
                                            // calculate target blood flow - shifting call of this function to above function -
    
                                        }
    
                                }
    
    
                            }
    
                            if model.isDropDownVisible {
                                // Blood Flow Dropdown
                                VStack{
    
                                    Text(model.targetType)
                                        .font(.system(size: 11,weight: .regular))
                                        .foregroundStyle(.tealBlue)
                                        .padding(.leading, 5)
                                        .frame(width: model.isHeightVisible ? (geometry.size.width - 10) / 3 : (geometry.size.width - 10) / 2, height: 20, alignment: .leading)
                                    Menu {
                                        if !model.isHeightVisible {
                                            Text("Target Blood Flow (ml/kg/min)")
                                                .font(.system(size: 16))
                                                .foregroundStyle(.tealBlue)
                                                .multilineTextAlignment(.center)
                                            ForEach(model.bloodFlowOptions, id: \.self) { option in
                                                Button("\(option)") {
                                                    model.selectedBloodFlow = option
                                                    model.highlightBloodFlow(selectedValue: option)
                                                    model.isCannulaListVisible = true
                                                }.multilineTextAlignment(.center)
                                            }
                                        }else{
                                            Text("Target C.I.")
                                                .font(.system(size: 16))
                                                .foregroundStyle(.tealBlue)
                                                .multilineTextAlignment(.center)
                                            ForEach(model.CIFlowOptions, id: \.self) { option in
                                                Button("\(String(format: "%.1f", option))") {
                                                    model.selectedCI = Float(option)
                                                    model.adultFrs()
                                                    model.isCannulaListVisible = true
                                                }
                                            }
                                        }
    
                                    } label: {
                                        if !model.isHeightVisible {
                                            Text(model.selectedBloodFlow == nil ? "Select" : "\(model.selectedBloodFlow!)")
                                                .font(.system(size: 13))
                                                .foregroundStyle(.tealBlue)
                                                .multilineTextAlignment(.leading)
                                                .padding(.trailing, 60)
                                                .frame(alignment: .leading)
                                            
                                        }else{
                                            Text(model.selectedCI == nil ? "Select" : "\(String(format: "%.1f", model.selectedCI!))")
                                                .font(.system(size: 13))
                                                .foregroundStyle(.tealBlue)
                                                .padding(.trailing, 20)
                                            
                                        }
                                        Image(systemName: "chevron.down")
                                            .padding(.leading, 10)
                                            .frame(alignment: .trailing)
                                            .foregroundStyle(.tealBlue)
                                    }
                                    .frame(width: model.isHeightVisible ? (geometry.size.width - 10) / 3 : (geometry.size.width) / 2, height: 50)
                                    .menuStyle(.borderlessButton)
                                    .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(model.selectedCI == nil ? Color.gray : Color.blue, lineWidth: 1))
    
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 1)
                        }.padding(.bottom, 65)
    
                            ResultText(result: model.bsaResult)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 5)
                        VStack {
                            if model.isBloodFlowVisible {
                                // Display Blood Flow Results
                                VStack{
                                    Text("0-15Kg Target Blood Flow")
                                        .foregroundStyle(.black)
                                        .font(.subheadline).multilineTextAlignment(.leading)
    
                                }
                                .padding(.bottom, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 10)
                                VStack(spacing: 0){
    
                                    ForEach(Array(model.resultTargetBloodFlowArray.enumerated()), id: \.element) { index, item in
                                        Text("\(item)")
                                            .font(.caption)
                                            .foregroundColor(index == model.resultHighlightBloodFlow ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        if index < model.bloodFlowOptions.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
    
                                }.padding(.horizontal, 20)
                                    .background(.textFieldBackground)
                                    .border(.textFieldBorder, width: 0.5).cornerRadius(10, corners: .allCorners)
                                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                                    .transition(.opacity)
                            }
    
                            if model.isCIVisible {
                                // Display Blood Flow Results
                                Group{
                                    VStack{
                                        Text("15Kg and Greater Target Blood Flow")
                                            .foregroundStyle(.black)
                                            .font(.subheadline).multilineTextAlignment(.leading)
        
                                    }
                                    .padding(.bottom, 10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                                    VStack(spacing: 0){
                                    
                                        ForEach(Array(model.CIFlowOptions.enumerated()), id: \.element) { index, option in
                                            let (cI,tbf) = targetBloodFlowValue(weight: Float(model.weightInputCannula) ?? 0.0, height: Float(model.heightInputCannula) ?? 0.0, cIValues: option)
                                            Text("\(String(format: "%.1f", option)) C.I. = \(String(format: "%.2f", cI)) L/min = \(String(format: "%.2f", tbf)) ml/kg/min")
                                                .font(.caption)
                                                .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            if index < model.CIFlowOptions.count - 1 {
                                                Divider()
                                            }
                                        }.padding(.vertical,7)

                                    }.padding(.horizontal, 30)
                                        .background(.textFieldBackground)
                                        .border(.textFieldBorder, width: 0.5).cornerRadius(10, corners: .allCorners)
                                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                                        .transition(.opacity)

                                }
                            }
    
                        }
                        if model.isCannulaListVisible {
                            // VA Neck Group
                            Group {
                            VStack{
                                Text("VA Neck")
                                    .foregroundStyle(.tealBlue)
                                    .font(.headline).multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                                Text("Calculated at: ≤ 100mmHg Pressure Drop")
                                    .foregroundStyle(.red)
                                    .font(.subheadline).multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                            }
                            .padding(.top, 25)
                            .padding(.bottom, 10)
                                
                            VStack(spacing: 0){
                                if !model.isCIVisible{
                                    ForEach(Array(model.pediatricVANeckArray.enumerated()), id: \.element) { index, item in
                                        HStack(spacing: 5){
                                            Text("\(item)")
                                                .font(.caption).multilineTextAlignment(.leading)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(model.pediatricVANeckDictionary[item]!)")
                                                .font(.caption).multilineTextAlignment(.trailing)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
        
                                        if index < model.pediatricVANeckDictionary.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
                                   
                                }
                                else{
                                    ForEach(Array(model.adultVANeckArray.enumerated()), id: \.element) { index, element in
                                        HStack(spacing: 5){
                                            Text("\(element)")
                                                .font(.caption).multilineTextAlignment(.leading)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(model.adultVANeckDictionary[element]!)")
                                                .font(.caption).multilineTextAlignment(.trailing)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
        
                                        if index < model.adultVANeckDictionary.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
                                }
                                
    
                            }.padding(.horizontal, 30)
                                .background(.textFieldBackground)
                                .border(.textFieldBorder, width: 0.5).cornerRadius(10, corners: .allCorners)
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                                .transition(.opacity)
    
                        }
    
                        //VA Groin Group
                        Group {
                            VStack{
                                Text("VA Groin")
                                    .foregroundStyle(.tealBlue)
                                    .font(.headline).multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                                Text("Calculated at: ≤ 100mmHg Pressure Drop")
                                    .foregroundStyle(.red)
                                    .font(.subheadline).multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                            }
    
                            .padding(.top, 25)
                            .padding(.bottom, 10)
    
                            VStack(spacing: 0){
                                if !model.isCIVisible{
                                    ForEach(Array(model.pediatricVAGroinArray.enumerated()), id: \.element) { index, element in
                                        HStack(spacing: 5){
                                            Text("\(element)")
                                                .font(.caption).multilineTextAlignment(.leading)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(model.pediatricVAGroinDictionary[element]!)")
                                                .font(.caption).multilineTextAlignment(.trailing)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
        
                                        if index < model.pediatricVAGroinDictionary.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
                                }
                                else{
                                    ForEach(Array(model.adultVAGroinArray.enumerated()), id: \.element) { index, element in
                                        HStack(spacing: 5){
                                            Text("\(element)")
                                                .font(.caption).multilineTextAlignment(.leading)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(model.adultVAGroinDictionary[element]!)")
                                                .font(.caption).multilineTextAlignment(.trailing)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
        
                                        if index < model.adultVAGroinDictionary.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
                                }
                                
    
                            }.padding(.horizontal, 30)
                                .background(.textFieldBackground)
                                .border(.textFieldBorder, width: 0.5).cornerRadius(10, corners: .allCorners)
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                                .transition(.opacity)
    
                        }
                        //VVDL Group
                        Group {
                            VStack{
                                Text("VVDL")
                                    .foregroundStyle(.tealBlue)
                                    .font(.headline).multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                                Text("Calculated at: ≤ 100mmHg Pressure Drop")
                                    .foregroundStyle(.red)
                                    .font(.subheadline).multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 10)
                            }
    
                            .padding(.top, 25)
                            .padding(.bottom, 10)
    
                            VStack(spacing: 0){
                                if !model.isCIVisible{
                                    ForEach(Array(model.pediatricVVDLArray.enumerated()), id: \.element) { index, element in
                                        HStack(spacing: 5){
                                            Text("\(element)")
                                                .font(.caption).multilineTextAlignment(.leading)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(model.pediatricVVDLDictionary[element]!)")
                                                .font(.caption).multilineTextAlignment(.trailing)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
        
                                        if index < model.pediatricVVDLDictionary.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
                                }
                                else{
                                    ForEach(Array(model.adultVVDLArray.enumerated()), id: \.element) { index, element in
                                        HStack(spacing: 5){
                                            Text("\(element)")
                                                .font(.caption).multilineTextAlignment(.leading)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("\(model.adultVVDLDictionary[element]!)")
                                                .font(.caption).multilineTextAlignment(.trailing)
    //                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
        
                                        if index < model.adultVVDLDictionary.count - 1 {
                                            Divider()
                                        }
                                    }
                                    .padding(.vertical, 7)
                                }
    
                            }.padding(.horizontal, 30)
                                .background(.textFieldBackground)
                                .border(.textFieldBorder, width: 0.5).cornerRadius(10, corners: .allCorners)
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                                .transition(.opacity)
    
                        }
                        Spacer()
                    }
                    }
                }
    
    
    
            }
            .padding()
        }

}

#Preview {
    CannulaView()
}

func calTargetBloodFlow(weight: Float, option: Float) -> (String, Float) {
    // Implement the logic to calculate the flow rate based on the selected cardiac index
    let bloodFlow = (weight * option)/1000
    let result = "\(Int(option)) ml/kg : \(String(format: "%.2f", bloodFlow)) L/min"
    return  (result, bloodFlow)// Placeholder calculation
}

func cannulaWeightBsa(weight: Float,height: Float)-> (Float,String){
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsa = 0.007184 * weightPower * heightPower
    let bsaValue = (bsa * 1000)/1000.0
    let bsaString = "BSA \(String(format: "%.3f", bsa))  m\u{00B2}"
    return (bsaValue, bsaString)
}

func targetBloodFlowValue(weight: Float,height: Float,cIValues: Float) -> (Float, Float){
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsaValue = 0.007184 * weightPower * heightPower
    
    let centerValue = cIValues * bsaValue
    print("center value is \(centerValue)")
    let targetBloodFlow = (centerValue * 1000)/weight
    print("targetBloodFlow is \(targetBloodFlow)")
    return (centerValue, targetBloodFlow)
}
 

//pediatric

func vaNeckArterialCannulae(pediatricBloodFlow: Float) -> (String,String){
    var calculatedFr = ""
    
    switch pediatricBloodFlow{
    case 0...0.625:
        calculatedFr = "8Fr"
    case 0.626...1.25:
        calculatedFr = "10Fr"
    case 1.251...2.062:
        calculatedFr = "12Fr"
    case 2.063...2.5:
        calculatedFr = "14Fr"
    default:
        calculatedFr = "NA"
    }
    
    calculatedFr = "Arterial " + calculatedFr
    let title = "Bio-Medicus NextGen Pediatric Arterial"
    return (title,calculatedFr)
}


func vaNeckVenousCannulae(pediatricBloodFlow: Float) -> (String, String){
    var calculatedVenousFr = ""
    
    switch pediatricBloodFlow{
    case 0...0.75:
        calculatedVenousFr = "8Fr"
    case 0.751...1.375:
        calculatedVenousFr = "10Fr"
    case 1.376...2.187:
        calculatedVenousFr = "12Fr"
    case 2.188...2.8:
        calculatedVenousFr = "14Fr"
    default:
        calculatedVenousFr = "NA"
    }
    calculatedVenousFr = "Venous " + calculatedVenousFr
    let title = "Bio-Medicus NextGen Pediatric Venous"
    return (title,calculatedVenousFr)
}

func vaGroinArterialCannulae(pediatricBloodFlow: Float) -> (String, String){
    var calculatedFr = ""
    
    switch pediatricBloodFlow{
    case 0...0.625:
        calculatedFr = "8Fr"
    case 0.626...1.25:
        calculatedFr = "10Fr"
    case 1.251...2.062:
        calculatedFr = "12Fr"
    case 2.063...2.5:
        calculatedFr = "14Fr"
    default:
        calculatedFr = "NA"
    }

    calculatedFr = "Arterial " + calculatedFr
    let title = "Bio-Medicus NextGen Pediatric Arterial"

    return (title,calculatedFr)
}

func vaGroinVenousCannulae(pediatricBloodFlow: Float) -> (String, String){
    var calculatedVenousFr = ""
    
    switch pediatricBloodFlow{
    case 0...0.75:
        calculatedVenousFr = "8Fr"
    case 0.751...1.375:
        calculatedVenousFr = "10Fr"
    case 1.376...2.187:
        calculatedVenousFr = "12Fr"
    case 2.188...2.8:
        calculatedVenousFr = "14Fr"
    default:
        calculatedVenousFr = "NA"
    }

    calculatedVenousFr = "Venous " + calculatedVenousFr
    let title = "Bio-Medicus NextGen Pediatric Venous"
    return (title,calculatedVenousFr)
}

func vvdlDualLumenCatheter(pediatricBloodFlow: Float) -> (String, String){
    var calculatedLumenCatheter = ""
        //pediatric
    
    switch pediatricBloodFlow{
    case 0...0.625:
        calculatedLumenCatheter = "13Fr"
    case 0.626...0.9:
        calculatedLumenCatheter = "16Fr"
    case 0.901...1.58:
        calculatedLumenCatheter = "19Fr"
    default:
        calculatedLumenCatheter = "NA"
    }
    calculatedLumenCatheter = "IJV " + calculatedLumenCatheter
    let title = "Avalon Elite Bi-Caval Dual Lumen Catheter"
    return (title, calculatedLumenCatheter)
}



func vvdlCrescentdualECLSCannula(pediatricBloodFlow: Float) -> (String, String){
    var calculatedEclsCannula = ""
        //pediatric
    
    switch pediatricBloodFlow{
    case 0...0.625:
        calculatedEclsCannula = "13Fr"
    case 0.626...0.9:
        calculatedEclsCannula = "15Fr"
    case 0.901...1.58:
        calculatedEclsCannula = "19Fr"
    default:
        calculatedEclsCannula = "NA"
    }
    calculatedEclsCannula = "IJV " + calculatedEclsCannula
    let title = "Crescent Dual Lumen VV ECLS Cannula"

    return (title,calculatedEclsCannula)
}

// Adult
// VA Neck

func vaNeckFemoralArterialCannula(bsa: Float)->(String, String){  //use this for VA Groin Femoral Arterial Cannula
    var calculatedVaNeckFemoralArterialCannula = ""
    let title = "Bio-Medicus NextGen Femoral Arterial or Jugular Arterial Cannula"
    
    switch bsa{
    case 0...3.1:
        calculatedVaNeckFemoralArterialCannula = "15Fr"
    case 3.101...4.1:
        calculatedVaNeckFemoralArterialCannula = "17Fr"
    case 4.101...5.5:
        calculatedVaNeckFemoralArterialCannula = "19Fr"
    case 5.501...6.5:
        calculatedVaNeckFemoralArterialCannula = "21Fr"
    case 6.5...7:
        calculatedVaNeckFemoralArterialCannula = "23Fr"
    case 6.5...7.5:
        calculatedVaNeckFemoralArterialCannula = "25Fr"
    default:
        calculatedVaNeckFemoralArterialCannula = "NA"
    }
    calculatedVaNeckFemoralArterialCannula = "Arterial " + calculatedVaNeckFemoralArterialCannula
    return (title,calculatedVaNeckFemoralArterialCannula)
}

func vaNeckFemoralVenousCannula(bsa: Float)->(String, String){  // use this for VA groin Femoral venous cannula also
    var calculatedVaNeckFemoralArterialCannula = ""
    let title = "Bio-Medicus NextGen Femoral Venous Cannulae"
    
    switch bsa{
    case 0...2.3:
        calculatedVaNeckFemoralArterialCannula = "15Fr"
    case 2.301...3.2:
        calculatedVaNeckFemoralArterialCannula = "17Fr"
    case 3.201...4.35:
        calculatedVaNeckFemoralArterialCannula = "19Fr"
    case 4.351...5.7:
        calculatedVaNeckFemoralArterialCannula = "21Fr"
    case 6...6.5:
        calculatedVaNeckFemoralArterialCannula = "23Fr"
    case 6...7:
        calculatedVaNeckFemoralArterialCannula = "25Fr"
    case 6...7.25:
        calculatedVaNeckFemoralArterialCannula = "27Fr"
    case 6...7.5:
        calculatedVaNeckFemoralArterialCannula = "29Fr"
    default:
        calculatedVaNeckFemoralArterialCannula = "NA"
    }
    calculatedVaNeckFemoralArterialCannula = "Venous " + calculatedVaNeckFemoralArterialCannula
    return (title, calculatedVaNeckFemoralArterialCannula)
}

func arterialHLSCannula15(bsa: Float)-> (String, String){
    var arterialHlsCannula15 = ""
    
    switch bsa{
    case 0...2.125:
        arterialHlsCannula15 = "13Fr"
    case 2.126...2.8:
        arterialHlsCannula15 = "15Fr"
    case 2.81...4:
        arterialHlsCannula15 = "17Fr"
    case 4.01...5.125:
        arterialHlsCannula15 = "19Fr"
    case 5.126...6.375:
        arterialHlsCannula15 = "21Fr"
    case 6.376...7:
        arterialHlsCannula15 = "23Fr"
    default:
        arterialHlsCannula15 = "NA"
    }
    let title = "Getinge Arterial HLS Cannula (15cm)"
    arterialHlsCannula15 = "Arterial " + arterialHlsCannula15
    return (title, arterialHlsCannula15)
}

func arterialHLSCannula23(bsa: Float)-> (String, String){ // use same function for venous hls cannula 23cm
    var arterialHlsCannula23 = ""
    
    switch bsa{
    case 0...2.625:
        arterialHlsCannula23 = "15Fr"
    case 2.626...3.625:
        arterialHlsCannula23 = "17Fr"
    case 3.626...4.6:
        arterialHlsCannula23 = "19Fr"
    case 4.601...5.875:
        arterialHlsCannula23 = "21Fr"
    case 5.876...7:
        arterialHlsCannula23 = "23Fr"
    default:
        arterialHlsCannula23 = "NA"
    }
    let title = "Getinge Arterial HLS Cannula (23cm)"
    arterialHlsCannula23 = "Arterial " + arterialHlsCannula23
    return (title, arterialHlsCannula23)
}

func venousHLSCannula15(bsa: Float)-> (String, String){
    var venousHlsCannula15 = ""
    
    switch bsa{
    case 0...2.125:
        venousHlsCannula15 = "13Fr"
    case 2.126...2.8:
        venousHlsCannula15 = "15Fr"
    case 2.81...4:
        venousHlsCannula15 = "17Fr"
    case 4.01...5.125:
        venousHlsCannula15 = "19Fr"
    case 5.126...6.375:
        venousHlsCannula15 = "21Fr"
    case 6.376...7:
        venousHlsCannula15 = "23Fr"
    default:
        venousHlsCannula15 = "NA"
    }
    let title = "Getinge Venous HLS Cannula (15cm)"
    venousHlsCannula15 = "Venous " + venousHlsCannula15
    return (title, venousHlsCannula15)
}

func venousHLSCannula23(bsa: Float)-> (String, String){ // use same function for venous hls cannula 23cm
    var venousHlsCannula23 = ""
    
    switch bsa{
    case 0...2.625:
        venousHlsCannula23 = "15Fr"
    case 2.626...3.625:
        venousHlsCannula23 = "17Fr"
    case 3.626...4.6:
        venousHlsCannula23 = "19Fr"
    case 4.601...5.875:
        venousHlsCannula23 = "21Fr"
    case 5.876...7:
        venousHlsCannula23 = "23Fr"
    default:
        venousHlsCannula23 = "NA"
    }
    let title = "Getinge Venous HLS Cannula (23cm)"
    venousHlsCannula23 = "Venous " + venousHlsCannula23
    return (title, venousHlsCannula23)
}

// VA Groin - Adult
//Call both of these as it is
// vaNeckFemoralArterialCannula
//vaNeckFemoralVenousCannula()

func vaGroinMultiStageFemoralVenousCannulae(bsa: Float) -> (String, String){
    var multiStageVenousCannula = ""
    
    switch bsa{
    case 0...4.1:
        multiStageVenousCannula = "19Fr"
    case 4.101...5.375:
        multiStageVenousCannula = "21Fr"
    case 5.376...7:
        multiStageVenousCannula = "25Fr"
    default:
        multiStageVenousCannula = "NA"
    }
    multiStageVenousCannula = "Venous " + multiStageVenousCannula
    let title = "Bio-Medicus Multi-Stage Femoral Venous Cannulae"
    return (title, multiStageVenousCannula)
}

func vaGroinArterialHLSCannula15(bsa: Float)-> (String, String){
    var vaGroinHLSCannula15 = ""
    
    switch bsa{
    case 0...2.125:
        vaGroinHLSCannula15 = "13Fr"
    case 2.126...2.8:
        vaGroinHLSCannula15 = "15Fr"
    case 2.81...4:
        vaGroinHLSCannula15 = "17Fr"
    case 4.01...5.125:
        vaGroinHLSCannula15 = "19Fr"
    case 5.126...6.375:
        vaGroinHLSCannula15 = "21Fr"
    case 6.376...7:
        vaGroinHLSCannula15 = "23Fr"
    default:
        vaGroinHLSCannula15 = "NA"
    }
    vaGroinHLSCannula15 = "Arterial " + vaGroinHLSCannula15
    let title = "Getinge Arterial HLS Cannula"
    return (title, vaGroinHLSCannula15)
}

func vaGroinArterialHLSCannula23(bsa: Float)-> (String, String){
    var vaGroinHLSCannula23 = ""
    
    switch bsa{
    case 0...2.625:
        vaGroinHLSCannula23 = "15Fr"
    case 2.626...3.625:
        vaGroinHLSCannula23 = "17Fr"
    case 3.626...4.6:
        vaGroinHLSCannula23 = "19Fr"
    case 4.601...5.875:
        vaGroinHLSCannula23 = "21Fr"
    case 5.876...7:
        vaGroinHLSCannula23 = "23Fr"
    default:
        vaGroinHLSCannula23 = "NA"
    }
    vaGroinHLSCannula23 = "Arterial " + vaGroinHLSCannula23
    let title = "Getinge Arterial HLS Cannula (23cm)"
    return (title, vaGroinHLSCannula23)
}

func vaGroinVenousHLSCannula23(bsa: Float)-> (String, String){
    var vaGroinVenousHLSCannula23 = ""
    
    switch bsa{
    case 0...2.625:
        vaGroinVenousHLSCannula23 = "15Fr"
    case 2.626...3.625:
        vaGroinVenousHLSCannula23 = "17Fr"
    case 3.626...4.6:
        vaGroinVenousHLSCannula23 = "19Fr"
    case 4.601...5.875:
        vaGroinVenousHLSCannula23 = "21Fr"
    case 5.876...7:
        vaGroinVenousHLSCannula23 = "23Fr"
    default:
        vaGroinVenousHLSCannula23 = "NA"
    }
    vaGroinVenousHLSCannula23 = "Venous " + vaGroinVenousHLSCannula23
    let title = "Getinge Venous HLS Cannula (23cm)"
    return (title, vaGroinVenousHLSCannula23)
}

func vaGroinVenousHLSCannula38(bsa: Float)-> (String, String){
    var vaGroinHLSCannula38 = ""
    
    switch bsa{
    case 0...4.4:
        vaGroinHLSCannula38 = "19Fr"
    case 4.401...5.75:
        vaGroinHLSCannula38 = "21Fr"
    case 5.751...7:
        vaGroinHLSCannula38 = "23Fr"
    case 7.01...7.25:
        vaGroinHLSCannula38 = "25Fr"
    default:
        vaGroinHLSCannula38 = "NA"
    }
    vaGroinHLSCannula38 = "Venous " + vaGroinHLSCannula38
    let title = "Getinge Venous HLS Cannula (38cm)"
    return (title,vaGroinHLSCannula38)
}

func vaGroinVenousHLSCannula55(bsa: Float)-> (String,String){
    var vaGroinHLSCannula55 = ""
    
    switch bsa{
    case 0...5.3:
        vaGroinHLSCannula55 = "21Fr"
    case 5.301...6.6:
        vaGroinHLSCannula55 = "23Fr"
    case 6.601...7:
        vaGroinHLSCannula55 = "25Fr"
    case 7.01...7.25:
        vaGroinHLSCannula55 = "29Fr"
    default:
        vaGroinHLSCannula55 = "NA"
    }
    vaGroinHLSCannula55 = "Venous " + vaGroinHLSCannula55
    let title = "Getinge Venous HLS Cannula (55cm)"
    return (title, vaGroinHLSCannula55)
}

func vaGroinEdwardVenousCannula(bsa: Float)-> (String, String){
    var vaGroinEdwardVenousCannula = ""
    
    switch bsa{
    case 0...5:
        vaGroinEdwardVenousCannula = "22Fr"
    case 5.01...6.5:
        vaGroinEdwardVenousCannula = "25Fr"
    default:
        vaGroinEdwardVenousCannula = "NA"
    }
    vaGroinEdwardVenousCannula = "Venous " + vaGroinEdwardVenousCannula
    let title = "Edwards Quickdraw Venous Cannula"
    return (title,vaGroinEdwardVenousCannula)
}

// VVDL - Adult
func vvdlDualLumenCatheterAdult(bsa: Float) -> (String, String){
    var calculatedLumenCatheter = ""
        
    switch bsa{
    case 0...1.4:
        calculatedLumenCatheter = "20Fr"
    case 1.401...2.25:
        calculatedLumenCatheter = "23Fr"
    case 2.251...3.35:
        calculatedLumenCatheter = "27Fr"
    case 3.351...4.75:
        calculatedLumenCatheter = "31Fr"
    default:
        calculatedLumenCatheter = "NA"
    }
    calculatedLumenCatheter = "IJV " + calculatedLumenCatheter
    let title = "Avalon Elite Bi-Caval Dual Lumen Catheter"
    return (title, calculatedLumenCatheter)
}

func vvdlCresentLumenECLSCannula(bsa: Float) -> (String, String){
    var cresentECLSCatheter = ""
        
    switch bsa{
    case 0...2.7:
        cresentECLSCatheter = "24Fr"
    case 2.701...3.35:
        cresentECLSCatheter = "26Fr"
    case 3.351...4:
        cresentECLSCatheter = "28Fr"
    case 4.001...4.75:
        cresentECLSCatheter = "30Fr"
    case 4.751...5.6:
        cresentECLSCatheter = "32Fr"
    default:
        cresentECLSCatheter = "NA"
    }
    cresentECLSCatheter = "IJV " + cresentECLSCatheter
    let title = "Crescent Dual Lumen VV ECLS Cannula"

    return (title, cresentECLSCatheter)
}
