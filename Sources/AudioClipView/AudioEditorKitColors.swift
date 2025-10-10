//
//  AudioEditorKitColors.swift
//  AudioClipView
//
//  Created by GitHub Copilot on 2025/10/11.
//

import UIKit

public enum AudioEditorKitColor {
    // Primary colors
    public static let primary = UIColor.systemBlue
    public static let secondary = UIColor.systemGray
    public static let accent = UIColor.systemOrange

    // Semantic colors
    public static let success = UIColor.systemGreen
    public static let warning = UIColor(named: "WarningColor", in: .module, compatibleWith: nil) ?? UIColor.systemOrange
    public static let failure = UIColor(named: "FailureColor", in: .module, compatibleWith: nil) ?? UIColor.systemRed
    public static let recoverable = UIColor(named: "RecoverableColor", in: .module, compatibleWith: nil) ?? UIColor.systemYellow
    public static let mark = UIColor(named: "MarkColor", in: .module, compatibleWith: nil) ?? UIColor.systemPurple

    // UI element colors
    public static let background = UIColor.systemBackground
    public static let secondaryBackground = UIColor.secondarySystemBackground
    public static let tertiaryBackground = UIColor.tertiarySystemBackground

    public static let label = UIColor.label
    public static let secondaryLabel = UIColor.secondaryLabel
    public static let tertiaryLabel = UIColor.tertiaryLabel

    public static let separator = UIColor.separator
    public static let opaqueSeparator = UIColor.opaqueSeparator

    // Waveform colors
    public static let waveformForeground = UIColor.label
    public static let waveformBackground = UIColor.quaternarySystemFill
    public static let rulerColor = UIColor.tertiarySystemFill
    public static let rulerLabelColor = UIColor.tertiaryLabel
}
