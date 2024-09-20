import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // No extra spacing between buttons
                NavigationLink(destination: WelcomeView()) {
                    Label("Welcome", systemImage: "house.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: EnergyManagementView()) {
                    Label("Energy Management", systemImage: "bolt.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: SolarAdoptionView()) {
                    Label("Solar Adoption", systemImage: "sun.max.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: FeedbackView()) {
                    Label("Feedback", systemImage: "message.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: RegistrationView()) {
                    Label("User Registration", systemImage: "pencil")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: ProfileView(userName: "John Doe", energyGoal: "500", solarGoal: "1000")) {
                    Label("User Profile", systemImage: "person.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: AchievementsView()) {
                    Label("Achievements", systemImage: "star.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: EnergySavingsSimulatorView()) {
                    Label("Energy Savings Simulator", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: AlertsView()) {
                    Label("Real-Time Alerts", systemImage: "bell.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: SmartHomeIntegrationView()) {
                    Label("Smart Home Integration", systemImage: "house.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("Dashboard") // Fixed title to Dashboard
            .background(Color(.systemGray6))
        }
    }
}

// Welcome Page
struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to EcoMate!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .padding()

            Text("EcoMate is your all-in-one platform to manage energy consumption, adopt solar solutions, and monitor environmental sustainability. Use the menu to explore various features.")
                .multilineTextAlignment(.center)
                .padding()

            Image(systemName: "leaf.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .foregroundColor(.green)
                .padding()

            Spacer()
        }
        .padding()
    }
}
