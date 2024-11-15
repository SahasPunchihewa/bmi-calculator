//
//  ContentView.swift
//  bmi-calculator
//
//  Created by Sahas on 2024-11-15.
//

import SwiftUI

struct ContentView: View {
    @State var height: Double?
    @State var weight: Double?
    @State var bmi: Double?
    @State var bmiMessage: String = ""
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
                .font(.largeTitle)
                .bold()
                .padding()
            
            HStack {
                Text("Height :")
                    .frame(width: 70, alignment: .leading)
                TextField("Enter your height in meters", value: $height, format: .number)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            HStack {
                Text("Weight :")
                    .frame(width: 70, alignment: .leading)
                TextField("Enter your weight in killograms", value: $weight, format: .number)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            Spacer()
            
            Text(bmi != nil ? "Your BMI is \(String(format: "%.2f", bmi!))" : "")
                .font(.title)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            Text(bmiMessage)
                .font(.title)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            
            Button("Calculate BMI") {
                var bmiValue = (weight ?? 0) / ((height ?? 1) * (height ?? 1))
                
                if bmiValue < 18.5 {
                    bmiMessage = "You are underweight"
                } else if bmiValue < 24.9 {
                    bmiMessage = "You are normal weight"
                } else if bmiValue < 29.9 {
                    bmiMessage = "You are overweight"
                } else {
                    bmiMessage = "You are obese"
                }
                
                print(bmiValue)
                
                bmi = bmiValue
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
