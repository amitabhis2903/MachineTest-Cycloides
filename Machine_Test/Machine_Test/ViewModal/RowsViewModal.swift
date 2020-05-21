//
//  File.swift
//  Machine_Test
//
//  Created by Amitabh Pandey on 22/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

struct RowsViewModal: Codable {
    private let rows: Row
}

extension RowsViewModal {
    init(_ rows: Row) {
        self.rows = rows
    }
}

extension RowsViewModal {
    
    var title: String? {
        return rows.title
    }
    
    var description: String? {
        return rows.rowDescription
    }
    
    var imageUrl: String? {
        return rows.imageHref
    }
}
