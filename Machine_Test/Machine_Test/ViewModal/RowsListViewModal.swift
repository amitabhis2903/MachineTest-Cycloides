//
//  RowsListViewModal.swift
//  Machine_Test
//
//  Created by Amitabh Pandey on 22/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation

struct RowsListViewModal: Codable {
    var rowsList: [Row]
}

extension RowsListViewModal {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return rowsList.count
    }
    
    func rowsAtIndex(_ index: Int) -> RowsViewModal {
        let rows = self.rowsList[index]
        return RowsViewModal(rows)
    }
}
