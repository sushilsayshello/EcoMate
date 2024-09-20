import SwiftUI
import Charts

struct SolarAdoptionView: View {
    @State private var solarPotential: Double = 0.0
    @State private var address: String = ""
    @State private var potentialHistory: [SolarEntry] = []
    @State private var isAddressValid: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            Text("Solar Adoption")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.yellow)
                .padding()
                .background(Color.blue.opacity(0.8))
                .cornerRadius(10)
                .shadow(radius: 5)

            // Address Input with Validation
            VStack(alignment: .leading, spacing: 10) {
                TextField("Enter your address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(isAddressValid ? Color.white : Color.red.opacity(0.3))
                    .cornerRadius(10)

                if !isAddressValid {
                    Text("Invalid address. Please enter a valid one.")
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.leading)
                }
            }
            .padding()

            // Check Solar Potential Button
            Button(action: {
                if validateAddress() {
                    checkSolarPotential()
                }
            }) {
                Text("Check Solar Potential")
                    .bold()
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Display Solar Potential
            Text("Estimated Savings: \(solarPotential, specifier: "%.2f") kWh/year")
                .font(.title3)
                .foregroundColor(.blue)
                .padding()
                .background(Color.yellow.opacity(0.2))
                .cornerRadius(10)

            // History of Solar Potential Checks (with Chart)
            VStack(spacing: 10) {
                Text("Solar Potential History")
                    .font(.headline)
                    .foregroundColor(.blue)

                Chart(potentialHistory) { entry in
                    LineMark(
                        x: .value("Time", entry.timestamp, unit: .second),
                        y: .value("Savings", entry.potential)
                    )
                    .foregroundStyle(Color.purple.gradient)
                }
                .frame(height: 200)
                .background(Color.green.opacity(0.2))
                .cornerRadius(10)
                .padding()
            }
        }
        .navigationTitle("Solar Adoption")
        .padding()
    }
    
    // Simulate checking solar potential
    func checkSolarPotential() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            solarPotential = Double.random(in: 500...1500) // Example value
            let newEntry = SolarEntry(potential: solarPotential, timestamp: Date())
            potentialHistory.append(newEntry)
        }
    }

    // Validate Address (Dummy validation for simplicity)
    func validateAddress() -> Bool {
        if address.isEmpty {
            isAddressValid = false
            return false
        }
        isAddressValid = true
        return true
    }
}

// Solar Potential History Entry Model
struct SolarEntry: Identifiable {
    let id = UUID()
    let potential: Double
    let timestamp: Date
}

