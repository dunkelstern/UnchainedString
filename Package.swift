//
//  Package.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "UnchainedString",
    targets: [
        Target(name:"UnchainedStringTests", dependencies: [.Target(name: "UnchainedString")]),
        Target(name:"UnchainedString")
    ]
)