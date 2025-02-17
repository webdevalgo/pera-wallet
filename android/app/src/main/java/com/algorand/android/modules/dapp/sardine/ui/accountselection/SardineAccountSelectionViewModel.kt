/*
 * Copyright 2022 Pera Wallet, LDA
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */

package com.algorand.android.modules.dapp.sardine.ui.accountselection

import javax.inject.Inject
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.algorand.android.models.BaseAccountSelectionListItem
import com.algorand.android.modules.dapp.sardine.ui.accountselection.model.SardineAccountSelectionPreview
import com.algorand.android.modules.dapp.sardine.ui.accountselection.usecase.SardineAccountSelectionPreviewUseCase
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch

@HiltViewModel
class SardineAccountSelectionViewModel @Inject constructor(
    private val sardineAccountSelectionPreviewUseCase: SardineAccountSelectionPreviewUseCase
) : ViewModel() {

    val accountItemsFlow: Flow<List<BaseAccountSelectionListItem>>
        get() = _accountItemsFlow
    private val _accountItemsFlow = MutableStateFlow<List<BaseAccountSelectionListItem>>(emptyList())

    private val _sardineAccountSelectionPreviewFlow = MutableStateFlow(
        sardineAccountSelectionPreviewUseCase.getInitialPreview()
    )
    val sardineAccountSelectionPreviewFlow: StateFlow<SardineAccountSelectionPreview>
        get() = _sardineAccountSelectionPreviewFlow

    init {
        initAccountItems()
    }

    private fun initAccountItems() {
        viewModelScope.launch {
            _accountItemsFlow.emit(sardineAccountSelectionPreviewUseCase.getSardineAccountSelectionList())
        }
    }

    fun onAccountSelected(accountAddress: String) {
        viewModelScope.launch {
            _sardineAccountSelectionPreviewFlow
                .emit(
                    sardineAccountSelectionPreviewUseCase
                        .getOnAccountSelectedPreview(
                            _sardineAccountSelectionPreviewFlow.value,
                            accountAddress
                        )
                )
        }
    }
}
