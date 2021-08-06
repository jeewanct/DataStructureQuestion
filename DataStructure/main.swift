//
//  main.swift
//  DataStructure
//
//  Created by jeevan tiwari on 7/6/21.
//

import Foundation

let tree = Tree("1")
tree.addNode(parent: "1", tree: tree, insertingInfo: "2")
tree.addNode(parent: "1", tree: tree, insertingInfo: "3")
tree.addNode(parent: "2", tree: tree, insertingInfo: "4")
tree.addNode(parent: "2", tree: tree, insertingInfo: "5")
tree.addNode(parent: "3", tree: tree, insertingInfo: "6")
tree.addNode(parent: "3", tree: tree, insertingInfo: "7")

tree.inOrderTraversal(root: tree)
