// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import RealmSwift

class WalletStorage {

    let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func get(for wallet: Wallet) -> WalletObject {
        let firstWallet = realm.objects(WalletObject.self).filter { $0.id == wallet.primaryKey }.first
        guard let foundWallet = firstWallet else {
            return WalletObject.from(wallet)
        }
        return foundWallet
    }

    func store(objects: [WalletObject]) {
        try? realm.write {
            realm.add(objects, update: true)
        }
    }
}
