//
//  ViewController.m
//  人脸识别
//
//  Created by qianfeng on 16/5/5.
//  Copyright © 2016年 DSY. All rights reserved.
//

#import "ViewController.h"
#import "FaceDetectModel.h"
#import "FaceTools.h"

@interface ViewController ()
{
    UIImageView * _imageV;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNav];
    [self createUI];
}

- (void)createUI{
    
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", arc4random() % 120]];
    
    [self.view addSubview:_imageV];
    
    // 脸部器官
    [self createFaceView];
    
}

- (void)createFaceView {
    
    // 第一个参数表示是否识别成功
    FaceTools * tools = [[FaceTools alloc] initWithFaceDetectWithImageView:_imageV Block:^(BOOL isSuccdeed, NSArray * faceArr) {
        
        if (isSuccdeed) {
            
            for (FaceDetectModel * faceModel in faceArr) {
                
                // 脸部
                UIView * faceView = [[UIView alloc] initWithFrame:CGRectFromString(faceModel.faceFrameString)];//获得脸部位置
                
                faceView.backgroundColor = [UIColor lightGrayColor];
                
                faceView.alpha = 0.5;
                
                [_imageV addSubview:faceView];
                
                // 左眼睛
                UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
                
                leftView.center = CGPointFromString(faceModel.leftEyePointString); //获得位置
                
                leftView.backgroundColor = [UIColor yellowColor];
                
                leftView.alpha = 0.3;
                
                [_imageV addSubview:leftView];
                
                // 右眼睛
                UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
                
                rightView.center = CGPointFromString(faceModel.rightEyePointString);//获得位置
                
                rightView.backgroundColor = [UIColor redColor];
                
                rightView.alpha = 0.3;
                
                [_imageV addSubview:rightView];
                
                // 嘴巴
                UIView * mouthView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
                mouthView.center = CGPointFromString(faceModel.mouthPointString);//获得位置
                
                mouthView.backgroundColor = [UIColor redColor];
                mouthView.alpha = 0.3;
                
                [_imageV addSubview:mouthView];
            }
            
        }else {
           
            NSLog(@"识别失败");
        }
        
    }];
}

- (void)setNav {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    btn.frame = CGRectMake(0, 0, 44, 44);
    
    [btn addTarget:self action:@selector(changeImg) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void)changeImg {
    
    if (_imageV) {
        
        for (UIView * view in [_imageV subviews]) {
            
            [view removeFromSuperview];
        }
        
    }
    
    _imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", arc4random() % 129]];
    
    [self createFaceView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
