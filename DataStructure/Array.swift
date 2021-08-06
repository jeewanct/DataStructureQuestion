//
//  Array.swift
//  DataStructure
//
//  Created by jeevan tiwari on 7/18/21.
//

import Foundation

//MARK: Segrigate Positive and negative number
func positiveNegitive(){
    var arr  =  [-1,2,3,-2,5,-4,-7]
    var negativeNumber = 0
    
    for (index, value) in arr.enumerated(){
        if value < 0{
            negativeNumber += 1
            continue
        }else{
            break
        }
    }
    var positiveNumber = negativeNumber + 1
    for index in positiveNumber..<arr.count{
        if arr[index] < 0{
            let temp = arr[positiveNumber]
            arr[positiveNumber] = arr[negativeNumber]
            arr[negativeNumber] = temp
            positiveNumber += 1
            negativeNumber += 1
        }else{
            positiveNumber += 1
        }
    }
    print(arr)
}

//MARK: Sort array consist of only 0,1,2
func sortNumber(arr: inout [Int]){
    var zero = 0
    var two = arr.count
    var one = 0
    
    for index in 0..<arr.count{
        if arr[index] == 0{
            zero += 1
            continue
        }else{
            break
        }
    }
    for index in (0..<arr.count).reversed(){
        if arr[index] == 0{
            two -= 1
            continue
        }else{
            break
        }
    }
    if two == arr.count{
        two -= 1
    }
    one = zero + 1
    while one <= two{
        print("Fuck")
        if arr[one] == 0{
            arr[zero] = 0
            arr[one] = 1
            one += 1
            zero += 1
        }else if arr[one] == 2{
            let temp = arr[two]
            arr[two] = 2
            arr[one] = temp
            two -= 1
        }else{
            one += 1
        }
    }
 print(arr)
}

func searchElement(arr: [Int], low: Int, high: Int, searchingElement: Int) -> Int{
    if low > high{
        return low
    }
    let mid = (high + low) / 2
    let midElement = arr[mid]
    if midElement == searchingElement{
        return mid
    }else if midElement > searchingElement{
        return searchElement(arr: arr, low: low, high: mid - 1, searchingElement: searchingElement)
    }else{
        return searchElement(arr: arr, low: mid + 1, high: high, searchingElement: searchingElement)
    }
}

func maxSubArray(_ nums: [Int]) -> Int {
       var latestMax = nums[0]
       var maximum = nums[0]
    for index in 1..<nums.count{
           var temp = latestMax < 0 ? 0 : latestMax
           latestMax = temp + nums[index]
           maximum = max(latestMax, maximum)
       }
       return max(latestMax, maximum)
   }
