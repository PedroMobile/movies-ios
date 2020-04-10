//
//  DateUtil.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" on 09/04/20.
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

struct DateUtil {
    
    static func convertDateFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-MM-dd"
         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "MMM dd yyyy"
         let newDate = olDateFormatter.date(from: inputDate)
         return convertDateFormatter.string(from: newDate ?? Date())
    }
    
}
