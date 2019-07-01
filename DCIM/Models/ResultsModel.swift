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

struct EngineersAPI: Codable {
    var count: Int
    var next: String
    var previous: String?
    var results: [Engineer]?
}

struct Equipment: Codable, Identifiable {
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

struct Engineer: Codable, Identifiable {
    var id: Int?
    var supplier: Int
    var name: String
    var phone: String?
    var identity: String?
    var is_certify: Bool?
    var is_cv: Bool?
    var is_commit: Bool?
    var is_train: Bool?
    var add_time: String
    
    private enum CodingKeys : String, CodingKey {
        case supplier, name, phone, identity, is_certify, is_cv, is_commit, is_train, add_time
    }
}
