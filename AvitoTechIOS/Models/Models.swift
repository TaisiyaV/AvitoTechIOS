//
//  Models.swift
//  AvitoTechIOS
//
//  Created by tasya on 09.09.2021.
//

import Foundation

struct CompanyModel: Codable {
    var company: Company
}

struct Company: Codable {
    let name: String
    var employees: [Employee]
}

struct Employee: Codable {
    let name: String
    let phoneNumber: String
    let skills: [String]
    
    enum CodingKeys: String, CodingKey {
            case name
            case phoneNumber = "phone_number"
            case skills
    }
}

