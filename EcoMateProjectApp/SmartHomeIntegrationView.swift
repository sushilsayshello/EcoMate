import SwiftUI

struct SmartHomeIntegrationView: View {
    @State private var thermostatTemperature: Double = 72.0
    @State private var smartPlugOn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Smart Home Devices")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            // Thermostat Control
            VStack(alignment: .leading, spacing: 20) {
                Text("Thermostat Control")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Temperature: \(thermostatTemperature, specifier: "%.1f")°F")
                        .font(.headline)
                    Spacer()
                    Slider(value: $thermostatTemperature, in: 60...80, step: 0.5)
                        .accentColor(.orange)
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                
                Button(action: {
                    adjustThermostat()
                }) {
                    Text("Set Thermostat")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            // Smart Plug Control
            VStack(alignment: .leading, spacing: 20) {
                Text("Smart Plug Control")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Toggle(isOn: $smartPlugOn) {
                    Text(smartPlugOn ? "Smart Plug: ON" : "Smart Plug: OFF")
                        .font(.headline)
                        .foregroundColor(smartPlugOn ? .green : .red)
                }
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(10)
                
                Button(action: {
                    toggleSmartPlug()
                }) {
                    Text(smartPlugOn ? "Turn Off Plug" : "Turn On Plug")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(smartPlugOn ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            // Energy Efficiency Automation
            VStack(alignment: .leading, spacing: 20) {
                Text("Energy Efficiency Automation")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("Automatically adjust thermostat and smart plugs to optimize energy usage during peak hours.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Button(action: {
                    automateEnergyEfficiency()
                }) {
                    Text("Optimize for Energy Savings")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
        .navigationTitle("Smart Home Integration")
    }
    
    // Simulated function to adjust the thermostat
    func adjustThermostat() {
        print("Thermostat set to \(thermostatTemperature)°F")
    }
    
    // Simulated function to toggle the smart plug
    func toggleSmartPlug() {
        smartPlugOn.toggle()
        print("Smart Plug is now \(smartPlugOn ? "ON" : "OFF")")
    }
    
    // Simulated function to automate energy efficiency
    func automateEnergyEfficiency() {
        thermostatTemperature = 68.0
        smartPlugOn = false
        print("Energy efficiency mode activated: Thermostat set to 68°F, Smart Plug turned off")
    }
}
