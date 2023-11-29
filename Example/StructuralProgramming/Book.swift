import Foundation
import Structural

@Structural
struct Book {
    var title: String
    var published: Date
    var authors: String
    var update: Date
}
