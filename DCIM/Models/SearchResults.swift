//
//  SearchResults.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI


struct SearchResults: Codable {
    var engineers: [Engineer]?
    var equipments: [Equipment]?
}

struct Equipment: Codable {
    var id: Int
    var supplier: Int?
    var supporter: String?
    var support_time: String?
    var contract: String?
    var category: Int?
    var category_sub: String?
    var name: String?
    var sn: String?
    var asset_sn: String?
    var archive_sn: String?
    var room: String?
    var location: String?
    var status: String?
    var application: String?
    var partition: String?
    var add_time: String?
}

struct Engineer: Codable {
    var supplier: Int
    var name: String
    var phone: String
    var identity: String
    var is_certify: Bool
    var is_cv: Bool
    var is_commit: Bool
    var is_train: Bool
    var add_time: String
}
