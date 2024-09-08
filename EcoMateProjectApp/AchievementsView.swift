import SwiftUI

struct AchievementsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Achievements")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.purple)
            
            HStack(spacing: 20) {
                VStack {
                    Text("🏅")
                        .font(.largeTitle)
                    Text("Energy Saver")
                        .font(.headline)
                        .foregroundColor(.green)
                    Text("100 kWh saved")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("🏅")
                        .font(.largeTitle)
                    Text("Solar Expert")
                        .font(.headline)
                        .foregroundColor(.yellow)
                    Text("75% Efficiency")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(20)
        }
        .padding()
    }
}
