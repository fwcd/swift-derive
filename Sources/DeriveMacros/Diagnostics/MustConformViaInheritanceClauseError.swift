import SwiftSyntax
import SwiftDiagnostics

struct MustConformViaInheritanceClauseError: DiagnosticMessage {
    let baseType: String
    let protocolType: String
    
    var message: String { "\(baseType) must conform to \(protocolType) directly via an inheritance clause" }
    var diagnosticID: MessageID { .init(domain: "Derive", id: "MustConformViaInheritanceClauseError") }
    var severity: DiagnosticSeverity { .error }
}
