
public struct Struct<Properties> {
    public let name: String
    public let properties: Properties

    public init(
        name: String,
        properties: Properties
    ) {
        self.name = name
        self.properties = properties
    }
}

public struct Property<Value> {
    
    public let name: String
    public let value: Value

    public init(
        name: String,
        value: Value
    ) {
        self.name = name
        self.value = value
    }
}

public struct List<Head, Tail> {
    public let head: Head
    public let tail: Tail

    public init(
        head: Head,
        tail: Tail
    ) {
        self.head = head
        self.tail = tail
    }
}

public struct Empty {
    public init() {}
}
