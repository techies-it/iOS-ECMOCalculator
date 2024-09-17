//
//  CalculatorView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 08/08/24.
//

import SwiftUI



struct CalculatorView: View {
    @StateObject private var model = CalculatorModel()
    @StateObject private var keyboardObserver = KeyboardObserver()
    
    private enum FocusedField: Hashable {
        case weightInputLbs, weightInputKg, inchesInput, centimetersInput, heightInput, weightInputBsa, weightInputBbsa, mapInputOI, pao2InputOI, fio2InputOI, pao2InputRatio, fio2InputRatio, weightInputHLD, bsaInput, weightInputERCM, hematocritInputERCM, weightInputDilutionalHematorcrit, hctInput, eclsCircuitVolumeInput, heartRateInput, strokeVolumeInput, cardiacOutputInput, cardiacIndexBsaInput, mapValueSVRInput, cvpSVRInput, cardiacOutputInputSVR, mpapInput, pcwpInput, cardiacOutputPVR, hgbInput, sao2Input, pao2OCAInput, coODInput, cao2Input, hgbOCVInput, svo2OCVInput, pvo2OCVInput, coOCInput, cao2cvo2, currentPaco2Input, sweepFlowInput, desiredPaco2Input
    }
    
    @FocusState private var focusedField: FocusedField?
    @State private var scrollViewProxy: ScrollViewProxy? = nil
    @State private var scrollViewID = UUID()
    
