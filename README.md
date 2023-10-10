# Swift Derive

A set of useful conformance extension macros for Swift.

## Example

```swift
import Derive

@DeriveRawRepresentableDescription
struct Weather: Equatable, RawRepresentable {
    let rawValue: Int

    static let sunny = Self(rawValue: 0)
    static let rainy = Self(rawValue: 1)
    static let cloudy = Self(rawValue: 2)
}
```

generates

```swift
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
            return "Weather(rawValue: \(rawValue))"
        }
    }
}
```

## Credits

This library would not have been possible without:

- [Swift AST Explorer](https://swift-ast-explorer.com/), an incredibly useful tool for inspecting the [`SwiftSyntax`](https://github.com/apple/swift-syntax) representation of source code
- [The `generate-swift-syntax` templates](https://github.com/apple/swift-syntax/tree/main/CodeGeneration/Sources/generate-swift-syntax/templates), providing up-to-date, real world examples of `SwiftSyntaxBuilder` in practice
