//
//  FormulasView.swift
//  Ecmo Clinical Calculator
//
//  Created by Mohit Sharma on 04/09/24.
//

import Foundation
import SwiftUI
import Observation

@available(iOS 17.0, *)
@Observable class GlobalString {
    
    var cannulaBsaValue: Float = 0.0
    var pediatricBloodFlow = 0.00
}


@available(iOS 17.0, *)
struct FormulaView: View {
    @State private var cms: String = ""
    @State var globalString = GlobalString()
    var body: some View {
//        HStack{
           
        Link("Visit Apple", destination: URL(string: "https://innovativeecmo.com/")!)
            .font(.title)
            .foregroundStyle(.red)
        
//            TabView {
                Text("FiO\u{2082}, PaO\u{2082}")
//                  let _ = print(sweepGas(currentPaco2: 28, sweepFlow: 69, desiredPaco2: 36))
//                let _ = print(oxygenConsumption(co: 15, cao2cvo2: 30))
//                let _ = print(oxygenContentVenous(hgb: 16, svo2: 2, pvo2: 26))
//                let _ = print(oxygenDelivery(co: 25, cao2: 26))
//                let _ = print(oxygenContentArterial(hgb: 25, svo2: 28, pao2: 36))
//                let _ = print(pulmonaryVascularResistance(mpap: 50, pcwp: 28, cardiacOutput: 68))
//                let _ = print(systemicVascularResistance(mapValue: 55, cvp: 25, cardiacOutput: 26))
//                let _ = print(cardiacIndex(cardiacOutput: 50, bsa: 20))
//                let _ = print(cardiacOutput(hr: 28, strokeVol: 60))
//                let _ = print(dilutionalHematocrit(weight: 100, hct: 10, circuitVol: 5))
//                let _ = print(estimatedRedCellMass(weight: 25, hematocrit: 25))
//                let _ = print(cardiacIndexCalculator(bsa: 15))
//               let _ = print(heparingLoadingDose(weight: 100.0))
//                let _ = print(pao2fio2Ratio(pao2: 50, fio2: 2))
//                let _ = print(oxygenIndex(mapValue: 100, fio2: 50, pao2: 26))
//                let _ = print(weightBsa(weight: 80))
//                let _ = print(bodySurfaceArea(weight: 80, height: 165))
                TextField("lbs",text: $cms)
                     .keyboardType(.numberPad)
                     .onSubmit {
                         let inchValue = cmToInches(cms: Float(cms)!)
                            print(inchValue)
//                         print("m ^^ 2")
//                         let cmValue = inchesToCm(inches: Float(inches)!)
//                            print(cmValue)
                         
//                         let poundValue = kilogramsToPounds(kilograms: Float(kilograms)!)
//                         let _ = print(poundValue)
//                         let kgValue = poundsToKilograms(pounds: Float(pounds)!)
//                         let _ = print(kgValue)
                     }.padding(40)
                TextField("lbs",text: $cms)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        let inchValue = cmToInches(cms: Float(cms)!)
                        print(inchValue)
                        //                         print("m ^^ 2")
                        //                         let cmValue = inchesToCm(inches: Float(inches)!)
                        //                            print(cmValue)
                        
                        //                         let poundValue = kilogramsToPounds(kilograms: Float(kilograms)!)
                        //                         let _ = print(poundValue)
                        //                         let kgValue = poundsToKilograms(pounds: Float(pounds)!)
                        //                         let _ = print(kgValue)
                    }.padding(40)
                       Text("The content of the first view")
                         .tabItem {
                            Image(systemName: "phone.fill")
                            
                          }
            
                        Text("The content of the second view")
                          .tabItem {
                             Image(systemName: "phone.fill")
                             Text("Second Tab")
                           }
            
