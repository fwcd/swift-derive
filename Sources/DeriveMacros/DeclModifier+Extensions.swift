//
//  File.swift
//  
//
//  Created on 10.10.23
//

import SwiftSyntax
import SwiftSyntaxBuilder

extension DeclModifierSyntax {
    var isStatic: Bool {
        name.tokenKind == .keyword(.static)
    }
}