    var body: some View {
        VStack(spacing: 0) {
            //            VStack {
            GeometryReader { geometry in
                ScrollViewReader { proxy in
                    ScrollView {
                        Text("Clinical Calculator")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundStyle(.titleLabel)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        VStack(spacing: 5) {
                            ListItemView(titleLabel: "Pounds to Kilograms", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $model.weightInputLbs, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: 0)
                                .padding(.horizontal, 30)
                                .focused($focusedField, equals: .weightInputLbs)
                                .onChange(of: model.weightInputLbs) { _ in
                                    withAnimation(.linear(duration: 0.3)) {
                                        model.calculatePoundsToKg()
                                    }
                                    
                                }
                            ResultText(result: model.poundsToKgResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Kilogram to Pounds", subTitleLabel: "lbs", placeHolderlabel: "lbs", textValue: $model.weightInputKg, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: 0)
                                .padding(.horizontal, 30)
                                .focused($focusedField, equals: .weightInputKg)
                                .onChange(of: model.weightInputKg) { _ in
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateKgToPounds()
                                    }
                                    
                                }
                            ResultText(result: model.kgToPoundsResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Inches to Centimeters", subTitleLabel: "in", placeHolderlabel: "in", textValue: $model.inchesInput, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: 0)
                                .padding(.horizontal, 30)
                                .focused($focusedField, equals: .inchesInput)
                                .onChange(of: model.inchesInput) { _ in
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateInchesToCentimeters()
                                    }
                                }
                            ResultText(result: model.inchesToCentimetersResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Centimeters to Inches", subTitleLabel: "cm", placeHolderlabel: "cm", textValue: $model.centimetersInput, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: 0)
                                .padding(.horizontal, 30)
                                .focused($focusedField, equals: .centimetersInput)
                                .onChange(of: model.centimetersInput) { _ in
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateCentimetersToInches()
                                    }
                                }
                            ResultText(result: model.centimetersToInchesResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Body Surface Area",
                                         subTitleLabel: "Height (cm)",subTitleLabel2: "Weight (kg)",
                                         placeHolderlabel: "cm",placeHolderlabel2:"kg", textValue: $model.heightInput,
                                         textValue2: $model.weightInputBsa,
                                         textValue3: $model.blank,numberOfField: 2, scrollIDInt: FocusedField.heightInput.hashValue)
                            .padding(.horizontal, 30)
                            .focused($focusedField, equals: .weightInputLbs)
                            .focused($focusedField, equals: .heightInput)
                            .onChange(of: model.weightInputBsa) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateBodySurfaceArea()
                                }
                            }
                            .onChange(of: model.heightInput) { _ in
                                            if !model.weightInputBsa.isEmpty {
                                                withAnimation(.linear(duration: 0.3)) {
                                                    model.calculateBodySurfaceArea()
                                                }
                                            }
                                          }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.heightInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.bodySurfaceAreaResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Weight Based Body Surface Area", subTitleLabel: "Weight (kg)", placeHolderlabel: "kg", textValue: $model.weightInputBbsa, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: FocusedField.weightInputBbsa.hashValue)
                                .padding(.horizontal, 30)
                                .onChange(of: model.weightInputBbsa) { _ in
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateWeightBasedBodySurfaceArea()
                                    }
                                }
                                
                                .onTapGesture {
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            proxy.scrollTo(FocusedField.weightInputBbsa.hashValue, anchor: .center)
                                            
                                            
                                        }
                                    }
                                }
                            ResultText(result: model.weightBasedBodySurfaceAreaResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Oxygen Index", subTitleLabel: "MAP", subTitleLabel2: "FiO\u{2082}", subTitleLabel3: "PaO\u{2082}", placeHolderlabel: "cmH\u{2082}O", placeHolderlabel2: "%", placeHolderlabel3: "PaO\u{2082}", textValue: $model.mapInputOI, textValue2: $model.fio2InputOI, textValue3: $model.pao2InputOI, numberOfField: 3, scrollIDInt: FocusedField.mapInputOI.hashValue)
                                .padding(.horizontal, 30)
                                .onChange(of: model.pao2InputOI) { _ in
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenIndex()
                                    }
                                }
                                .onChange(of: model.mapInputOI) { _ in
                                    if !model.pao2InputOI.isEmpty && !model.fio2InputOI.isEmpty{
                                        withAnimation(.linear(duration: 0.2)) {
                                            model.calculateOxygenIndex()
                                        }
                                    }
                                }
                                .onChange(of: model.fio2InputOI) { _ in
                                    if !model.pao2InputOI.isEmpty && !model.mapInputOI.isEmpty{
                                        withAnimation(.linear(duration: 0.2)) {
                                            model.calculateOxygenIndex()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            proxy.scrollTo(FocusedField.mapInputOI.hashValue, anchor: .center)
                                            
                                            
                                        }
                                    }
                                }
                            ResultText(result: model.oxygenIndexResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "PaO\u{2082}/FiO\u{2082} Ratio",
                                         subTitleLabel: "PaO\u{2082}", subTitleLabel2: "FiO\u{2082}",
                                         placeHolderlabel: "mmHg", placeHolderlabel2: "%",  textValue: $model.pao2InputRatio, textValue2: $model.fio2InputRatio, textValue3: $model.blank, numberOfField: 2, scrollIDInt: FocusedField.pao2InputRatio.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.fio2InputRatio) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculatePao2Fio2Ratio()
                                }
                            }
                            .onChange(of: model.pao2InputRatio) { _ in
                                if !model.fio2InputRatio.isEmpty {
                                    withAnimation(.linear(duration: 0.3)) {
                                        model.calculatePao2Fio2Ratio()
                                    }
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.pao2InputRatio.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.paO2ByFiO2RatioResult)
                                .padding(.horizontal, 30)
                            
                            
                            ListItemView(titleLabel: "Heparin Loading Dose", subTitleLabel: "Weight (kg)", placeHolderlabel: "kg", textValue: $model.weightInputHLD, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: FocusedField.weightInputHLD.hashValue)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 7)
                                
                                .onChange(of: model.weightInputHLD) { _ in
                                    model.calculateHeparinLoadingDose()
                                }
//                                .id(FocusedField.weightInputHLD)
                                .onTapGesture {
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            proxy.scrollTo(FocusedField.weightInputHLD.hashValue, anchor: .center)
                                            
                                            
                                        }
                                    }
                                }
                            if model.showHeparinList {
                                withAnimation {
                                    ResultList(result: model.heparinLoadingDoseResult)
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 15)
                                }
                            }
                            
                            ListItemView(titleLabel: "Cardiac Index Calculator",
                                         subTitleLabel: "BSA", placeHolderlabel: "m\u{00B2}", textValue: $model.bsaInput, textValue2: $model.blank, textValue3: $model.blank, scrollIDInt: FocusedField.bsaInput.hashValue)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 7)
                            .onChange(of: model.bsaInput) { _ in
                                model.calculateCardiacIndexCalculator()
                            }
