// Copyright 2022 Pera Wallet, LDA

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//   CollectibleMediaImagePreviewViewModel.swift

import Foundation
import UIKit
import MacaroonUIKit
import MacaroonURLImage

protocol CollectibleMediaImagePreviewViewModel: ViewModel {
    var image: ImageSource? { get set }
    var isOwned: Bool { get set }
}

extension CollectibleMediaImagePreviewViewModel {
    mutating func bindOwned(
        _ asset: CollectibleAsset
    ) {
        isOwned = asset.isOwned
    }

    func getPlaceholder(
        _ aPlaceholder: String
    ) -> ImagePlaceholder {
        let font = Fonts.DMSans.regular.make(19)
        let lineHeightMultiplier = 1.13

        let placeholderText: EditText = .attributedString(
            aPlaceholder.attributed([
                .font(font),
                .lineHeightMultiplier(lineHeightMultiplier, font),
                .paragraph([
                    .textAlignment(.center),
                    .lineBreakMode(.byWordWrapping),
                    .lineHeightMultiple(lineHeightMultiplier)
                ])
            ])
        )

        return ImagePlaceholder(
            image: nil,
            text: placeholderText
        )
    }
}
