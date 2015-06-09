//
//  WorkPatternView.swift
//  Assignments
//
//  Created by Aryeh Lieberman on 6/9/15.
//  Copyright (c) 2015 JoeAryehiOS. All rights reserved.
//

import UIKit

class WorkPatternView: UIView {

    var timeToComplete: Int = 0
    var currentTime: Int!
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        let colorspace = CGColorSpaceCreateDeviceRGB()
//        var rect:CGRect = CGRectMake(0.0,0.0, 20, 20)
//        var colorComponents: [CGFloat] = [0.1 , 0.0 , 0.9, 1.0]
//        var color = CGColorCreate(colorspace, colorComponents)
//        CGContextSetFillColorWithColor(context, color)
//        
//        CGContextFillRect(context, rect)
        let numberOfSections: CGFloat = CGFloat(timeToComplete / CourseList.List.workPeriod)
        let sectionWidth: CGFloat = CGFloat(frame.width) / numberOfSections
        for var i: CGFloat = 0.0; i <= numberOfSections; ++i{
            let partialWidth = (sectionWidth * CGFloat(CourseList.List.onPercentage))
            var rect:CGRect = CGRectMake(CGFloat(i * sectionWidth),0.0, partialWidth, frame.height)
            var colorComponents: [CGFloat] = [ (156.0 / 255.0) , (185.0 / 255.0) , (211.0 / 255.0), 0.77]
            var color = CGColorCreate(colorspace, colorComponents)
            CGContextSetFillColorWithColor(context, color)
            CGContextFillRect(context, rect)
            
        }
        if let t = currentTime{
        var rect:CGRect = CGRectMake((CGFloat(t/timeToComplete) * (frame.width)),0.0, 1.5, frame.height)
        var colorComponents: [CGFloat] = [ 1.0 , 0.0 , 0.0, 1.0]
        var color = CGColorCreate(colorspace, colorComponents)
        CGContextSetFillColorWithColor(context, color)
            CGContextFillRect(context, rect)}

        
        
        
        
        
        
        
        
        /*for i in 0...(timeToComplete / CourseList.List.workPeriod){
            for j in 0...CourseList.List.workPeriod{
                if(Double(j) <=  (Double(CourseList.List.workPeriod) * Double(CourseList.List.onPercentage))){
                    var rect: CGRect = CGRectMake(CGFloat(i + j), CGFloat(0), CGFloat(1), frame.height)
                    var colorComponents: [CGFloat] = [0.0, 1.0, 0.0, 1.0]
                    var color = CGColorCreate(colorspace, colorComponents)
                    CGContextSetFillColorWithColor(context, color)

                }else{
                    var rect: CGRect = CGRectMake(CGFloat(i + j), CGFloat(0), CGFloat(1), frame.height)
                    var colorComponents: [CGFloat] = [1.0, 0.0, 0.0, 1.0]
                    var color = CGColorCreate(colorspace, colorComponents)
                    CGContextSetFillColorWithColor(context, color)
                }
            }
        }*/
    }


}