//                            .id(FocusedField.bsaInput)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.bsaInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            if model.showCardiaIndexCalculatorList {
                                withAnimation {
                                    ResultList(result: model.cardiacIndexCalculatorResult)
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 20)
                                }
                            }
                            
                            ListItemView(titleLabel: "Estimate Red Cell Mass",
                                         subTitleLabel: "Weight (kg)", subTitleLabel2: "Hematocrit (%)",
                                         placeHolderlabel: "kg", placeHolderlabel2: "%",  textValue: $model.weightInputERCM, textValue2: $model.hematocritInputERCM, textValue3: $model.blank, numberOfField: 2, scrollIDInt: FocusedField.weightInputERCM.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.hematocritInputERCM) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateEstimatedRedCellMass()
                                }
                            }
                            .onChange(of: model.weightInputERCM) { _ in
                                if !model.hematocritInputERCM.isEmpty {
                                    withAnimation(.linear(duration: 0.3)) {
                                        model.calculateEstimatedRedCellMass()
                                    }
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.weightInputERCM.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.estimatedRedCellMassResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Dilutional Hematocrit(HCT)", subTitleLabel: "Weight\n (kg)", subTitleLabel2: "HCT\n (%)", subTitleLabel3: "ECLS Circuit Vol. (mL)",
                                         placeHolderlabel: "kg", placeHolderlabel2: "%", placeHolderlabel3: "mL",
                                         textValue: $model.weightInputDilutionalHematorcrit, textValue2: $model.hctInput, textValue3: $model.eclsCircuitVolumeInput, numberOfField: 3, scrollIDInt: FocusedField.weightInputDilutionalHematorcrit.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.eclsCircuitVolumeInput) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateDilutionalHematocrit()
                                }
                            }
                            .onChange(of: model.weightInputDilutionalHematorcrit) { _ in
                                if !model.eclsCircuitVolumeInput.isEmpty && !model.hctInput.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateDilutionalHematocrit()
                                    }
                                }
                            }
                            .onChange(of: model.hctInput) { _ in
                                if !model.eclsCircuitVolumeInput.isEmpty && !model.weightInputDilutionalHematorcrit.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateDilutionalHematocrit()
                                    }
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.weightInputDilutionalHematorcrit.hashValue, anchor: .center)
                                       
                                    }
                                }
                            }
                            ResultText(result: model.dilutionalHCTResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Cardiac Output",
                                         subTitleLabel: "HR", subTitleLabel2: "Stroke Vol",
                                         placeHolderlabel: "B/min", placeHolderlabel2: "mL",  textValue: $model.heartRateInput, textValue2: $model.strokeVolumeInput, textValue3: $model.blank, numberOfField: 2, scrollIDInt: FocusedField.heartRateInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.strokeVolumeInput) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateCardiacOutput()
                                }
                            }
                            .onChange(of: model.heartRateInput) { _ in
                                if !model.strokeVolumeInput.isEmpty {
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateCardiacOutput()
                                    }
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.heartRateInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.cardiacOutputResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Cardiac Index",
                                         subTitleLabel: "CO", subTitleLabel2: "BSA",
                                         placeHolderlabel: "L/min", placeHolderlabel2: "m\u{00B2}",
                                         textValue: $model.cardiacOutputInput, textValue2: $model.cardiacIndexBsaInput, textValue3: $model.blank, numberOfField: 2, scrollIDInt: FocusedField.cardiacOutputInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cardiacIndexBsaInput) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateCardiacIndex()
                                }
                            }
                            .onChange(of: model.cardiacOutputInput) { _ in
                                if !model.cardiacIndexBsaInput.isEmpty {
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateCardiacIndex()
                                    }
                                }
                            }
