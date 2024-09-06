//
//  CannulaView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct CannulaView: View {
//    @State private var weight: String = ""
//    @State private var height: String = ""
//    @State private var selectedBloodFlow: Int?
//    @State private var selectedCI: Double?
    @State private var bloodFlowOptions = [100, 150, 175, 200, 250]
    @State private var CIFlowOptions: [Float] = [0.5, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4]
//    @State private var isHeightVisible: Bool = false
//    @State private var isDropDownVisible: Bool = false
//    @State private var isBloodFlowVisible: Bool = false
//    @State private var isCIVisible: Bool = false
//    @State private var isCannulaListVisible: Bool = false
    
    
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
                                        ForEach(bloodFlowOptions, id: \.self) { option in
                                            Button("\(option)") {
                                                model.selectedBloodFlow = option
                                                model.isCannulaListVisible = true
                                            }.multilineTextAlignment(.center)
                                        }
                                    }else{
                                        ForEach(CIFlowOptions, id: \.self) { option in
                                            Button("\(String(format: "%.1f", option))") {
                                                model.selectedCI = option
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
                                
                                ForEach(Array(bloodFlowOptions.enumerated()), id: \.element) { index, option in
                                    Text("\(option) ml/kg/min : \(calculateFlowRate(for: option)) L/min")
                                        .font(.caption)
                                        .foregroundColor(option == model.selectedBloodFlow ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    if index < bloodFlowOptions.count - 1 {
                                        Divider()
                                    }
                                }
                                .padding(.vertical, 7)
                                
                            }.padding(.horizontal, 20)
                                .background(.textFieldBackground)
                            //                            .cornerRadius(10)
                                .border(.textFieldBorder, width: 0.5).cornerRadius(10, corners: .allCorners)
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                                .transition(.opacity)
                        }
                        
                        if model.isCIVisible {
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
                                
                                ForEach(Array(CIFlowOptions.enumerated()), id: \.element) { index, option in
                                    Text("\(String(format: "%.1f", option)) C.I. = \(calculateFlowRate(for: option)) L/min = \(calculateFlowRate(for: option)) ml/kg/min")
                                        .font(.caption)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    if index < CIFlowOptions.count - 1 {
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
                            
                            ForEach(Array(CIFlowOptions.enumerated()), id: \.element) { index, option in
                                HStack(spacing: 5){
                                    Text("\(String(format: "%.1f", option)) C.I. = \(calculateFlowRate(for: option)) L/min = \(calculateFlowRate(for: option)) ml/kg/min")
                                        .font(.caption).multilineTextAlignment(.leading)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Arterial 15Fr")
                                        .font(.caption).multilineTextAlignment(.trailing)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                if index < CIFlowOptions.count - 1 {
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
                            
                            ForEach(Array(CIFlowOptions.enumerated()), id: \.element) { index, option in
                                HStack(spacing: 5){
                                    Text("\(String(format: "%.1f", option)) C.I. = \(calculateFlowRate(for: option)) L/min = \(calculateFlowRate(for: option)) ml/kg/min")
                                        .font(.caption).multilineTextAlignment(.leading)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Arterial 15Fr")
                                        .font(.caption).multilineTextAlignment(.trailing)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                if index < CIFlowOptions.count - 1 {
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
                            
                            ForEach(Array(CIFlowOptions.enumerated()), id: \.element) { index, option in
                                HStack(spacing: 5){
                                    Text("\(String(format: "%.1f", option)) C.I. = \(calculateFlowRate(for: option)) L/min = \(calculateFlowRate(for: option)) ml/kg/min")
                                        .font(.caption).multilineTextAlignment(.leading)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Arterial 15Fr")
                                        .font(.caption).multilineTextAlignment(.trailing)
                                        .foregroundColor(option == model.selectedCI ? .tealBlue : .textFieldText)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                if index < CIFlowOptions.count - 1 {
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
    
    private func calculateFlowRate(for option: Int) -> String {
        // Implement the logic to calculate the flow rate based on the selected blood flow
        return String(format: "%.2f", Double(option) / 1000.0)
    }
    
    private func calculateFlowRate(for option: Float) -> String {
        // Implement the logic to calculate the flow rate based on the selected cardiac index
        
        let result = "\(option) ml/kg/min : \(String(format: "%.2f", option * 5)) L/min"
        return  String(format: "%.2f", option * 5)// Placeholder calculation
    }
    
    private func calculateCIOptions() -> [Double] {
        // Implement the logic to calculate the cardiac index options based on weight and height
        return [0.5, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.4] // Example options
    }
    
    
}

#Preview {
    CannulaView()
}
func calculateFlowRate(for option: Double) -> String {
    // Implement the logic to calculate the flow rate based on the selected cardiac index
    return String(format: "%.2f", option * 5) // Placeholder calculation
}
//struct BloodFlowtList: View {
//    let values: [Double]
//    let valuesType: String
//    var valueToShow = String()
//    var body: some View {
//        VStack(spacing: 10) {
//            ForEach(values, id: \.self) { dose in
//                
//                //                Text(dose)
//                //                    .foregroundColor(.blue)
//                //                    .frame(maxWidth: .infinity, alignment: .trailing)
//                //                Divider()
//            }
//        }
//        .padding()
//        .background(.textFieldBackground)
//        .cornerRadius(10)
//        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
//        .transition(.opacity)
//    }
//}

//struct InputField: View {
//    var placeholder: String
//    var isHeightField: Bool = true
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
//                    if isHeightField {
//                        if let _ = newValue.firstIndex(of: "."),
//                           newValue.components(separatedBy: ".").count - 1 > 1 {
//                            inputText = String(newValue.dropLast())
//                        }
//                        handleHeightChange(inputText)
//                    }else{
//                        
//                    }
//                }
//        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(inputText.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1)
//        )
//    }
//}

func cannulaWeightBsa(weight: Float,height: Float)-> String{
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsa = 0.007184 * weightPower * heightPower
    return "BSA \(String(format: "%.3f", bsa))  m\u{00B2}"
}
