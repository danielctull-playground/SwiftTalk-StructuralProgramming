import Foundation
import Structural

struct Book {
    var title: String
    var published: Date
}

extension Book {
    typealias Structure = Struct<List<Property<String>, List<Property<Date>, Empty>>>

    var to: Structure {
        Struct(
            name: "Book",
            properties: List(
                head: Property(
                    name: "title",
                    value: title),
                tail: List(
                    head: Property(
                        name: "published",
                        value: published),
                    tail: Empty())))
    }

    static func from(_ s: Structure) -> Book {
        Book(
            title: s.properties.head.value,
            published: s.properties.tail.head.value
        )
    }
}
