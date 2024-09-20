import SwiftUI
import UserNotifications

struct AlertsView: View {
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Real-Time Alerts")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            // Explanation Text
            Text("Receive notifications about energy price spikes, shortages, or environmental hazards.")
                .font(.headline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            // Simulated buttons for triggering alerts
            VStack(spacing: 20) {
                Button(action: {
                    triggerAlert(type: .priceSpike)
                }) {
                    Text("Simulate Energy Price Spike")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    triggerAlert(type: .energyShortage)
                }) {
                    Text("Simulate Energy Shortage")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    triggerAlert(type: .environmentalHazard)
                }) {
                    Text("Simulate Environmental Hazard")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            requestNotificationPermission()
        }
        .navigationTitle("Alerts")
    }
    
    // Enum for alert types
    enum AlertType {
        case priceSpike
        case energyShortage
        case environmentalHazard
    }
    
    // Function to trigger different types of alerts
    func triggerAlert(type: AlertType) {
        switch type {
        case .priceSpike:
            alertTitle = "Energy Price Spike"
            alertMessage = "The energy price has spiked by 20% today. Consider reducing your usage to save on costs."
            showAlert = true
            sendNotification(title: alertTitle, body: alertMessage)
            
        case .energyShortage:
            alertTitle = "Potential Energy Shortage"
            alertMessage = "A possible energy shortage is expected tonight due to high demand. Please conserve energy."
            showAlert = true
            sendNotification(title: alertTitle, body: alertMessage)
            
        case .environmentalHazard:
            alertTitle = "Environmental Hazard"
            alertMessage = "High pollution levels detected in your area. Consider limiting outdoor activities."
            showAlert = true
            sendNotification(title: alertTitle, body: alertMessage)
        }
    }
    
    // Function to request notification permission
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }
    
    // Function to send a notification
    func sendNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        // Trigger notification after 1 second
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

