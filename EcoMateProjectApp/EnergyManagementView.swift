import SwiftUI
import Charts

struct EnergyManagementView: View {
    @State private var energyData: [EnergyEntry] = [
        EnergyEntry(month: "January", consumption: 150),
        EnergyEntry(month: "February", consumption: 120),
        EnergyEntry(month: "March", consumption: 130),
        EnergyEntry(month: "April", consumption: 160),
        EnergyEntry(month: "May", consumption: 140)
    ]
    
    @State private var darkMode: Bool = false
    @State private var isSorted: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Energy Management")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .shadow(radius: 5)

            // Chart Visualization
            Chart(energyData) { data in
                BarMark(
                    x: .value("Month", data.month),
                    y: .value("Consumption", data.consumption)
                )
                .foregroundStyle(Color.purple.gradient)
            }
            .frame(height: 300)
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            .shadow(radius: 5)

            // List with Sorting
            List {
                ForEach(energyData) { entry in
                    HStack {
                        Text(entry.month)
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Text("\(entry.consumption) kWh")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(.inset)
            .background(Color.white)
            .cornerRadius(10)

            HStack(spacing: 20) {
                // Toggle for Dark Mode
                Toggle(isOn: $darkMode) {
                    Text("Dark Mode")
                        .font(.headline)
                }
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(10)
                
                // Button for Sorting Data
                Button(action: {
                    isSorted.toggle()
                    energyData.sort { isSorted ? $0.consumption > $1.consumption : $0.consumption < $1.consumption }
                }) {
                    Text(isSorted ? "Sort Ascending" : "Sort Descending")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()

            // Button for fetching new data
            Button(action: {
                fetchNewData()
            }) {
                Text("Update Data")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

        }
        .navigationTitle("Energy Management")
        .preferredColorScheme(darkMode ? .dark : .light) // Toggle Dark Mode
        .padding()
    }

    func fetchNewData() {
        // Simulate fetching new data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            energyData = [
                EnergyEntry(month: "June", consumption: 155),
                EnergyEntry(month: "July", consumption: 125),
                EnergyEntry(month: "August", consumption: 135),
                EnergyEntry(month: "September", consumption: 165),
                EnergyEntry(month: "October", consumption: 145)
            ]
        }
    }
}

struct EnergyEntry: Identifiable {
    let id = UUID()
    let month: String
    let consumption: Int
}
