
import SwiftUI

public protocol ToView {
    associatedtype V: View
    @ViewBuilder var view: V { get }
}

// MARK: - StructuralProgramming Conformances

import StructuralProgramming

extension Struct: ToView where Properties: ToView {
    public var view: some View {
        VStack {
            Text(name).bold()
            properties.view
        }
    }
}

extension Property: ToView where Value: ToView {
    public var view: some View {
        LabeledContent(name) {
            value.view
        }
    }
}

extension StructuralProgramming.List: ToView where Head: ToView, Tail: ToView {
    public var view: some View {
        head.view
        tail.view
    }
}

extension Empty: ToView {
    public var view: some View { EmptyView() }
}

// MARK: - Foundation Conformances

import Foundation

extension String: ToView {
    public var view: some View {
        Text(self)
    }
}

extension Date: ToView {
    public var view: some View {
        Text(self, format: .dateTime)
    }
}
