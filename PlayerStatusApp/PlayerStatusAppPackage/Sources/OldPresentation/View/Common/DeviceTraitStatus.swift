//
//  DeviceTraitStatus.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/13.
//

import SwiftUI

/// screen size (regular or compact) width: _, height: _
enum DeviceTraitStatus {
    case wRhR
    case wChR
    case wRhC
    case wChC

    init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {
        switch (hSizeClass, vSizeClass) {
        case (.regular, .regular):
            self = .wRhR
        case (.compact, .regular):
            self = .wChR
        case (.regular, .compact):
            self = .wRhC
        case (.compact, .compact):
            self = .wChC
        default:
            self = .wChR
        }
    }
}
