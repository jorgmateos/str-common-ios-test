import STRCommonSkp
import SwiftUI

@main
struct STRCommonTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var message = ""
    @State private var todoText = ""
    private let helloWorldUseCase: HelloWorldUseCaseProtocol = HelloWorldUseCase()
    private let todoUseCase: TodoUseCaseProtocol = TodoUseCase()

    var body: some View {
        VStack(spacing: 16) {
            Button("Execute HelloWorldUseCase") {
                message = helloWorldUseCase.execute()
            }
            .buttonStyle(.borderedProminent)
            Text(message)
                .accessibilityIdentifier("messageLabel")

            Button("Execute TodoUseCase") {
                Task { await loadTodo(id: Int.random(in: 1...200)) }
            }
            .buttonStyle(.borderedProminent)
            Text(todoText)
                .accessibilityIdentifier("todoLabel")
        }
        .padding()
        .task {
            message = helloWorldUseCase.execute()
            await loadTodo(id: 1)
        }
    }

    private func loadTodo(id: Int) async {
        do {
            let todo = try await todoUseCase.execute(id: id)
            todoText = "#\(todo.id) \(todo.title) \(todo.isCompleted ? "✅" : "⏳")"
        } catch {
            todoText = "Error: \(error)"
        }
        print("TodoUseCase -> \(todoText)")
    }
}

#Preview {
    ContentView()
}
