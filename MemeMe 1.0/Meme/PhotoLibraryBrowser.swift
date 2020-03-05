//
//  PhotoLibraryBrowser.swift
//  Meme
//
//  Created by Anastasia Petrova on 17/02/2020.
//  Copyright © 2020 Anastasia Petrova. All rights reserved.
//

import AVFoundation
import MobileCoreServices
import UIKit

enum PhotoLibraryBrowser {
    typealias Delegate =
        UIViewController
        & UINavigationControllerDelegate
        & UIImagePickerControllerDelegate
    
    static func presentPhotoLibraryBrowser(
        delegate: Delegate,
        sourceType: UIImagePickerController.SourceType
    ) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            return
        }
        let mediaUI = UIImagePickerController()
        mediaUI.sourceType = sourceType
        mediaUI.mediaTypes = [kUTTypeImage as String]
        mediaUI.delegate = delegate
        delegate.present(mediaUI, animated: true, completion: nil)
    }
}
