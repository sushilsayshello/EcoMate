import SwiftUI

struct ProfileView: View {
    var userName: String
    var energyGoal: String // New property for energy goal
    var solarGoal: String   // New property for solar goal
    var energySavings: Double = 50.0 // Example data
    var solarEfficiency: Double = 85.0
    var environmentalImpact: Double = 120.0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome, \(userName)!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Energy Savings: \(energySavings, specifier: "%.2f") kWh")
                    .font(.headline)
                    .foregroundColor(.green)
                
                Text("Solar Efficiency: \(solarEfficiency, specifier: "%.2f") %")
                    .font(.headline)
                    .foregroundColor(.yellow)
                
                Text("Environmental Impact: \(environmentalImpact, specifier: "%.2f") kg CO2 saved")
                    .font(.headline)
                    .foregroundColor(.orange)
                
                Text("Energy Goal: \(energyGoal) kWh")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding()

                Text("Solar Goal: \(solarGoal)")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding()
            }
            .padding()
            .background(Color.purple.opacity(0.2))
            .cornerRadius(15)
        }
        .padding()
    }
}
