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
                        .font(.largeTitle)
                        .padding(.top, 5)
                        .padding(.bottom, 15)
                    VStack{
                        Text(model.entryType.isEmpty ? "Enter Weight" : model.entryType)
                            .font(.system(size: 12,weight: .semibold))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                            .padding(.leading, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack(spacing: 0) {
                        GeometryReader { geometry in
                        HStack(spacing: 5) {
                            // Weight Input
                            VStack{
                                Text("Weight")
                                    .font(.system(size: 12))
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
                                        print("changing weight")
                                        model.calculateTargetBloodFlow()
                                    
                                    }
                            }
    
    
                            if model.isHeightVisible {
                                // Height Input (Visible only if weight > 15)
                                VStack{
                                    Text("Height")
                                        .font(.system(size: 12))
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
                                        .font(.system(size: 12))
                                        .foregroundStyle(.tealBlue)
                                        .padding(.leading, 5)
                                        .frame(width: model.isHeightVisible ? (geometry.size.width - 10) / 3 : (geometry.size.width - 10) / 2, height: 20, alignment: .leading)
                                    Menu {
                                        if !model.isHeightVisible {
                                            Text("TargetBF")
                                            ForEach(model.bloodFlowOptions, id: \.self) { option in
                                                Button("\(option)") {
                                                    model.selectedBloodFlow = option
                                                    model.highlightBloodFlow(selectedValue: option)
                                                    model.isCannulaListVisible = true
                                                }.multilineTextAlignment(.center)
                                            }
                                        }else{
                                            ForEach(model.CIFlowOptions, id: \.self) { option in
                                                Button("\(String(format: "%.1f", option))") {
                                                    model.selectedCI = Float(option)
//                                                    model.highlightAdultBloodFlow(selectedValue: option)
                                                    model.isCannulaListVisible = true
                                                }
                                            }
                                        }
    
                                    } label: {
                                        if !model.isHeightVisible {
                                            Text(model.selectedBloodFlow == nil ? "Select" : "\(model.selectedBloodFlow!)")
                                                .font(.system(size: 12))
                                                .multilineTextAlignment(.leading)
                                                .padding(.trailing, 60)
                                                .frame(alignment: .leading)
    
                                        }else{
                                            Text(model.selectedCI == nil ? "Select" : "\(String(format: "%.1f", model.selectedCI!))")
                                                .font(.system(size: 12))
                                                .padding(.trailing, 20)
    
                                        }
                                        Image(systemName: "chevron.down")
                                            .padding(.leading, 10)
                                            .frame(alignment: .trailing)
                                    }
                                    .frame(width: model.isHeightVisible ? (geometry.size.width - 10) / 3 : (geometry.size.width - 10) / 2, height: 50)
                                    .menuStyle(.borderlessButton)
                                    .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(model.selectedCI == nil ? Color.gray : Color.blue, lineWidth: 1))
    
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        }.padding(.bottom, 65)
    
                            ResultText(result: model.bsaResult)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 5)
                        VStack {
                            if model.isBloodFlowVisible {
                                // Display Blood Flow Results
                                VStack{
                                    Text("10Kg and Greater Target Blood Flow")
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
                                        Text("10Kg and Greater Target Blood Flow")
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
//                                        ForEach(Array(model.CIFlowOptions.enumerated()), id: \.element) { index, item in
//                                            let (cardiacOutput, tbf) = model.calculateAdultTargetBloodFlow(option: item)
//                                            Text("\(String(format: "%.1f", option)) C.I. = \(String(format: "%.2f", cardiacOutput)) L/min = \(String(format: "%.2f", tbf)) ml/kg/min")
//                                                .font(.caption)
//                                                .foregroundColor(item == model.selectedCI ? .tealBlue : .textFieldText)
//                                                .frame(maxWidth: .infinity, alignment: .leading)
//                                            if index < model.CIFlowOptions.count - 1 {
//                                                Divider()
//                                            }
//                                        }.padding(.vertical,7)
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
    
                                ForEach(Array(model.CIFlowOptions.enumerated()), id: \.element) { index, option in
                                    HStack(spacing: 5){
                                        Text("Bio-Medicus")
                                            .font(.caption).multilineTextAlignment(.leading)
                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Arterial 15Fr")
                                            .font(.caption).multilineTextAlignment(.trailing)
                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
    
                                    if index < model.CIFlowOptions.count - 1 {
                                        Divider()
                                    }
                                }
                                .padding(.vertical, 7)
    
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
    
                                ForEach(Array(model.CIFlowOptions.enumerated()), id: \.element) { index, option in
                                    HStack(spacing: 5){
                                        Text("Gentige")
                                            .font(.caption).multilineTextAlignment(.leading)
                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Arterial 15Fr")
                                            .font(.caption).multilineTextAlignment(.trailing)
                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
    
                                    if index < model.CIFlowOptions.count - 1 {
                                        Divider()
                                    }
                                }
                                .padding(.vertical, 7)
    
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
    
                                ForEach(Array(model.CIFlowOptions.enumerated()), id: \.element) { index, option in
                                    HStack(spacing: 5){
                                        Text("VVDL")
                                            .font(.caption).multilineTextAlignment(.leading)
                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Arterial 15Fr")
                                            .font(.caption).multilineTextAlignment(.trailing)
                                            .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
    
                                    if index < model.CIFlowOptions.count - 1 {
                                        Divider()
                                    }
                                }
                                .padding(.vertical, 7)
    
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

    
//    private func handleWeightChange(_ newValue: String, heightValue: String = "") {
//        guard let weightValue = Double(newValue) else {
//            isHeightVisible = false
//            isBloodFlowVisible = false
//            isCIVisible = false
//            isCannulaListVisible = false
//            return
//        }
//        
//        if weightValue <= 15 {//Pediatric
//            isHeightVisible = false
//            isDropDownVisible = true
//            isBloodFlowVisible = true
//            isCIVisible = false
//            selectedBloodFlow = nil
//        } else {//Adult
//            isHeightVisible = true
//            isDropDownVisible = true
//            isBloodFlowVisible = false
//            selectedCI = nil
//            
//            
//        }
//    }
    
    //    private func handleHeightChange(_ newValue: String) {
    //        // Logic to handle height change, if required
    //    }
    
//    private func calculateFlowRate(for option: Int) -> String {
//        // Implement the logic to calculate the flow rate based on the selected blood flow
//        return String(format: "%.2f", Double(option) / 1000.0)
//    }
//    
//
//    
//    private func calculateCIOptions() -> [Double] {
//        // Implement the logic to calculate the cardiac index options based on weight and height
//        return [0.5, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.4] // Example options
//    }
    
//    func calAdultTargetBloodFlow(weight: Float, bsa: Float,targetCI: Float) -> String{
    
    


#Preview {
    CannulaView()
}

func calTargetBloodFlow(weight: Float, option: Float) -> String {
    // Implement the logic to calculate the flow rate based on the selected cardiac index
    let bloodFlow = (weight * option)/1000
    let result = "\(Int(option)) ml/kg : \(String(format: "%.2f", bloodFlow)) L/min"
    return  result// Placeholder calculation
}

func cannulaWeightBsa(weight: Float,height: Float)-> String{
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsa = 0.007184 * weightPower * heightPower
    return "BSA \(String(format: "%.3f", bsa))  m\u{00B2}"
}

func calAdultTargetBloodFlow(weight: Float, height: Float, targetCI: Float)->(Float, Float){
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsa = 0.007184 * weightPower * heightPower
    
    let cardiacOutput = targetCI * bsa
    
    let targetBloodFlow = (cardiacOutput * 1000)/weight
    
//    let result = "\(String(format: "%.1f", targetCI)) C.I. = \(String(format: "%.2f", cardiacOutput)) L/min = \(String(format: "%.2f", target)) ml/kg/min"
    return (cardiacOutput, targetBloodFlow)
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
 
