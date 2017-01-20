//
//  FaceDetectModel.h
//  人脸识别Demo
//
//  Created by 杨阳 on 15/11/7.
//  Copyright (c) 2015年 yangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FaceDetectModel : NSObject

//人脸位置
@property(nonatomic,copy)NSString*faceFrameString;
//左眼位置
@property(nonatomic,copy)NSString*leftEyePointString;
//右眼位置
@property(nonatomic,copy)NSString*rightEyePointString;
//嘴巴位置
@property(nonatomic,copy)NSString*mouthPointString;
@property(nonatomic)BOOL isSmile;
@property(nonatomic)BOOL isLeftEyeClosed;
@property(nonatomic)BOOL isRightEyeClosed;

@end
