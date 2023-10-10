import Derive

// TODO: Move to test

@DeriveRawRepresentableDescription
struct Weather: Equatable, RawRepresentable {
    let rawValue: Int

    static let sunny = Self(rawValue: 0)
    static let rainy = Self(rawValue: 1)
    static let cloudy = Self(rawValue: 2)
}

print("The weather is \(Weather.sunny)")
print("...or maybe \(Weather.cloudy)")
