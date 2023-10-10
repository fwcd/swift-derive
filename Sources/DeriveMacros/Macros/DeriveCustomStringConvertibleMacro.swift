import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `DeriveCustomStringConvertible` macro.
public struct DeriveCustomStringConvertibleMacro: ExtensionMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        guard declaration.requireConformances(to: ["RawRepresentable", "Equatable"], type: type, in: context) else {
            return []
        }
        
        return [try ExtensionDeclSyntax("extension \(type.trimmed): CustomStringConvertible") {
            try VariableDeclSyntax("var description: String") {
                try SwitchExprSyntax("switch self") {
                    let memberDecls = declaration.memberBlock.members
                        .compactMap { $0.decl.as(VariableDeclSyntax.self) }
                        .filter {
                            // TODO: We should use a more fine-grained heuristic that doesn't match all static members
                            $0.modifiers.contains { $0.isStatic }
                        }
                    
                    for decl in memberDecls {
                        if let identifier = decl.bindings.first?.pattern.as(IdentifierPatternSyntax.self) {
                            SwitchCaseSyntax(
                                """
                                case .\(identifier.trimmed):
                                    return "\(type.trimmed).\(identifier.trimmed)"
                                """
                            )
                        }
                    }
                    
                    SwitchCaseSyntax(
                        """
                        default:
                            return "\(type.trimmed)(rawValue: \\(rawValue))"
                        """
                    )
                }
            }
        }]
    }
}
