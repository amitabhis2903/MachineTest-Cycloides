//
//  CycloidesModal.swift
//  Machine_Test
//
//  Created by Amitabh Pandey on 22/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

struct CycloidesModal: Codable {
    let title: String?
    let rows: [Row]?
}

// MARK: - Row
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
