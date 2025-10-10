//
//  AudioEditorKitFonts.swift
//  AudioEditorKit
//
//  Created by GitHub Copilot on 2025/10/11.
//

import UIKit

public enum AudioEditorKitFont {
    // Button fonts
    public static let button = UIFont.rounded(ofSize: 15, weight: .semibold)

    // Label fonts
    public static let timeLabel = UIFont.monospacedDigitSystemFont(ofSize: 46, weight: .semibold)
    public static let timeLabelPad = UIFont.monospacedDigitSystemFont(ofSize: 38, weight: .semibold)

    // HUD fonts
    public static let hudStatus = UIFont.rounded(ofTextStyle: .title3, weight: .regular)

    // Ruler fonts
    public static let rulerLabel = UIFont.monospacedDigitSystemFont(ofSize: 12.0, weight: .regular)

    // General fonts
    public static func rounded(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.rounded(ofSize: size, weight: weight)
    }

    public static func system(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: weight)
    }
}