//                            .id(FocusedField.cardiacOutputInput)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.cardiacOutputInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.cardiacIndexResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Systemic Vascular Resistance", subTitleLabel: "MAP", subTitleLabel2: "CVP", subTitleLabel3: "CO",
                                         placeHolderlabel: "mmHg", placeHolderlabel2: "mmHg", placeHolderlabel3: "L/min",
                                         textValue: $model.mapValueSVRInput, textValue2: $model.cvpSVRInput, textValue3: $model.cardiacOutputInputSVR, numberOfField: 3, scrollIDInt: FocusedField.mapValueSVRInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.mapValueSVRInput) { _ in
                                if !model.cvpSVRInput.isEmpty && !model.cardiacOutputInputSVR.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateSystemicVascularResistance()
                                    }
                                }
                            }
                            .onChange(of: model.cvpSVRInput) { _ in
                                if !model.mapValueSVRInput.isEmpty && !model.cardiacOutputInputSVR.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateSystemicVascularResistance()
                                    }
                                }
                            }
                            .onChange(of: model.cardiacOutputInputSVR) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateSystemicVascularResistance()
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.mapValueSVRInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.systemicVascularResistanceResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Pulmonary Vascular Resistance", subTitleLabel: "MPAP", subTitleLabel2: "PCWP", subTitleLabel3: "CO",
                                         placeHolderlabel: "mmHg", placeHolderlabel2: "mmHg", placeHolderlabel3: "L/min",
                                         textValue: $model.mpapInput, textValue2: $model.pcwpInput, textValue3: $model.cardiacOutputPVR, numberOfField: 3, scrollIDInt: FocusedField.mpapInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.mpapInput) { _ in
                                if !model.pcwpInput.isEmpty && !model.cardiacOutputPVR.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculatePulmonaryVascularResistance()
                                    }
                                }
                            }
                            .onChange(of: model.pcwpInput) { _ in
                                if !model.mpapInput.isEmpty && !model.cardiacOutputPVR.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculatePulmonaryVascularResistance()
                                    }
                                }
                            }
                            .onChange(of: model.cardiacOutputPVR) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculatePulmonaryVascularResistance()
                                }
                            }
//                            .id(FocusedField.mpapInput)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.mpapInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.pulmonaryVascularResistanceResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Oxygen Content(CaO\u{2082}) - Arterial", subTitleLabel: "Hgb", subTitleLabel2: "SaO\u{2082}", subTitleLabel3: "PaO\u{2082}",
                                         placeHolderlabel: "g/dL", placeHolderlabel2: "%", placeHolderlabel3: "mmHg",
                                         textValue: $model.hgbInput, textValue2: $model.sao2Input, textValue3: $model.pao2OCAInput, numberOfField: 3, scrollIDInt: FocusedField.hgbInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.hgbInput) { _ in
                                if !model.sao2Input.isEmpty && !model.pao2OCAInput.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenContentArterial()
                                    }
                                }
                            }
                            .onChange(of: model.sao2Input) { _ in
                                if !model.hgbInput.isEmpty && !model.pao2OCAInput.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenContentArterial()
                                    }
                                }
                            }
                            .onChange(of: model.pao2OCAInput) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateOxygenContentArterial()
                                }
                            }
