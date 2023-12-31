import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

struct StructuralError: Error {
    let message: String
}

public struct StructuralMacro: MemberMacro {

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            throw StructuralError(message: "Can only be applied to struct types.")
        }

        let storedProperties = try declaration
            .memberBlock.members
            .map(\.decl)
            .compactMap { try $0.storedProperty }

        let typeDecl: DeclSyntax = storedProperties
            .reversed()
            .reduce("Empty") { result, property in
                "LinkedList<Property<\(property.1)>, \(result)>"
            }

        let propertiesDecl: DeclSyntax = storedProperties
            .reversed()
            .reduce("Empty()") { result, property in
                "LinkedList(head: Property(name: \(literal: property.0.text), value: \(property.0)), tail: \(result))"
            }

        let fromDecl = zip(storedProperties.indices, storedProperties).map { (index, property) in
            let tails = Array(repeating: ".tail", count: index).joined()
            return "\(property.0): structure.properties\(tails).head.value"
        }.joined(separator: ", ")

        return [
            "typealias Structure = Struct<\(typeDecl)>",
            """
            var to: Structure {
                Struct(name: \(literal: structDecl.name.text), properties: \(propertiesDecl))
            }
            static func from(_ structure: Structure) -> Self {
                Self(\(raw: fromDecl))
            }
            """,
        ]
    }
}

extension DeclSyntax {
    var storedProperty: (TokenSyntax, TypeSyntax)? {
        get throws {
            guard let variable = self.as(VariableDeclSyntax.self) else { return nil }
            guard variable.bindings.count == 1 else { throw StructuralError(message: "Multiple bindings are not supported.") }
            let binding = variable.bindings.first!
            guard binding.accessorBlock == nil else { return nil }
            guard let id = binding.pattern.as(IdentifierPatternSyntax.self) else { throw StructuralError(message: "Only identifier patterns supported.") }
            guard let type = binding.typeAnnotation?.type else { throw StructuralError(message: "Only properties with explicit types supported.") }
            return (id.identifier, type)
        }
    }
}

@main
struct StructuralPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StructuralMacro.self,
    ]
}
