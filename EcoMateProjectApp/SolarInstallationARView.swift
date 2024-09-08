import SwiftUI

struct SolarPanelARView: View {
    @State private var isPanelPlaced: Bool = false
    @State private var energySavings: Double = 0.0
    @State private var showAR: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Solar Panel Installation (AR)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .shadow(radius: 5)

            // AR Simulation
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 300)
                    .overlay(
                        VStack {
                            Text(showAR ? "AR View Active" : "Preview of AR Installation")
                                .font(.headline)
                                .foregroundColor(.black)
                            if showAR {
                                // Simulated panel placement feedback
                                if isPanelPlaced {
                                    Text("Panel Placed!")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.green)
                                } else {
                                    Text("Move around to place panel")
                                        .foregroundColor(.orange)
                                }
                            } else {
                                Text("Tap 'Start AR' to view panels")
                                    .foregroundColor(.blue)
                            }
                        }
                    )

            }

            // Toggle AR Button
            Button(action: {
                showAR.toggle()
                if !showAR {
                    isPanelPlaced = false // Reset panel placement on exit
                }
            }) {
                Text(showAR ? "Exit AR Mode" : "Start AR")
                    .font(.headline)
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Simulated Panel Placement and Energy Savings
            if showAR {
                Button(action: {
                    placeSolarPanel()
                }) {
                    Text("Place Solar Panel")
                        .font(.headline)
                        .bold()
                        .padding()
                        .background(isPanelPlaced ? Color.gray : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                // Energy Savings Display
                if isPanelPlaced {
                    VStack {
                        Text("Solar Panels Installed!")
                            .font(.headline)
                            .foregroundColor(.green)

                        Text("Estimated Savings: \(energySavings, specifier: "%.2f") kWh/year")
                            .font(.title2)
                            .foregroundColor(.orange)
                            .padding()
                            .background(Color.yellow.opacity(0.2))
                            .cornerRadius(10)
                            .animation(.spring(), value: energySavings)
                    }
                    .transition(.slide)
                    .padding()
                }
            }
        }
        .padding()
        .navigationTitle("Solar Installation AR")
    }

    // Simulated solar panel placement logic
    func placeSolarPanel() {
        if !isPanelPlaced {
            isPanelPlaced = true
            energySavings = Double.random(in: 500...1500) // Example energy savings
        }
    }
}
