////
////  TeamModel.swift
////  VexAssistant
////
////  Created by James Cosgrove on 24/03/2020.
////  Copyright © 2020 James Cosgrove. All rights reserved.
////
//
import Foundation
import Combine
import SwiftUI

struct Team: Codable {


	public var status: Int
	public var size: Int
	public var result: [TeamData]
	


}

struct TeamData: Codable, Hashable {


	public var number: String
	public var program: String
	public var team_name: String
	public var robot_name: String
	public var organisation: String
	public var city: String
	public var region: String
	public var country: String
	public var grade: String

}