//                            .id(FocusedField.hgbInput)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.hgbInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.oxygenContentArterialResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Oxygen Delivery (DO\u{2082})",
                                         subTitleLabel: "CO", subTitleLabel2: "CaO\u{2082}",
                                         placeHolderlabel: "L/min", placeHolderlabel2: "CaO\u{2082}",
                                         textValue: $model.coODInput, textValue2: $model.cao2Input, textValue3: $model.blank, numberOfField: 2, scrollIDInt: FocusedField.coODInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cao2Input) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateOxygenDelivery()
                                }
                            }
                            .onChange(of: model.coODInput) { _ in
                                if !model.cao2Input.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenDelivery()
                                    }
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.coODInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.oxygenDeliveryResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Oxygen Content(CvO\u{2082}) - Venous", subTitleLabel: "Hgb", subTitleLabel2: "SvO\u{2082}", subTitleLabel3: "PvO\u{2082}",
                                         placeHolderlabel: "g/dL", placeHolderlabel2: "%", placeHolderlabel3: "mmHg",
                                         textValue: $model.hgbOCVInput, textValue2: $model.svo2OCVInput, textValue3: $model.pvo2OCVInput, numberOfField: 3, scrollIDInt: FocusedField.hgbOCVInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.hgbOCVInput) { _ in
                                if !model.svo2OCVInput.isEmpty && !model.pvo2OCVInput.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenContentVenous()
                                    }
                                }
                            }
                            .onChange(of: model.svo2OCVInput) { _ in
                                if !model.hgbOCVInput.isEmpty && !model.pvo2OCVInput.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenContentVenous()
                                    }
                                }
                            }
                            .onChange(of: model.pvo2OCVInput) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateOxygenContentVenous()
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.hgbOCVInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.oxygenContentVenousResult)
                                .padding(.horizontal, 30)
                            
                            ListItemView(titleLabel: "Oxygen Consumption (VO\u{2082})",
                                         subTitleLabel: "CO", subTitleLabel2: "CaO\u{2082}-CvO\u{2082}",
                                         placeHolderlabel: "L/min", placeHolderlabel2: "CaO\u{2082}-CvO\u{2082}",
                                         textValue: $model.coOCInput, textValue2: $model.cao2cvo2, textValue3: $model.blank, numberOfField: 2, scrollIDInt: FocusedField.coOCInput.hashValue)
                            .padding(.horizontal, 30)
                            .onChange(of: model.cao2cvo2) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateOxygenConsumption()
                                }
                            }
                            .onChange(of: model.coOCInput) { _ in
                                if !model.cao2cvo2.isEmpty {
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateOxygenConsumption()
                                    }
                                }
                            }
                            .id(FocusedField.coOCInput)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.coOCInput.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            ResultText(result: model.oxygenConsumptionResult)
                                .padding(.horizontal, 30)
                            
                            
                            ListItemView(titleLabel: "Sweep Gas",
                                         subTitleLabel: "Current\n (PaCO\u{2082})", subTitleLabel2: "Current (Sweep Flow)", subTitleLabel3: "Desired\n (PaCO\u{2082})",
                                         placeHolderlabel: "mmHg", placeHolderlabel2: "L/min", placeHolderlabel3: "mmHg",
                                         textValue: $model.currentPaco2Input, textValue2: $model.sweepFlowInput, textValue3: $model.desiredPaco2Input, numberOfField: 3, scrollIDInt: FocusedField.currentPaco2Input.hashValue)
                            .padding(.horizontal, 30)
                            .focused($focusedField, equals: .currentPaco2Input)
                            .focused($focusedField, equals: .sweepFlowInput)
                            .focused($focusedField, equals: .desiredPaco2Input)
                            .onChange(of: model.currentPaco2Input) { _ in
                                if !model.sweepFlowInput.isEmpty && !model.desiredPaco2Input.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateSweepGas()
                                    }
                                }
                            }
                            .onChange(of: model.sweepFlowInput) { _ in
                                if !model.currentPaco2Input.isEmpty && !model.desiredPaco2Input.isEmpty{
                                    withAnimation(.linear(duration: 0.2)) {
                                        model.calculateSweepGas()
                                    }
                                }
                            }
                            .onChange(of: model.desiredPaco2Input) { _ in
                                withAnimation(.linear(duration: 0.2)) {
                                    model.calculateSweepGas()
                                }
                            }
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        proxy.scrollTo(FocusedField.currentPaco2Input.hashValue, anchor: .center)
                                        
                                        
                                    }
                                }
                            }
                            
                            ResultText(result: model.sweepGasResult)
                                .padding(.horizontal, 30)
                            
                            
                        }
                        .padding(.bottom, keyboardObserver.keyboardHeight) // Adjust for keyboard height
                        
                        
                    }
                    .id(scrollViewID)
                    
                                        .onChange(of: focusedField) { _ in
                                            // Optionally, scroll to the focused field if needed
                                            
                                            if let field = focusedField {
                                                
                                                DispatchQueue.main.async {
                                                    withAnimation {
                                                        proxy.scrollTo(field, anchor: .top)
                    
                                                        if field == .currentPaco2Input{
                                                        }
                                                    }
                                                }
                                            }
                                        }
                    
                }//scrollVie proxy
            }
        }.background(.white)
            .onTapGesture {
                // Dismiss the keyboard when tapping outside of the text fields
                dismissKeyboard()
            }
    }
}



