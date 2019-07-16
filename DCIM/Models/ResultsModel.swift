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

struct EquipmentsAPI: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Equipment]?
}

struct EngineersAPI: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Engineer]?
}

struct EventsAPI: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Event]?
}

struct Equipment: Codable, Identifiable {
    var id: Int
    var supplierName: String?
    var supplier: Int?
    var supporter: String?
    var support_time: String?
    var contract: String?
    var categoryName: String?
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
    var supplierName: String?
    var name: String
    var phone: String?
    var identity: String?
    var is_certify: Bool?
    var is_cv: Bool?
    var is_commit: Bool?
    var is_train: Bool?
    var add_time: String
    
    private enum CodingKeys : String, CodingKey {
        case supplier, supplierName, name, phone, identity, is_certify, is_cv, is_commit, is_train, add_time
    }
}

struct Event: Codable, Identifiable {
    var id: Int?
    var equipmentName: String?
    var equipmentSn: String?
    var equipment: Int?
    var date: String?
    var abstract: String?
    var dispose: String?
    var confirmTime: String?
    var status: String?
    var causes: String?
    var remark: String?
    var add_time: String?
    
    private enum CodingKeys : String, CodingKey {
        case confirmTime = "confirm_time"
        case equipment, equipmentName, equipmentSn, date, abstract, dispose, status, causes, remark, add_time
    }
}
