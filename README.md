# SFSymbolsKit
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)
![SwiftPM Compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)
![Platforms: iOS, macOS, watchOS, tvOS](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-blue)

A utility package for accessing SF Symbols and their categories.

Supports all SFSymbols versions through 4.1 (iOS 16.1, macOS 13.0, tvOS 16.1, watchOS 9.1).

## Usage

### Easier symbols access

Without SFSymbolsKit 😰
- Pass a string to the initializer, which is prone to error
- No compile time checks for errors
```
Image(systemName: "square.grid.2x2")
```
With SFSymbolsKit 🤩
- No typos 
- Compile time check for availability
- Xcode can autocomplete
```
Image(sfSymbol: .squareGrid2X2)
```

### SF Symbols App
Build your own version of the SF Symbols app using the included symbol categories and their symbols.

```
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(SFSymbolCategory.allCases) { category in
                NavigationLink {
                    List(category.symbols) {
                        Image(sfSymbol: $0)
                            .help($0.rawValue)
                    }
                } label: {
                    HStack {
                        Image(sfSymbol: category.icon)
                        Text(category.name)
                    }
                }

            }
        }
    }
}

```

## Installation

Install using Swift Package Manager:
```
https://github.com/tweilu/SFSymbolsKit
```

## Features

### `SFSymbol` enum

```
enum SFSymbol: String, CaseIterable {
    case ...
    
    /// An array of alternate names and the raw value
    var searchTerms: [String]
    /// The unicode string value
    var string: String?
}
```
Each symbol is marked `@available` with the platforms that support it.

### `SFSymbolCategory`

The default categories as displayed in the SF Symbols app are listed in `SFSymbolCategory.allCases` as the following struct:
```
struct SFSymbolCategory {
    let name: String
    let icon: SFSymbol
    let symbols: [SFSymbol]
}
```

### Image Convenience initializers

#### SwiftUI
```
Image(sfSymbol: .squareGrid2X2)
```
#### UIKit
```
UIImage(sfSymbol: .squareGrid2X2)
```
#### AppKit
```
NSImage(sfSymbol: .squareGrid2X2)
```

## SFSymbolsGenerator

This package also includes the command line tool for generating the source files for `SFSymbolsKit`. It uses a copy of the resources found in macOS at `/System/Library/CoreServices/CoreGlyphs.bundle/Contents/Resources`.

## License

SFSymbolsKit is released under the MIT License. See [LICENSE](https://github.com/tweilu/SFSymbolsKit/blob/main/LICENSE) for details.
