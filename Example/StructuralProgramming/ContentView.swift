import Structural
import StructuralUI
import SwiftUI

struct ContentView: View {

    private let book = Book(
        title: "Thinking in SwiftUI", 
        published: .now)

    var body: some View {
        book.to.view
            .padding()
    }
}

#Preview {
    ContentView()
}
