//
//  RankingsModel.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct Ranking: Codable {
	
	
	public var status: Int
	public var size: Int
	public var result: [RankingData]
	
	

}

struct RankingData: Codable, Hashable {
	

	public var sku: String
	public var division: String
	public var rank: Int
	public var team: String
	public var wins: Int
	public var losses: Int
	public var ties: Int
	public var wp: Int
	public var ap: Int
	public var sp: Int
	public var trsp: Int
	public var max_score: Int
	public var opr: Float
	public var dpr: Float
	public var ccwm: Float

	
}
