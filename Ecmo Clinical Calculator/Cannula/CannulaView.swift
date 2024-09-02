//
//  CannulaView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI

struct CannulaView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var selectedBloodFlow: Int?
    @State private var selectedCI: Double?
    @State private var bloodFlowOptions = [100, 150, 175, 200, 250]
    @State private var CIFlowOptions = [0.5, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4]
    @State private var isHeightVisible: Bool = false
    @State private var isDropDownVisible: Bool = false
    @State private var isBloodFlowVisible: Bool = false
    @State private var isCIVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Cannula Selection")
                .font(.largeTitle)
                .padding(.top)
            
            HStack(spacing: 15) {
                // Weight Input
                TextField("Weight (kg)", text: $weight)
                    .font(.system(size: 13))
                    .keyboardType(.decimalPad)
                    .foregroundStyle(.textFieldText)
                    .padding(.horizontal, 15)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .stroke(weight.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1))
                    .background(.textFieldBackground)
                    .onChange(of: weight) { newValue in
                        if let _ = newValue.firstIndex(of: "."),
                           newValue.components(separatedBy: ".").count - 1 > 1 {
                            weight = String(newValue.dropLast())
                        }
                        handleWeightChange(weight)
                    }
                
                if isHeightVisible {
                    // Height Input (Visible only if weight > 15)
                    TextField("Height (cm)", text: $height)
                        .font(.system(size: 13))
                        .foregroundStyle(.textFieldText)
                        .keyboardType(.decimalPad)
                        .padding(.horizontal, 15)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .stroke(height.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1))
                        .background(.textFieldBackground)
                        .onChange(of: height) { newValue in
                            if let _ = newValue.firstIndex(of: "."),
                               newValue.components(separatedBy: ".").count - 1 > 1 {
                                height = String(newValue.dropLast())
                            }
                            handleHeightChange(height)
                        }
                    
                }
                
                if isDropDownVisible {
                    // Blood Flow Dropdown

                    Menu {
                        if !isHeightVisible {
                            ForEach(bloodFlowOptions, id: \.self) { option in
                                Button("\(option) ml/kg/min") {
                                    selectedBloodFlow = option
                                }
                            }
                        }else{
                            ForEach(CIFlowOptions, id: \.self) { option in
                                Button("\(option) ml/kg/min") {
                                    selectedCI = option
                                }
                            }
                        }
                        
                    } label: {
                        Text(selectedBloodFlow == nil ? "Select Blood Flow" : "\(selectedBloodFlow!) ml/kg/min")
                            .font(.system(size: 11))
                            .padding(.horizontal, 2)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(selectedBloodFlow == nil ? Color.gray : Color.blue, lineWidth: 1))
                    }
                    .frame(height: 50)

                }
            }
            .padding(.horizontal, 10)
            
            if isBloodFlowVisible {
                // Display Blood Flow Results
                List(bloodFlowOptions, id: \.self) { option in
                    Text("\(option) ml/kg/min : \(calculateFlowRate(for: option)) L/min")
                        .foregroundColor(option == selectedBloodFlow ? Color.blue : Color.primary)
                }
                
//                .frame(maxHeight: 200)
                VStack(spacing: 10) {
                    ForEach($bloodFlowOptions, id: \.self) { dose in
//                        Text("\(dose) ml/kg/min : \(calculateFlowRate(for: option)) L/min")
//                            .foregroundColor(.blue)
//                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Divider()
                    }
                }
                .padding()
                .background(.textFieldBackground)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                .transition(.opacity)

            }
            
            if isCIVisible {
                // Display Cardiac Index (CI) Results
                List(calculateCIOptions(), id: \.self) { option in
                    Text("\(String(format: "%.1f", option)) C.I. = \(calculateFlowRate(for: option)) L/min = \(calculateFlowRate(for: option)) ml/kg/min")
                        .foregroundColor(option == selectedCI ? Color.blue : Color.primary)
                }
//                .frame(maxHeight: 300)
            }
            
        }
        .padding()
    }
    
    private func handleWeightChange(_ newValue: String) {
        guard let weightValue = Double(newValue) else {
            isHeightVisible = false
            isBloodFlowVisible = false
            isCIVisible = false
            return
        }
        
        if weightValue <= 15 {
            isHeightVisible = false
            isDropDownVisible = true
            isBloodFlowVisible = true
            isCIVisible = false
            selectedBloodFlow = nil
        } else {
            isHeightVisible = true
            isDropDownVisible = true
            isBloodFlowVisible = false
            isCIVisible = true
            selectedCI = nil
        }
    }
    
//    private func handleHeightChange(_ newValue: String) {
//        // Logic to handle height change, if required
//    }
    
    private func calculateFlowRate(for option: Int) -> String {
        // Implement the logic to calculate the flow rate based on the selected blood flow
        return String(format: "%.2f", Double(option) / 1000.0)
    }
    
    private func calculateFlowRate(for option: Double) -> String {
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
struct BloodFlowtList: View {
    let values: [Double]
    let valuesType: String
    var valueToShow = String()
    var body: some View {
        VStack(spacing: 10) {
            ForEach(values, id: \.self) { dose in

//                Text(dose)
//                    .foregroundColor(.blue)
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                Divider()
            }
        }
        .padding()
        .background(.textFieldBackground)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
        .transition(.opacity)
    }
}

struct InputField: View {
    var placeholder: String
    var isHeightField: Bool = true
    @Binding var inputText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.textFieldBackground))
                .frame(height: 50)
            
            TextField(placeholder, text: $inputText)
                .foregroundStyle(.textFieldText)
                .padding(.horizontal, 15)
                .frame(height: 50)
                .onChange(of: inputText) { newValue in
                    if isHeightField {
                        if let _ = newValue.firstIndex(of: "."),
                           newValue.components(separatedBy: ".").count - 1 > 1 {
                            inputText = String(newValue.dropLast())
                        }
                        handleHeightChange(inputText)
                    }else{
                        
                    }
                }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(inputText.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1)
        )
    }
}

private func handleHeightChange(_ newValue: String) {
    // Logic to handle height change, if required
}
