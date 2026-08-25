//
//  AudioClipLocalization.swift
//  AudioEditorKit
//

import Foundation

/// Supplies an explicit language to the UIKit editor and its lower-level audio
/// processing targets. This is separate from SwiftUI's Locale environment so
/// hosts can support an in-app language switch without changing the process
/// locale.
public enum AudioClipLocalization {
    private static let lock = NSLock()
    private static var _preferredLanguageCode: String?

    public static func setPreferredLanguageCode(_ languageCode: String?) {
        lock.lock()
        _preferredLanguageCode = languageCode
        lock.unlock()
    }

    public static var preferredLanguageCode: String? {
        lock.lock()
        defer { lock.unlock() }
        return _preferredLanguageCode
    }

    public static func localizedString(
        _ value: String.LocalizationValue,
        in bundle: Bundle,
        table: String? = nil
    ) -> String {
        guard let preferredLanguageCode,
              let languageBundle = languageBundle(
                  for: preferredLanguageCode,
                  in: bundle
              ) else {
            return String(localized: value, table: table, bundle: bundle)
        }

        return String(localized: value, table: table, bundle: languageBundle)
    }

    private static func languageBundle(
        for languageCode: String,
        in bundle: Bundle
    ) -> Bundle? {
        var candidates = [languageCode]
        let normalizedCode = languageCode.replacingOccurrences(of: "_", with: "-")
        if normalizedCode != languageCode {
            candidates.append(normalizedCode)
        }

        if normalizedCode == "zh" {
            candidates.append("zh-Hans")
        }

        if let baseLanguageCode = Locale(identifier: normalizedCode).languageCode,
           !candidates.contains(baseLanguageCode) {
            candidates.append(baseLanguageCode)
        }

        for candidate in candidates {
            guard let path = bundle.path(forResource: candidate, ofType: "lproj"),
                  let languageBundle = Bundle(path: path) else {
                continue
            }
            return languageBundle
        }

        return nil
    }
}
