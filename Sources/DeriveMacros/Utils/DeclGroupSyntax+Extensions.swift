import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

extension DeclGroupSyntax {
    func requireConformances(
        to protocolTypes: Set<String>,
        type: some TypeSyntaxProtocol,
        in context: some MacroExpansionContext
    ) -> Bool {
        let inheritedTypes: Set<String> = Set(inheritanceClause?.inheritedTypeNames ?? [])
        let missingConformances: Set<String> = protocolTypes.subtracting(inheritedTypes)
        
        for protocolType in missingConformances {
            context.diagnose(.init(
                node: inheritanceClause?.root ?? root,
                message: MustConformViaInheritanceClauseError(
                    baseType: "\(type.trimmed)",
                    protocolType: protocolType
                )
            ))
        }
        
        return missingConformances.isEmpty
    }
}
