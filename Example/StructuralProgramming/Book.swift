import Foundation
import Structural

@Structural
struct Book {
    var title: String
    var published: Date
}

extension Book {

    static func from(_ s: Structure) -> Book {
        Book(
            title: s.properties.head.value,
            published: s.properties.tail.head.value
        )
    }
}