#Preview {
    CalculatorView()
}

// Function to format the number with comma separators and variable decimal places
func formatNumber(_ value: Float, decimalPlaces: Int) -> String {
    // Check if the number is a whole number (no fractional part)
    if value == floor(value) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0  // No decimals for whole numbers
        formatter.maximumFractionDigits = 0  // No decimals for whole numbers
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(Int(value))"
    } else {
        // Format the value with the specified number of decimal places
        let formatString = "%.\(decimalPlaces)f"  // Create the format string dynamically
        let number = String(format: formatString, value)
        
        // Adding commas to the formatted number
        if let doubleValue = Double(number) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = decimalPlaces  // Ensures the specified decimal places
            formatter.maximumFractionDigits = decimalPlaces
            
            return formatter.string(from: NSNumber(value: doubleValue)) ?? number
        }
        
        return number
    }
}


// Functions
func calPoundsToKilograms(pounds : Float) -> String{
    let kilograms = pounds/2.2
    let kiloResult = formatNumber(kilograms, decimalPlaces: 2)
    return "\(kiloResult) Kg"
}

func calKilogramsToPounds(kilograms : Float) -> String{
    let pounds = kilograms * 2.2
    let poundResult = formatNumber(pounds, decimalPlaces: 2)
    return "\(poundResult) lbs"
}
func calInchesToCm(inches: Float) -> String{
    let cmValue = inches * 2.54
    let cmResult = formatNumber(cmValue, decimalPlaces: 2)
    return "\(cmResult) cm"
}
func calCmToInches(cms: Float) -> String{
    let inchValue = cms/2.54
    let inchResult = formatNumber(inchValue, decimalPlaces: 2)
    return "\(inchResult) in"
}

func calBodySurfaceArea(weight: Float, height: Float) -> String{
    let weightPower = pow(weight, 0.425)
    let heightPower = pow(height, 0.725)
    let bsa = 0.007184 * weightPower * heightPower
    let bsaResult = formatNumber(bsa, decimalPlaces: 2)
    return "\(bsaResult) m\u{00B2}"

}

func calWeightBsa(weight: Float)-> String{
    let calculatedWeightBSA = ((weight * 4) + 7) / (90 + weight)
    let calculatedWeightBSAResult = formatNumber(calculatedWeightBSA, decimalPlaces: 2)
    return "\(calculatedWeightBSAResult) m\u{00B2}"
}

func calOxygenIndex(mapValue: Float, fio2: Float, pao2: Float) -> String{
    
    let oxygenIndexValue =  ((mapValue * (fio2 / 100)) / pao2) * 100
    let oiResult = formatNumber(oxygenIndexValue, decimalPlaces: 1)
    return "\(oiResult)"
}

func calPao2fio2Ratio(pao2: Float, fio2: Float) -> String{
    let ratio = (pao2 / (fio2 / 100))
    let ratioResult = formatNumber(ratio, decimalPlaces: 0)
    return "\(ratioResult)"
}

func calHeparingLoadingDose(weight: Float) -> [String]{
    let loadingDoseArray : [Float] = [25.0,50.0,75.0,100.0,200.0,300.0,400.0]
    var doseArray: [String] = []
    var doseArrayValue : Float = 0.0
    
    for number in loadingDoseArray{
        doseArrayValue = number * weight
        let doseResult = formatNumber(doseArrayValue, decimalPlaces: 2)
        doseArray.append("\(Int(number))u/Kg = \(doseResult) units")
    }
    return doseArray
}

