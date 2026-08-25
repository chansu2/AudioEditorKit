//
//  AudioEditorSheet.swift
//  AudioEditorKit
//
//  Created by Yanan Li on 2025/5/1.
//

import SwiftUI

public extension View {
    @available(iOS 16.0, macCatalyst 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated func audioEditorSheet(
        isPresented: Binding<Bool>,
        audio: AudioFileRepresentable,
        onAudioChanged: @escaping AudioClipController.AudioEditorCompletionHandler,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        sheet(isPresented: isPresented, onDismiss: onDismiss) {
            AudioEditor(audio: audio, completion: onAudioChanged)
        }
    }

    @available(iOS 16.0, macCatalyst 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated func audioEditorFullScreenCover(
        isPresented: Binding<Bool>,
        audio: AudioFileRepresentable,
        onAudioChanged: @escaping AudioClipController.AudioEditorCompletionHandler,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
            AudioEditor(audio: audio, completion: onAudioChanged)
        }
    }
}

// MARK: - Auxiliary

private struct AudioEditor: UIViewControllerRepresentable {
    var audio: AudioFileRepresentable
    var completion: AudioClipController.AudioEditorCompletionHandler

    func makeUIViewController(context _: Context) -> UINavigationController {
        let isPad = UIDevice.current.userInterfaceIdiom == .pad
        let storyboard = UIStoryboard(
            name: isPad ? "AudioClipController_iPad" : "AudioClipController",
            bundle: AudioClipControllerBundle.bundle
        )
        let navController = storyboard.instantiateInitialViewController() as! UINavigationController
        // Fix(P1): .formSheet conflicts with the parent SwiftUI .fullScreenCover context,
        // causing UIKit safeAreaInsets contamination and layout shift on dismiss.
        // Use .fullScreen to match the parent presentation style.
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .coverVertical

        return navController
    }

    func updateUIViewController(_ controller: UINavigationController, context _: Context) {
        let controller = controller.viewControllers.first as! AudioClipController
        controller.audio = audio
        controller.completionHandler = completion
    }
}
