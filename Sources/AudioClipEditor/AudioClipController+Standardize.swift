//
//  AudioClipController+Standardize.swift
//  TRApp
//
//  Created by 82Flex on 2024/12/29.
//

import ProgressHUD
import UIKit

public extension AudioClipController {
    func standardizeContext(completion: (() -> Void)? = nil) {
        _standardizeContextPrepare()

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?._standardizeContextFinalize(completion: completion)
        }
    }

    private func _standardizeContextPrepare() {
        sharedPlayer.stop()

        ProgressHUDManager.showHUD(in: view) {
            ProgressHUD.animate(
                AudioClipEditorLocalization.string("Decoding"),
                .circleDotSpinFade,
                interaction: false
            )
            ProgressHUDManager.accessibilityAnnounce(AudioClipEditorLocalization.string("Decoding"))
        }
    }

    private func _standardizeContextFinalize(completion: (() -> Void)? = nil) {
        do {
            try context.standardize()

            DispatchQueue.main.async { [weak self] in
                self?._standardizeContextCompleted(completion: completion)
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?._standardizeContextErrorOccurred(error)
            }
        }
    }

    private func _standardizeContextCompleted(completion: (() -> Void)? = nil) {
        ProgressHUDManager.dismissHUD(in: view, completion: completion)
    }

    private func _standardizeContextErrorOccurred(_ error: Error) {
        ProgressHUD.failed(AudioClipEditorLocalization.string("Operation Failed"), delay: 2.0)
        ProgressHUDManager.accessibilityAnnounce(AudioClipEditorLocalization.string("Operation Failed"))

        view.isUserInteractionEnabled = false
        ProgressHUDManager.dismissHUD(in: view, delay: 2.0) { [weak self] in
            guard let self else { return }
            presentFatalError(message: error.localizedDescription)
            view.isUserInteractionEnabled = true
        }
    }
}
