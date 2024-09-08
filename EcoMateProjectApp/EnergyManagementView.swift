import SwiftUI

struct EnergyManagementView: View {
    @State private var energyData: [String] = [
        "January: 150 kWh",
        "February: 120 kWh",
        "March: 130 kWh",
        "April: 160 kWh",
        "May: 140 kWh"
    ]

    var body: some View {
        VStack {
            Text("Energy Management")
                .font(.largeTitle)
                .padding()

            List(energyData, id: \.self) { entry in
                Text(entry)
            }

            Button(action: {
                fetchNewData()
            }) {
                Text("Update Data")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Energy Management")
    }
    
    func fetchNewData() {
        // Simulate fetching new data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            energyData = [
                "June: 155 kWh",
                "July: 125 kWh",
                "August: 135 kWh",
                "September: 165 kWh",
                "October: 145 kWh"
            ]
        }
    }
}

