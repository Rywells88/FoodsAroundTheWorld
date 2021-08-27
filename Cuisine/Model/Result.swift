//
//  wikiResult.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-08-26.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}

//https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=Craig%20Noone&format=json

