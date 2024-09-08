import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("EcoMate Dashboard")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: EnergyManagementView()) {
                    Text("Energy Management")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: SolarAdoptionView()) {
                    Text("Solar Adoption")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: FeedbackView()) {
                    Text("Feedback")
                        .font(.title2)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("EcoMate Dashboard")
        }
    }
}
