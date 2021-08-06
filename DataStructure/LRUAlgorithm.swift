//
//  LRUAlgorithm.swift
//  DataStructure
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation

class LRUAlgorithm{
    var pagesReference: [Int]
    var frameSize: Int
    var hitCase = 0
    var pageFault = 0
    
    init(referenceString: [Int], frameSize: Int){
        self.pagesReference = referenceString
        self.frameSize = frameSize
    }
    
    func implementLRU(){
        let frame: [Int?] = Array(repeating: nil, count: frameSize)
        pageFault = frameSize
        for (index, value) in pagesReference.enumerated(){
            
        }
    }
}
