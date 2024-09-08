import SwiftUI

struct FeedbackView: View {
    @State private var feedback: String = ""

    var body: some View {
        VStack {
            Text("Feedback")
                .font(.largeTitle)
                .padding()

            TextEditor(text: $feedback)
                .border(Color.gray, width: 1)
                .padding()

            Button(action: {
                submitFeedback()
            }) {
                Text("Submit Feedback")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Feedback")
    }
    
    func submitFeedback() {
        // Simulate feedback submission
        print("Feedback submitted: \(feedback)")
        feedback = ""
    }
}

