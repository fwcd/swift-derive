import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct DerivePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DeriveCustomStringConvertibleMacro.self,
    ]
}
