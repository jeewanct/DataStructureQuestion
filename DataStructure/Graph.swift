//
//  Graph.swift
//  DataStructure
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation

//MARK: GRAPH IMPLEMENTATION
class AdjancyList{
    var rightNode: AdjancyList?
    var information: Int
    init(info: Int) {
        information = info
    }
}

var adjancenyList = [AdjancyList]()

func addVertex(infor: Int){
    let newVertex = AdjancyList(info: infor)
    adjancenyList.append(newVertex)
    //print(dump(adjancenyList))
}
func addEdge(vertexInfo: Int,information: Int){
    for value in adjancenyList{
        if value.information == vertexInfo{
            addNewEdge(currentVertex: value, information: information)
            break
        }
        
    }
}
func addNewEdge(currentVertex: AdjancyList, information: Int){
    var tempTest:AdjancyList? = currentVertex
    repeat{
        if tempTest?.rightNode == nil{
            tempTest?.rightNode = AdjancyList(info: information)
            tempTest = nil
        }
        tempTest = tempTest?.rightNode
    }while tempTest != nil
    
}

func printAdjanceyList(){
    for value in adjancenyList{
        var tempTest:AdjancyList? = value
        repeat{
            print("", tempTest?.information ?? -1, terminator: "->")
            tempTest = tempTest?.rightNode
        }while tempTest != nil
        print()
    }
}

//MARK: BFS TRAVERSING
class BFSTraversing{
    var queue = [Int]()
    var visitedNodes =  [Int: Bool]()
    
    func printBFS(){
        addVertexWithVisit()
        queue.append(1)
        while !queue.isEmpty{
            let element = queue[0]
            visitedNodes.updateValue(true, forKey: element)
            
            var tempTest:AdjancyList? = getNode(for: element)
            repeat{
                if let information = tempTest?.information, visitedNodes[information] == false{
                    visitedNodes[information] = true
                    queue.append(information)
                }
                tempTest = tempTest?.rightNode
            }while tempTest != nil
            print(queue.first)
            queue.removeFirst()
        }
    }
    func getNode(for item: Int) -> AdjancyList?{
        for value in adjancenyList{
            if value.information == item{
                return value.rightNode
            }
        }
        return nil
    }
    func addVertexWithVisit(){
        for value in adjancenyList{
            visitedNodes.updateValue(false, forKey: value.information)
        }
    }
}

//MARK: Length of shortest chain to reach a target word ]
func findShortestChain(array: [String], start: String, end: String){
    func findAdjacentStrings(currentString: String) -> [String]{
        var adjacentStrings = [String]()
        let maxCount = dict[currentString] ?? 0
        for value in array{
            let firstElement = Array(value)
            let secondElement = Array(currentString)
            var count = 0
            for index in 0..<firstElement.count{
                if firstElement[index] == secondElement[index]{
                    count += 1
                }
            }
            if count == currentString.count - 1 && dict[value] == 0{
                dict[value] = maxCount + 1
                adjacentStrings.append(value)
            }
        }
        return adjacentStrings
    }
    
    var dict = [String : Int]()
    for value in array{
        dict.updateValue(0, forKey: value)
    }
    var queue = [String]()
    queue.append(start)
    
    while !queue.isEmpty {
        let firsElement = queue[0]
        
        if firsElement == end{
            print(dict[firsElement])
            break
        }
        queue.append(contentsOf: findAdjacentStrings(currentString: firsElement))
        print(queue)
        queue.removeFirst()
    }
}
