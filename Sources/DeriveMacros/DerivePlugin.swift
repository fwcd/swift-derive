import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct DerivePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DeriveRawRepresentableDescriptionMacro.self,
    ]
}
