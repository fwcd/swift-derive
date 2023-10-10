import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

extension DeclGroupSyntax {
    func requireConformances(
        to protocolTypes: [String],
        type: some TypeSyntaxProtocol,
        in context: some MacroExpansionContext
    ) -> Bool {
        var success = true
        for requiredConformance in protocolTypes {
            if !(inheritanceClause?.inherits(requiredConformance) ?? false) {
                context.diagnose(.init(
                    node: inheritanceClause?.root ?? root,
                    message: MustConformViaInheritanceClauseError(
                        baseType: "\(type.trimmed)",
                        protocolType: requiredConformance
                    )
                ))
                success = false
            }
        }
        return success
    }
}
