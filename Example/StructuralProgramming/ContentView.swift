import Structural
import StructuralUI
import SwiftUI

struct ContentView: View {

    private let book = Book(
        title: "Thinking in SwiftUI", 
        published: .now,
        authors: "Florian and Chris",
        update: .distantPast)

    var body: some View {
        book.to.view
            .padding()
    }
}

#Preview {
    ContentView()
}
