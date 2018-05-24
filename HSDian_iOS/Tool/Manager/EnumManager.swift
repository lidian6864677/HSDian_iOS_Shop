//
//  EnumManager.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/24.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
enum TransitionAnimType : Int {
    case fade = 0,              //淡入淡出
    push,                       //推挤
    reveal,                     //揭开
    moveIn,                     //覆盖
    cube,                       //立方体
    suckEffect,                 //吮吸
    oglFlip,                    //翻转
    rippleEffect,               //波纹
    pageCurl,                   //翻页
    pageUnCurl,                 //反翻页
    cameraIrisHollowOpen,       //开镜头
    cameraIrisHollowClose,      //关镜头
    curlDown,                   //下翻页
    curlUp,                     //上翻页
    flipFromLeft,               //左翻转
    flipFromRight,              //右翻转
    ramdom                      //随机
}

enum TransitionSubType : Int {
    case top = 0,               //上
    left,                       //左
    bottom,                     //下
    right,                      //右
    ramdom                      //随机
}

enum TransitionCurve : Int {
    case Default = 0,           //默认
    EaseIn,                     //缓进
    EaseOut,                    //缓出
    EaseInEaseOut,              //缓进缓出
    Linear,                     //线性
    Ramdom                      //随机
}