                        Text("The content of the third view")
                          .tabItem {
                             Image(systemName: "phone.fill")
                             Text("Third Tab")
                           }
//                    }
//        }
    }
    
    //adult
    func cannulaWeightBsa(weight: Float,height: Float)-> String{
        let weightPower = pow(weight, 0.425)
        let heightPower = pow(height, 0.725)
        let bsa = 0.007184 * weightPower * heightPower
        globalString.cannulaBsaValue = round(bsa*1000)/1000.0
        return "\(String(format: "%.3f", bsa))  m\u{00B2}"
    }
    
    //adult
    
    
    func vaNeckFemoralArterialCannula()->String{  //use this for VA Groin Femoral Arterial Cannula
        var calculatedVaNeckFemoralArterialCannula = ""
        
        switch globalString.cannulaBsaValue{
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
       
        return calculatedVaNeckFemoralArterialCannula
    }
    
    func vaNeckFemoralVenousCannula()->String{  // use this for VA groin Femoral venous cannula also
        var calculatedVaNeckFemoralArterialCannula = ""
        
        switch globalString.cannulaBsaValue{
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
        
        return calculatedVaNeckFemoralArterialCannula
    }
    
    func arterialHLSCannula15()-> String{  // use same function for venous hls cannula 15cm
        var arterialHlsCannula15 = ""
        
        switch globalString.cannulaBsaValue{
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
        
        return arterialHlsCannula15
    }
    
    func arterialHLSCannula23()-> String{ // use same function for venous hls cannula 23cm
        var arterialHlsCannula23 = ""
        
        switch globalString.cannulaBsaValue{
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
        
        return arterialHlsCannula23
    }
    
    func vaGroinMultiStageFemoralVenousCannulae() -> String{
        var multiStageVenousCannula = ""
        
        switch globalString.cannulaBsaValue{
        case 0...4.1:
            multiStageVenousCannula = "19Fr"
        case 4.101...5.375:
            multiStageVenousCannula = "21Fr"
        case 5.376...7:
            multiStageVenousCannula = "25Fr"
        default:
            multiStageVenousCannula = "NA"
        }
        
        return multiStageVenousCannula
    }
    
    func vaGroinArterialHLSCannula15()-> String{ // use same for Getinge Venous HLS Cannula (15cm)
        var vaGroinHLSCannula15 = ""
        
        switch globalString.cannulaBsaValue{
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
        
        return vaGroinHLSCannula15
    }
    
    func vaGroinArterialHLSCannula23()-> String{ // use same for Getinge Venous HLS Cannula (15cm)
        var vaGroinHLSCannula23 = ""
        
        switch globalString.cannulaBsaValue{
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
        
        return vaGroinHLSCannula23
    }
    
    func vaGroinVenousHLSCannula38()-> String{
        var vaGroinHLSCannula38 = ""
        
        switch globalString.cannulaBsaValue{
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
        
        return vaGroinHLSCannula38
    }
    
    func vaGroinVenousHLSCannula55()-> String{
        var vaGroinHLSCannula38 = ""
        
        switch globalString.cannulaBsaValue{
        case 0...5.3:
            vaGroinHLSCannula38 = "21Fr"
        case 5.301...6.6:
            vaGroinHLSCannula38 = "23Fr"
        case 6.601...7:
            vaGroinHLSCannula38 = "25Fr"
        case 7.01...7.25:
            vaGroinHLSCannula38 = "29Fr"
        default:
            vaGroinHLSCannula38 = "NA"
        }
        
        return vaGroinHLSCannula38
    }
    
    func vaGroinEdwardVenousCannula()-> String{
        var vaGroinEdwardVenousCannula = ""
        
        switch globalString.cannulaBsaValue{
        case 0...5:
            vaGroinEdwardVenousCannula = "22Fr"
        case 5.01...6.5:
            vaGroinEdwardVenousCannula = "25Fr"
        default:
            vaGroinEdwardVenousCannula = "NA"
        }
        
        return vaGroinEdwardVenousCannula
    }
    
    func vvdlDualLumenCatheterAdult() -> String{
        var calculatedLumenCatheter = ""
            
        switch globalString.cannulaBsaValue{
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
        
        return calculatedLumenCatheter
    }
    
    func vvdlCresentLumenECLSCannula() -> String{
        var cresentECLSCatheter = ""
            
        switch globalString.cannulaBsaValue{
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
        
        return cresentECLSCatheter
    }
    
    // pediatric
    
    func calTargetBloodFlowForPediatricEntry(weight: Float, targetCI: Float)-> String {
        var resultTargetBloodFlow = (weight * targetCI) / 1000
        globalString.pediatricBloodFlow = Double(round(resultTargetBloodFlow*100)/100.0)
        return "\(String(format: "%.2f", resultTargetBloodFlow))  L/min"
    }
    
    func vaNeckArterialCannulae() -> String{
        var calculatedFr = ""
        
        switch globalString.pediatricBloodFlow{
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
      
        return calculatedFr
    }
    
    func vaNeckVenousCannulae() -> String{
        var calculatedVenousFr = ""
        
        switch globalString.pediatricBloodFlow{
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
        
        return calculatedVenousFr
    }
    
    func vaGroinArterialCannulae() -> String{
        var calculatedFr = ""
        
        switch globalString.pediatricBloodFlow{
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
    
        
        return calculatedFr
    }
    
    func vaGroinVenousCannulae() -> String{
        var calculatedVenousFr = ""
        
        switch globalString.pediatricBloodFlow{
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
    
        return calculatedVenousFr
    }
    
    func vvdlDualLumenCatheter() -> String{
        var calculatedLumenCatheter = ""
            //pediatric
        
        switch globalString.pediatricBloodFlow{
        case 0...0.625:
            calculatedLumenCatheter = "13Fr"
        case 0.626...0.9:
            calculatedLumenCatheter = "16Fr"
        case 0.901...1.58:
            calculatedLumenCatheter = "19Fr"
        default:
            calculatedLumenCatheter = "NA"
        }
        
        
        
        return calculatedLumenCatheter
    }
    
    
    
    func vvdlCrescentdualECLSCannula() -> String{
        var calculatedEclsCannula = ""
            //pediatric
        
        switch globalString.pediatricBloodFlow{
        case 0...0.625:
            calculatedEclsCannula = "13Fr"
        case 0.626...0.9:
            calculatedEclsCannula = "15Fr"
        case 0.901...1.58:
            calculatedEclsCannula = "19Fr"
        default:
            calculatedEclsCannula = "NA"
        }
        
        return calculatedEclsCannula
    }
}

func cmToInches(cms: Float) -> String{
    let inchValue = cms/2.54
    return "\(round(inchValue * 100)/100.0) in"
}