func calCardiacIndexCalculator(bsa: Float) -> [String]{
    let ciArray = [1.0,1.5,1.8,2.0,2.2,2.4,2.6,2.8,3.0]
    
    var resultCIArray : [String] = []
    var calculatedValue = 0.00
    
    for number in ciArray{
        calculatedValue = number * Double(bsa)
        let result = formatNumber(Float(calculatedValue), decimalPlaces: 2)
        resultCIArray.append("CI \(number) = \(result) L/min")
    }
    return resultCIArray
}
func calEstimatedRedCellMass(weight: Float, hematocrit: Float) -> String {
    let resultERCM = (weight * 75 * (hematocrit / 100))
    let result = formatNumber(resultERCM, decimalPlaces: 2)
    return "\(result) mL"
}
func calDilutionalHematocrit(weight: Float, hct: Float, circuitVol: Float) -> String{
    let resultDilHematocrit = (((weight * 75) * (hct / 100)) / (circuitVol + (weight * 75))) * 100
    let dhResult = formatNumber(resultDilHematocrit, decimalPlaces: 1)
    return "\(dhResult) %"
}
func calCardiacOutput(heartRate: Float, strokeVol: Float) -> String{
    let resultCardiacOutput = (heartRate * strokeVol) / 1000.0
    let coResult = formatNumber(resultCardiacOutput, decimalPlaces: 2)
    return "\(coResult) L/min"
}
func calCardiacIndex(cardiacOutput: Float, bsa: Float) -> String{
    let resultCardiacIndex = cardiacOutput/bsa
    let ciResult = formatNumber(resultCardiacIndex, decimalPlaces: 1)
    return "\(ciResult) L/min/m\u{00B2}"
}
func calSystemicVascularResistance(mapValue: Float, cvp: Float, cardiacOutput: Float)-> String{
    let vascularResistance = ((mapValue - cvp)/cardiacOutput) * 80
    let vrResult = formatNumber(vascularResistance, decimalPlaces: 0)
    return "\(vrResult) Dynes-sec/cm\u{2075}"
}
func calPulmonaryVascularResistance(mpap: Float, pcwp: Float, cardiacOutput: Float) -> String{
    let vascularResistance = ((mpap - pcwp) / cardiacOutput) * 80
    let pvrResult = formatNumber(vascularResistance, decimalPlaces: 0)
    return "\(pvrResult) Dynes-sec/cm\u{2075}"
}
func calOxygenContentArterial(hgb: Float, sao2: Float, pao2: Float) -> String{
    let resultArterialOC = (hgb * 1.34 * (sao2 / 100)) + (pao2 * 0.003)
    let aocResult = formatNumber(resultArterialOC, decimalPlaces: 0)
    return "\(aocResult) mL/dL"
}
func calOxygenDelivery(co: Float, cao2: Float) -> String{
    let resultDo2 = (co * cao2) * 10
    let result = formatNumber(resultDo2, decimalPlaces: 0)
    return "\(String(format: "%.0f", resultDo2)) mL/min"
}
func calOxygenContentVenous(hgb: Float, svo2: Float, pvo2: Float)-> String{
    let resultContent = (hgb * 1.34 * (svo2 / 100)) + (pvo2 * 0.003)
    let result = formatNumber(resultContent, decimalPlaces: 2)
    return "\(result) mL/dL"
}
func calOxygenConsumption(co: Float, cao2cvo2: Float) -> String{
    let oxygenConsumption = (co * cao2cvo2) * 10
    let ocResult = formatNumber(oxygenConsumption, decimalPlaces: 0)
    return "\(ocResult) mL/min"
}
func calSweepGas(currentPaco2: Float, sweepFlow: Float,desiredPaco2: Float ) -> String{
    let sweepGas = (currentPaco2 * sweepFlow) / desiredPaco2
    let sweepGasResult = formatNumber(sweepGas, decimalPlaces: 1)
    return "\(sweepGasResult) L/min"
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
