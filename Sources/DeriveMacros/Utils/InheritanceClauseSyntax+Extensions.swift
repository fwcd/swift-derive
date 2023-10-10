import SwiftSyntax
import SwiftSyntaxBuilder

extension InheritanceClauseSyntax {
    var inheritedTypeNames: [String] {
        inheritedTypes.compactMap { $0.type.as(IdentifierTypeSyntax.self)?.name.text }
    }
}

