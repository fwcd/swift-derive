import SwiftSyntax
import SwiftSyntaxBuilder

extension DeclModifierSyntax {
    var isStatic: Bool {
        name.tokenKind == .keyword(.static)
    }
}
