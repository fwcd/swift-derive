import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(DeriveMacros)
import DeriveMacros

let testMacros: [String: Macro.Type] = [
    "DeriveRawRepresentableDescription": DeriveRawRepresentableDescriptionMacro.self,
]
#endif

final class DeriveTests: XCTestCase {
    func testMacro() throws {
        #if canImport(DeriveMacros)
        let structDecl = """
            struct Weather: Equatable, RawRepresentable {
                let rawValue: Int
            
                static let sunny = Self(rawValue: 0)
                static let rainy = Self(rawValue: 1)
                static let cloudy = Self(rawValue: 2)
            }
            """
        
        assertMacroExpansion(
            """
            @DeriveRawRepresentableDescription
            \(structDecl)
            """,
            expandedSource: """
            \(structDecl)
            
            extension Weather: CustomStringConvertible {
                var description: String {
                    switch self {
                    case .sunny:
                        return "Weather.sunny"
                    case .rainy:
                        return "Weather.rainy"
                    case .cloudy:
                        return "Weather.cloudy"
                    default:
                        return "Weather(rawValue: \\(rawValue))"
                    }
                }
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
