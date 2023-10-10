import SwiftSyntax
import SwiftSyntaxBuilder

extension InheritanceClauseSyntax {
    func inherits(_ type: String) -> Bool {
        inheritedTypes.contains { $0.type.as(IdentifierTypeSyntax.self)?.name.text == type }
    }
}

