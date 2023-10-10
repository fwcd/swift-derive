// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Synthesizes a `CustomStringConvertible` conformance for `RawRepresentable`.
@attached(extension, conformances: CustomStringConvertible, names: named(description))
public macro DeriveRawRepresentableDescription() = #externalMacro(module: "DeriveMacros", type: "DeriveRawRepresentableDescriptionMacro")

// TODO: DeriveOptionSetDescription
