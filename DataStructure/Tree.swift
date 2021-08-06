//
//  Tree.swift
//  DataStructure
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation

class Tree{
    var leftChild: Tree?
    var rightChild: Tree?
    var information: String
    var currentTree: Tree?
    
    init(_ information: String) {
        self.information = information
    }
    func addNode(parent: String, tree: Tree?,insertingInfo: String){
        if tree == nil{
            return
        }
        if tree?.information == parent{
            if tree?.leftChild == nil{
                tree?.leftChild = Tree(insertingInfo)
                return
            }else if tree?.rightChild == nil{
                tree?.rightChild = Tree(insertingInfo)
                return
            }
        }
        addNode(parent: parent, tree: tree?.leftChild, insertingInfo: insertingInfo)
        addNode(parent: parent, tree: tree?.rightChild, insertingInfo: insertingInfo)
    }
    
    func depth(tree: Tree?) -> Int{
        if tree == nil{
            return 0
        }
        let leftChildHeight = depth(tree: tree?.leftChild)
        let rightChildHeight = depth(tree: tree?.leftChild)
        
        if leftChildHeight > rightChildHeight{
            return leftChildHeight + 1
        }else{
            return rightChildHeight + 1
        }
    }
    func diameterOfTree(tree: Tree?) -> Int{
        if tree == nil { return 0 }
        let lHeight = depth(tree: tree?.leftChild)
        let rHeight = depth(tree: tree?.rightChild)
        
        let currentDiameter = lHeight + rHeight + 1
        
        let diameterOfLeftTree = diameterOfTree(tree: tree?.leftChild)
        let diameterOfrightTree = diameterOfTree(tree: tree?.rightChild)
        
        return max(currentDiameter, max(diameterOfLeftTree, diameterOfrightTree))
    }
    
    func continousTree(root: Tree?) -> Bool{
        if root?.leftChild == nil && root?.rightChild == nil { return true }
        if let rootInfo = root?.information, let rootNumber = Int(rootInfo){
            if root?.leftChild == nil && root?.rightChild != nil, let rightChild = Int(root?.rightChild?.information ?? "0"){
                return (abs(rootNumber - rightChild) == 1) && continousTree(root: root?.rightChild)
            }
            if root?.rightChild == nil && root?.leftChild != nil, let leftChild = Int(root?.leftChild?.information ?? "0"){
                return (abs(rootNumber - leftChild) == 1) && continousTree(root: root?.leftChild)
            }
            if let leftChild = root?.leftChild?.information, let rightChild  = root?.rightChild?.information, let leftChildInfo = Int(leftChild), let rightChildInfo = Int(rightChild){
                return (abs(rootNumber - leftChildInfo) == 1) && (abs(rootNumber - rightChildInfo) == 1) && continousTree(root: root?.leftChild) && continousTree(root: root?.rightChild)
            }
        }
        return false
    }
    
    func continousTreeUsingBFS(root: Tree) -> Bool{
        var arrayRepresentation = [Tree]()
        var arrayNew = [Int?]()
        arrayRepresentation.append(root)
        
        while arrayRepresentation.isEmpty == false {
            let currentNode = arrayRepresentation.first
            if let leftChild = currentNode?.leftChild{
                arrayRepresentation.append(leftChild)
            }
            if let rightChild = currentNode?.rightChild{
                arrayRepresentation.append(rightChild)
            }
            arrayNew.append(Int(currentNode?.information ?? "0"))
            arrayRepresentation.removeFirst()
        }
        print(arrayNew)
        
        
        for (index,value) in arrayNew.enumerated(){
            let currentIndex = index + 1
            let leftChild = 2 * currentIndex - 1
            let rightChild = leftChild + 1
            
            if leftChild < arrayNew.count{
                let difference = abs((arrayNew[leftChild] ?? 0) - (value ?? 0))
                if difference != 1{
                    return false
                }
            }
            if rightChild < arrayNew.count{
                let difference = abs((arrayNew[rightChild] ?? 0) - (value ?? 0))
                if difference != 1{
                    return false
                }
            }
        }
        return true
        
    }
    
    func mirrorOfTree(root: Tree?){
        if root == nil{ return }
        let temp = root?.leftChild
        root?.leftChild = root?.rightChild
        root?.rightChild = temp
        mirrorOfTree(root: root?.leftChild)
        mirrorOfTree(root: root?.rightChild)
    }
    
    func printLevelWiseTree(){
        var array = [Tree]()
        array.append(self)
        while !array.isEmpty{
            let firstElement = array.first
            print(firstElement?.information)
            if let leftChild = firstElement?.leftChild{
                array.append(leftChild)
            }
            if let rightChild = firstElement?.rightChild{
                array.append(rightChild)
            }
            array.removeFirst()
        }
    }
    
    func inOrderTraversal(root: Tree){
        var stack = [Tree]()
        func insertElements(node: Tree?){
            var temp = node
            while temp != nil{
                if let unwrappedElement = temp{
                    stack.append(unwrappedElement)
                }
                temp = temp?.leftChild
            }
        }
        insertElements(node: root)
        while !stack.isEmpty {
            let lastElement = stack.last
            stack.removeLast()
            if let unwrappedElement = lastElement?.information{
                print(unwrappedElement)
            }
            if let rightElement = lastElement?.rightChild{
                insertElements(node: rightElement)
            }
        }
    }
}


