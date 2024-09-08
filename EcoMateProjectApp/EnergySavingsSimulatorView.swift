import SwiftUI

struct EnergySavingsSimulatorView: View {
    @State private var currentUsage: Double = 800 // Current usage in kWh
    @State private var solarPanelAdoption: Bool = false
    @State private var energyEfficientAppliances: Bool = false
    @State private var thermostatAdjustment: Double = 0 // Adjust in degrees
    @State private var projectedSavings: Double = 0

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Energy Savings Simulator")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .shadow(radius: 5)

            // Current Energy Usage
            VStack(alignment: .leading, spacing: 10) {
                Text("Current Monthly Energy Usage: \(Int(currentUsage)) kWh")
                    .font(.headline)
                
                Slider(value: $currentUsage, in: 200...1500, step: 50)
                    .accentColor(.blue)
                    .padding()
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            
            // Solar Panel Adoption Toggle
            Toggle(isOn: $solarPanelAdoption) {
                Text("Adopt Solar Panels")
                    .font(.headline)
                    .foregroundColor(.green)
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(10)
            
            // Energy Efficient Appliances Toggle
            Toggle(isOn: $energyEfficientAppliances) {
                Text("Use Energy Efficient Appliances")
                    .font(.headline)
                    .foregroundColor(.purple)
            }
            .padding()
            .background(Color.purple.opacity(0.2))
            .cornerRadius(10)
            
            // Thermostat Adjustment
            VStack(alignment: .leading) {
                Text("Thermostat Adjustment (°C)")
                    .font(.headline)
                
                Slider(value: $thermostatAdjustment, in: -10...10, step: 1)
                    .accentColor(.orange)
                    .padding()
                
                Text("\(Int(thermostatAdjustment))°C")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
            .padding()
            .background(Color.orange.opacity(0.2))
            .cornerRadius(10)
            
            // Calculate Savings Button
            Button(action: calculateSavings) {
                Text("Calculate Savings")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Projected Savings Display
            VStack {
                Text("Projected Monthly Savings")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text("$\(projectedSavings, specifier: "%.2f")")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                    .padding()
            }
            .padding()
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding()
        .navigationTitle("Energy Savings Simulator")
    }
    
    // Function to calculate savings based on user inputs
    func calculateSavings() {
        var savings = 0.0
        
        // Solar Panel Adoption (Reduces energy consumption by 30%)
        if solarPanelAdoption {
            savings += currentUsage * 0.30
        }
        
        // Energy Efficient Appliances (Reduces energy consumption by 15%)
        if energyEfficientAppliances {
            savings += currentUsage * 0.15
        }
        
        // Thermostat Adjustment (Saves 1% energy for every degree of change)
        let thermostatImpact = abs(thermostatAdjustment) * 0.01 * currentUsage
        savings += thermostatImpact
        
        // Subtract savings from current usage for projected savings
        projectedSavings = savings
    }
}

