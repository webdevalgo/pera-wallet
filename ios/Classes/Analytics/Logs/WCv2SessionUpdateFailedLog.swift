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

//   WCv2SessionUpdateFailedLog.swift

import Foundation

struct WCv2SessionUpdateFailedLog: ALGAnalyticsLog {
    let name: ALGAnalyticsLogName
    let metadata: ALGAnalyticsMetadata

    fileprivate init(
        session: WalletConnectV2Session,
        error: Error
    ) {
        self.name = .walletConnectV2SessionConnectionRejectionFailed
        self.metadata = [
            .wcSessionTopic: session.topic,
            .wcSessionURL: Self.regulate(session.peer.url),
            .wcRequestError: Self.regulate(error.localizedDescription)
        ]
    }
}

extension ALGAnalyticsLog where Self == WCv2SessionUpdateFailedLog {
    static func wcV2SessionUpdateFailedLog(
        session: WalletConnectV2Session,
        error: Error
    ) -> Self {
        return WCv2SessionUpdateFailedLog(
            session: session,
            error: error
        )
    }
}
