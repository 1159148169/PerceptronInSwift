//
//  main.swift
//  Perceptron
//
//  Created by Shi Feng on 2016/12/13.
//  Copyright © 2016年 Shi Feng. All rights reserved.
//

import Foundation

class Perceptron {
    
    private let inputCounts = 2.0 //输入数
    private let outputCounts = 1.0 //输出数
    private let learningRate = 0.02 //学习率
    
    private var weight1 = 0.012 //权重1
    private var weight2 = 0.045 //权重2
    
    private var chargeResult = 0.0
    private var deviation = 0.01 //偏差
    
    private func charge(calculate result: Double) -> Double {
        if result >= 0.0 {
            return 1.0
        } else {
            return 0.0
        }
    }
    
    public func calculate(input1 Num1:Double,input2 Num2:Double) -> Double {
        return charge(calculate: Num1 * weight1 + Num2 * weight2 + deviation)
    }
    
    public func learning(expect Num:Double,real1 Num1:Double,real2 Num2:Double) -> Bool {
        chargeResult = calculate(input1: Num1, input2: Num2)
        if chargeResult != Num {
            weight1 += Num1 * (Num - chargeResult) * learningRate
            weight2 += Num2 * (Num - chargeResult) * learningRate
            deviation += learningRate * (Num - chargeResult)
            
            return false
        } else {
            return true
        }
    }
    
    public func printWeight() {
        print("权值1:\(weight1) 权值2:\(weight2) 权值:\(deviation)")
    }
}

var Perceptron_Example = Perceptron()
var test = Array<Array<Double>>() //与运算
test = [[0.0,0.0,0.0],
        [0.0,1.0,0.0],
        [1.0,0.0,0.0],
        [1.0,1.0,1.0]
        ]
var test2 = Array<Array<Double>>() //或运算
test2 = [[0.0,0.0,0.0],
         [0.0,1.0,1.0],
         [1.0,0.0,1.0],
         [1.0,1.0,1.0]
]

//与运算训练
var charge:Bool!
repeat {
    charge = true
    for i in 0...3 {
        if !Perceptron_Example.learning(expect: test[i][2], real1: test[i][0], real2: test[i][1]) {
            charge = false
        }
    }
} while !charge

Perceptron_Example.printWeight() //打印最终权值

//检测学习结果
print("输入0,0的结果为:\(Perceptron_Example.calculate(input1: 0.0, input2: 0.0))")
print("输入0,1的结果为:\(Perceptron_Example.calculate(input1: 0.0, input2: 1.0))")
print("输入1,0的结果为:\(Perceptron_Example.calculate(input1: 1.0, input2: 0.0))")
print("输入1,1的结果为:\(Perceptron_Example.calculate(input1: 1.0, input2: 1.0))")

