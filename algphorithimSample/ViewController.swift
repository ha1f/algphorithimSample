//
//  ViewController.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/03/31.
//  Copyright © 2019 はるふ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // print(quickSort([5, 3, 1, 10, 2, 4, 3]))
//        let sorter = QuickSorter([5, 3, 1, 10, 2, 4, 3])
//        sorter.sort()
//        print(sorter.array)
        
//        let sorter2 = QuickSorter([1, 1, 1, 1, 1])
//        sorter2.sort()
//        print(sorter2.array)
        
        var array3 = [5, 5, 3, 3, 1, 10, 2, 4, 3, 5, 4]
        print(array3)
        quickSort(&array3)
        print(array3)
        
        var array2 = [5, 3]
        print(array2)
        quickSort(&array2)
        print(array2)
        
        var array1 = [5]
        print(array1)
        quickSort(&array1)
        print(array1)
        
//        print(quickSort([5, 5, 3, 3, 1, 10, 2, 4, 3, 5, 4]))
        
//        var array1 = [5, 3, 1, 10, 2, 4, 3]
//        selectSort(&array1)
//        print(array1)
//
//        print(mergeSort([5, 3, 1, 10, 2, 4, 3]))
//
//        var array2 = [5, 3, 1, 10, 2, 4, 3]
//        bubbleSort(&array2)
//        print(array2)
//
//        print(insertSort([5, 3, 1, 10, 2, 4, 3]))
    }


}

