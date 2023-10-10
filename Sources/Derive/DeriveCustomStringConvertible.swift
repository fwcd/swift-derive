/// Synthesizes a `CustomStringConvertible` conformance for `RawRepresentable`.
@attached(extension, conformances: CustomStringConvertible, names: named(description))
public macro DeriveCustomStringConvertible() = #externalMacro(module: "DeriveMacros", type: "DeriveCustomStringConvertibleMacro")
