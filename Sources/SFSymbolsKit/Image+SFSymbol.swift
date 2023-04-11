//
//  Image+SFSymbol.swift
//  
//
//  Created by Tiffany Lu on 4/10/23.
//

import SwiftUI

@available(macOS 11.0, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public extension Image {
    init(sfSymbol: SFSymbol) {
        self = Image(systemName: sfSymbol.rawValue)
    }
}

#if canImport(AppKit)
@available(macOS 11.0, *)
public extension NSImage {
    convenience init?(sfSymbol: SFSymbol, accessibilityDescription: String? = nil) {
        self.init(systemSymbolName: sfSymbol.rawValue, accessibilityDescription: accessibilityDescription)
    }
}
#endif

#if canImport(UIKit)
public extension UIImage {
    convenience init?(sfSymbol: SFSymbol) {
        self.init(systemName: sfSymbol.rawValue)
    }
}
#endif
