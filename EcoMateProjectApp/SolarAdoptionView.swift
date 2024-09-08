import SwiftUI

struct SolarAdoptionView: View {
    @State private var solarPotential: Double = 0.0
    @State private var address: String = ""

    var body: some View {
        VStack {
            Text("Solar Adoption")
                .font(.largeTitle)
                .padding()

            TextField("Enter your address", text: $address)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                checkSolarPotential()
            }) {
                Text("Check Solar Potential")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Text("Estimated Savings: \(solarPotential, specifier: "%.2f") kWh/year")
                .padding()
        }
        .navigationTitle("Solar Adoption")
    }
    
    func checkSolarPotential() {
        // Simulate solar potential check
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            solarPotential = Double.random(in: 500...1500) // Example value
        }
    }
}
