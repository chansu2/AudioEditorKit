//
//  AudioClipEditorLocalization.swift
//  AudioEditorKit
//

import AudioClip
import Foundation

enum AudioClipEditorLocalization {
    static func string(_ value: String.LocalizationValue) -> String {
        AudioClipLocalization.localizedString(value, in: .module)
    }
}
