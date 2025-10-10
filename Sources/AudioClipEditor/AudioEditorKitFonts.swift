//
//  AudioEditorKitFonts.swift
//  AudioClipEditor
//
//  Created by GitHub Copilot on 2025/10/11.
//

import UIKit

public enum AudioEditorKitFont {
    public static let button = UIFont.rounded(ofSize: 15, weight: .semibold)
    public static let timeLabel = UIFont.monospacedDigitSystemFont(ofSize: 46, weight: .semibold)
    public static let timeLabelPad = UIFont.monospacedDigitSystemFont(ofSize: 38, weight: .semibold)
    public static let hudStatus = UIFont.rounded(ofTextStyle: .title3, weight: .regular)
    public static let rulerLabel = UIFont.monospacedDigitSystemFont(ofSize: 12.0, weight: .regular)
    public static func rounded(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.rounded(ofSize: size, weight: weight)
    }

    public static func system(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: weight)
    }
}
