//
//  LinkList.swift
//  DataStructure
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation

class LinkList{
    var nextNode: LinkList?
    var information: Int
    
    
    init(info: Int){
        information = info
    }
    func insertItems(info: Int, head: LinkList?){
        var temp = head
        while temp != nil {
            if temp?.nextNode == nil{
                temp?.nextNode = LinkList(info: info)
                temp = nil
            }
            temp = temp?.nextNode
        }
    }
    func linkList(head: LinkList?){
        var temp = head
        while temp != nil{
            print(temp?.information ?? 0, separator: "->", terminator: "")
            temp = temp?.nextNode
        }
    }
    
    func reverseLinkList(){
        
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      var finalList: ListNode?
      var firstList = l1
      var secondList = l2
      var currentNode: ListNode?
      
      while firstList != nil && secondList != nil{
          if let firstNumber = firstList?.val, let secondNumber = secondList?.val{
              if firstNumber < secondNumber{
                  if finalList == nil{
                      finalList = ListNode(firstNumber)
                      currentNode = finalList
                  }else{
                      let node = ListNode(firstNumber)
                      currentNode?.next = node
                      currentNode = node
                  }
                  firstList = firstList?.next
              }else{
                  if finalList == nil{
                      finalList = ListNode(secondNumber)
                      currentNode = finalList
                  }else{
                      let node = ListNode(secondNumber)
                      currentNode?.next = node
                      currentNode = node
                  }
                  secondList = secondList?.next
              }
          }
      }
      while firstList != nil{
          if let unwrappedNumber = firstList?.val{
              let node = ListNode(unwrappedNumber)
          currentNode?.next = node
          currentNode = node
          }
        firstList = firstList?.next
      }
      while secondList != nil{
          if let unwrappedNumber = secondList?.val{
              let node = ListNode(unwrappedNumber)
          currentNode?.next = node
          currentNode = node
          }
        secondList = secondList?.next
      }
      return finalList
  }
}
