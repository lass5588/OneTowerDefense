//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SwiftUI

protocol Enemy : View{
    var damage: Double { get }
    var health: Double { get }
    var speed: Double { get }
    var xPos: CGFloat { get }
    var yPos: CGFloat { get }
}
