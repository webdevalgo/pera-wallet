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

//   CollectibleListItemViewTheme.swift

import MacaroonUIKit
import MacaroonURLImage
import UIKit

struct CollectibleListItemViewTheme:
    LayoutSheet,
    StyleSheet {
    let image: URLImageViewStyleLayoutSheet

    var overlay: ViewStyle
    var overlayAlpha: LayoutMetric

    let title: TextStyle
    let titleAndSubtitleContentTopPadding: LayoutMetric

    let subtitle: TextStyle

    let bottomLeftBadge: ImageStyle
    let bottomLeftBadgeContentEdgeInsets: LayoutOffset
    let bottomLeftBadgePaddings: LayoutPaddings

    let topLeftBadge: ImageStyle
    let topLeftBadgeContentEdgeInsets: LayoutOffset
    let topLeftBadgePaddings: LayoutPaddings

    let pendingContent: ViewStyle
    let pendingContentPaddings: LayoutPaddings

    let indicator: ImageStyle
    let indicatorSize: LayoutSize
    let indicatorLeadingPadding: LayoutMetric

    let pendingOverlay: ViewStyle
    let pendingLabel: TextStyle
    let pendingLabelPaddings: LayoutPaddings

    let corner: Corner

    init(
        _ family: LayoutFamily
    ) {
        image = URLImageViewCollectibleListTheme()

        overlay = [
            .backgroundColor(UIColor.clear)
        ]
        overlayAlpha = 0

        title = [
            .textColor(AppColors.Components.Text.gray),
            .textOverflow(SingleLineText()),
        ]
        titleAndSubtitleContentTopPadding = 12

        subtitle = [
            .textColor(AppColors.Components.Text.main),
            .textOverflow(MultilineText(numberOfLines: 2)),
        ]

        bottomLeftBadge = [
            .backgroundColor(AppColors.Shared.System.background),
            .contentMode(.center),
            .tintColor(AppColors.Components.Text.gray)
        ]
        bottomLeftBadgeContentEdgeInsets = (8, 8)
        bottomLeftBadgePaddings = (.noMetric, 8, 8, .noMetric)

        topLeftBadge = [
            .backgroundColor(UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 0.6)),
            .contentMode(.center)
        ]

        topLeftBadgeContentEdgeInsets = (4, 4)
        topLeftBadgePaddings = (8, 8, .noMetric, .noMetric)

        pendingContentPaddings = (.noMetric, 8, 8, .noMetric)
        pendingContent = [
            .backgroundColor(AppColors.Shared.System.background)
        ]
        indicator = [
            .image("loading-indicator"),
            .contentMode(.scaleAspectFit)
        ]
        indicatorSize = (16, 16)
        indicatorLeadingPadding = 8

        pendingOverlay = [
            .backgroundColor(AppColors.Shared.System.background.uiColor.withAlphaComponent(0.4))
        ]
        pendingLabel = [
            .textColor(AppColors.Shared.Helpers.positive),
            .textOverflow(SingleLineFittingText()),
        ]
        pendingLabelPaddings = (4, 8, 4, 8)

        corner = Corner(radius: 4)
    }
}

struct URLImageViewCollectibleListTheme: URLImageViewStyleLayoutSheet {
    struct PlaceholderLayoutSheet: URLImagePlaceholderViewLayoutSheet {
        let textPaddings: LayoutPaddings

        init(
            _ family: LayoutFamily
        ) {
            textPaddings = (8, 8, 8, 8)
        }
    }

    struct PlaceholderStyleSheet: URLImagePlaceholderViewStyleSheet {
        let background: ViewStyle
        let image: ImageStyle
        let text: TextStyle

        init() {
            background = [
                .backgroundColor(AppColors.Shared.Layer.grayLighter)
            ]
            image = []
            text = [
                .textColor(AppColors.Components.Text.gray),
                .textOverflow(FittingText())
            ]
        }
    }

    let background: ViewStyle
    let content: ImageStyle
    let placeholderStyleSheet: URLImagePlaceholderViewStyleSheet?
    let placeholderLayoutSheet: URLImagePlaceholderViewLayoutSheet?

    init(
        _ family: LayoutFamily
    ) {
        background = []
        content = .aspectFit()
        placeholderStyleSheet = PlaceholderStyleSheet()
        placeholderLayoutSheet = PlaceholderLayoutSheet()
    }
}

extension CollectibleListItemViewTheme {
    mutating func configureOverlayForOptedInCell() {
        overlay = overlay.modify([ .backgroundColor(AppColors.Shared.System.background) ])
        overlayAlpha = 0.4
    }
}
