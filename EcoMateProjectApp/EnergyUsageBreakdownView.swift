import SwiftUI
import Charts

struct EnergyUsageBreakdownView: View {
    @State private var selectedCategory: String = "Heating"
    @State private var selectedTimePeriod: String = "Last 7 Days"
    
    // Simulated energy usage data for categories
    let categories = ["Heating", "Cooling", "Appliances", "Lighting", "Others"]
    let timePeriods = ["Last 7 Days", "Last 30 Days", "Last 12 Months"]
    
    // Simulated usage data (kWh) for historical comparison
    let energyData: [EnergyUsage] = [
        EnergyUsage(category: "Heating", usage: [50, 60, 40, 45, 55, 50, 52]),
        EnergyUsage(category: "Cooling", usage: [30, 35, 25, 28, 32, 33, 29]),
        EnergyUsage(category: "Appliances", usage: [20, 22, 18, 19, 21, 20, 19]),
        EnergyUsage(category: "Lighting", usage: [10, 12, 8, 9, 11, 10, 9]),
        EnergyUsage(category: "Others", usage: [5, 7, 4, 5, 6, 6, 5])
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Energy Usage Breakdown")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            // Dropdown for selecting category
            VStack(alignment: .leading) {
                Text("Select Category")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
            }
            
            // Dropdown for selecting time period
            VStack(alignment: .leading) {
                Text("Select Time Period")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Picker("Time Period", selection: $selectedTimePeriod) {
                    ForEach(timePeriods, id: \.self) { period in
                        Text(period)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.orange.opacity(0.2))
                .cornerRadius(10)
            }
            
            // Dynamic Energy Usage Chart
            Chart(energyDataForSelectedCategory(), id: \.self) { usage in
                LineMark(
                    x: .value("Day", usage.index),
                    y: .value("Usage", usage.value)
                )
                .foregroundStyle(Color.purple.gradient)
            }
            .frame(height: 300)
            .padding()
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(10)
            .shadow(radius: 5)
            
            // Historical comparison
            Text("Historical Comparison for \(selectedCategory)")
                .font(.headline)
                .padding()
            
            List(energyDataForSelectedCategory()) { usage in
                HStack {
                    Text("Day \(usage.index + 1)")
                    Spacer()
                    Text("\(usage.value, specifier: "%.2f") kWh")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
            .listStyle(.plain)
        }
        .padding()
        .navigationTitle("Energy Breakdown")
    }
    
    // Filter energy data for the selected category
    func energyDataForSelectedCategory() -> [UsageEntry] {
        guard let selectedUsage = energyData.first(where: { $0.category == selectedCategory }) else {
            return []
        }
        
        // Simulate data based on time period (for demo purposes, showing weekly data)
        return selectedUsage.usage.enumerated().map { index, value in
            UsageEntry(index: index, value: value)
        }
    }
}

struct EnergyUsage: Identifiable {
    let id = UUID()
    let category: String
    let usage: [Double]
}

struct UsageEntry: Identifiable, Hashable {
    let id = UUID()
    let index: Int
    let value: Double
}

