//
//  FaceTools.h
//  人脸识别Demo
//
//  Created by 杨阳 on 15/11/7.
//  Copyright (c) 2015年 yangyang. All rights reserved.
//


#pragma mark touchID代码示例
/*
 FaceTools*tools=[[FaceTools alloc]initWithTouchID_Block:^(touchIDENUM x) {
 switch (x) {
 case touchIDCheCkCancel:
 NSLog(@"取消");
 break;
 case touchIDCheckPassWord:
 NSLog(@"手动输入密码");
 
 break;
 case touchIDCheckSucceed:
 NSLog(@"验证成功");
 
 break;
 case touchIDDeviceError:
 NSLog(@"无法启动touid");
 
 break;
 }
 }];
 tools=nil;
 */


#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "FaceDetectModel.h"

typedef enum : NSUInteger {
    touchIDDeviceError=0,
    touchIDCheckSucceed,
    touchIDCheCkCancel,
    touchIDCheckPassWord
} touchIDENUM;



@interface FaceTools : NSObject

//指纹block
@property(nonatomic,copy)void(^touchIDBlock)(touchIDENUM);
//人脸识别block
@property(nonatomic,copy)void(^faceDetectBlock)(BOOL,NSArray*);
//人脸识别的imageView
@property(nonatomic,assign)UIImageView*headerImageView;
//iOS8  指纹验证
-(instancetype)initWithTouchID_Block:(void(^)(touchIDENUM))a;
//iOS7  图像识别
-(instancetype)initWithFaceDetectWithImageView:(UIImageView*)headerImageView Block:(void(^)(BOOL,NSArray*))b;

@end
