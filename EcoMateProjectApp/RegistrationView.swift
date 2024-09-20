import SwiftUI

struct RegistrationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var energyGoal = ""
    @State private var solarGoal = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("EcoMate Registration")
                .font(.largeTitle)
                .foregroundColor(.green)
                .padding()
            
            TextField("Enter your name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            TextField("Enter your email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            TextField("Enter energy goal (kWh)", text: $energyGoal)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            TextField("Enter solar goal", text: $solarGoal)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            NavigationLink(destination: ProfileView(userName: name, energyGoal: energyGoal, solarGoal: solarGoal)) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
        }
        .padding()
    }
}
