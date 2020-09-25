//
//  Models.swift
//  StackExchange
//
//  Created by Tim Parmentier on 9/25/20.
//

import Foundation

struct Owner:Codable {
    let reputation:Int?
    let user_id:Int?
    let user_type:String?
    let accept_rate:Int?
    let profile_image:String?
    let display_name:String?
    let link:String?
}

struct Question:Codable {
    let tags:[String]?
    let owner:Owner?
    let is_answered:Bool?
    let view_count:Int?
    let answer_count:Int?
    let score:Int?
    let last_activity_date:Int?
    let creation_date:Int?
    let last_edit_date:Int?
    let question_id:Int?
    let content_license:String?
    let title:String?
    let link:String?
}

struct Questions:Codable {
    let items:[Question]?
}

