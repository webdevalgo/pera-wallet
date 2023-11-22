// Copyright 2023 Pera Wallet, LDA

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//   BackUpAccountSelectionListHeaderTheme.swift

import Foundation
import MacaroonUIKit

struct BackUpAccountSelectionListHeaderTheme:
    StyleSheet,
    LayoutSheet {
    private(set) var context: TextStyle
    private(set) var contextEdgeInsets: LayoutPaddings

    init(_ family: LayoutFamily) {
        self.context = [
            .textColor(Colors.Text.gray),
            .textOverflow(FittingText())
        ]
        self.contextEdgeInsets = (0, 24, 0, 24)
    }
}
