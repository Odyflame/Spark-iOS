//
//  EditMyVocaGroupViewModel.swift
//  Vocabulary
//
//  Created by LEE HAEUN on 2020/08/08.
//  Copyright © 2020 LEE HAEUN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PoingVocaSubsystem

class EditMyVocaGroupViewModel {
    var groups = BehaviorRelay<[Group]>(value: [])

    init(groups: [Group]) {
        self.groups = BehaviorRelay<[Group]>(value: filteredGroup(groups: groups))
    }

    func filteredFetchGroup() {
        VocaManager.shared.fetch(identifier: nil) { [weak self] (groups) in
            guard let self = self else { return }
            guard let groups = groups else {
                self.groups.accept([])
                return
            }

            let filteredGroups = self.filteredGroup(groups: groups)
            self.groups.accept(filteredGroups)
        }
    }

    func filteredGroup(groups: [Group]) -> [Group] {
        groups.filter({ (group) -> Bool in
            group.visibilityType != .default && group.visibilityType != .group
        })
    }
}
