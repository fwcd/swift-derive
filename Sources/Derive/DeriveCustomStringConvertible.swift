// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Synthesizes a `CustomStringConvertible` conformance for `RawRepresentable`.
@attached(extension, conformances: CustomStringConvertible, names: named(description))
public macro DeriveCustomStringConvertible() = #externalMacro(module: "DeriveMacros", type: "DeriveCustomStringConvertibleMacro")

// TODO: DeriveOptionSetDescription
