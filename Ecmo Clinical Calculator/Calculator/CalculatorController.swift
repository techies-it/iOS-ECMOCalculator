//
//  CalculatorController.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 02/09/24.
//

import Foundation
import SwiftUI

struct ListItemView: View {
    var titleLabel: String
    var subTitleLabel: String
    var subTitleLabel2: String = ""
    var subTitleLabel3: String = ""
    var placeHolderlabel: String
    var placeHolderlabel2: String = ""
    var placeHolderlabel3: String = ""
    @Binding var textValue: String
    @Binding var textValue2: String
    @Binding var textValue3: String
    @State var numberOfField: Int = 1
    @FocusState private var focusedField: FocusedField?
    var scrollIDInt: Int
    private enum FocusedField {
            case field1, field2, field3
        }
        
    var body: some View {
        
        VStack(alignment: .leading,spacing: 8) {
            Text(titleLabel)
                .multilineTextAlignment(.leading)
                .font(.system(size: 13,weight: .bold))
                .foregroundStyle(.textFieldText)
//                .padding(.bottom,5)
            
            if numberOfField == 1 {
                Text(subTitleLabel)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 12))
                    .foregroundStyle(.tealBlue)
                InputTextField(placeholder: placeHolderlabel, inputText: $textValue, scrollID: scrollIDInt)
                    .focused($focusedField, equals: .field1)
            } else if numberOfField == 2 {
                HStack(spacing: 5) {
                    Text(subTitleLabel)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .foregroundStyle(.tealBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text(subTitleLabel2)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .foregroundStyle(.tealBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack(spacing: 10) {
                    InputTextField(placeholder: placeHolderlabel, inputText: $textValue, scrollID: scrollIDInt)
                        .focused($focusedField, equals: .field1)
                    InputTextField(placeholder: placeHolderlabel2, inputText: $textValue2, scrollID: scrollIDInt)
                        .focused($focusedField, equals: .field2)
                }
            }else if numberOfField == 3 {
                HStack(spacing: 5) {
                    Text(subTitleLabel)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .foregroundStyle(.tealBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text(subTitleLabel2)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .foregroundStyle(.tealBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text(subTitleLabel3)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .foregroundStyle(.tealBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack(spacing: 10) {
                    InputTextField(placeholder: placeHolderlabel, showResponse: false, inputText: $textValue, scrollID: scrollIDInt)
                        .focused($focusedField, equals: .field1)
                    InputTextField(placeholder: placeHolderlabel2, showResponse: false, inputText: $textValue2, scrollID: scrollIDInt)
                        .focused($focusedField, equals: .field2)
                    InputTextField(placeholder: placeHolderlabel3, inputText: $textValue3, scrollID: scrollIDInt)
                        .focused($focusedField, equals: .field3)
                }
            }
        }
        
    }
}

struct InputTextField: View {
    var placeholder: String
    var showResponse: Bool = true
    @Binding var inputText: String
    @FocusState private var isFocused: Bool
    var scrollID: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.textFieldBackground))
                .frame(height: 50)
            
            TextField(placeholder, text: $inputText)
                .keyboardType(.decimalPad)
                .font(.system(size: 13))
                .focused($isFocused)
                .foregroundStyle(.textFieldText)
                .padding(.horizontal, 15)
                .frame(height: 50)
                .id(scrollID)
                .onChange(of: inputText) { newValue in
                    
                    if showResponse {
                        if let _ = newValue.firstIndex(of: "."),
                           newValue.components(separatedBy: ".").count - 1 > 1 {
                            inputText = String(newValue.dropLast())
                        }
                    }
                    
                }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(inputText.isEmpty ? Color.textFieldBorder : Color.tealBlue, lineWidth: 1)
        )
    }
}


struct ResultText: View {
    let result: String
    
    var body: some View {
        Text(result)
            .font(.system(size: 13, weight: .heavy))
            .foregroundStyle(.tealBlue)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct ResultList: View {
    let result: [String]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(result, id: \.self) { dose in
                Text(dose)
                    .foregroundStyle(.tealBlue)
                    .font(.system(size: 13, weight: .heavy))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Divider()
                
            }
        }
        .padding()
        .background(.textFieldBackground)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
        .transition(.opacity)
    }
}
