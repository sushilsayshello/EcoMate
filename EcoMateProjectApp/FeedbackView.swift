import SwiftUI

struct FeedbackView: View {
    @State private var feedback: String = ""
    @State private var characterCount: Int = 0
    let maxCharacterLimit = 250

    var body: some View {
        VStack(spacing: 20) {
            Text("We Value Your Feedback")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
                .shadow(radius: 5)

            // Feedback Text Editor with Character Count
            TextEditor(text: $feedback)
                .frame(height: 150)
                .border(Color.gray, width: 1)
                .padding()
                .onChange(of: feedback) {
                    characterCount = feedback.count
                    if feedback.count > maxCharacterLimit {
                        feedback = String(feedback.prefix(maxCharacterLimit))
                    }
                }

            Text("\(characterCount)/\(maxCharacterLimit) characters")
                .font(.caption)
                .foregroundColor(characterCount > maxCharacterLimit ? .red : .gray)

            // Submit Button
            Button(action: {
                submitFeedback()
            }) {
                Text("Submit Feedback")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(feedback.isEmpty)
            .padding()
        }
        .padding()
        .navigationTitle("Feedback")
        .background(Color.blue.opacity(0.1))
    }

    func submitFeedback() {
        // Simulate feedback submission
        print("Feedback submitted: \(feedback)")
        feedback = ""
        characterCount = 0
    }
}


