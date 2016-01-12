//
//  mainViewController.m
//  framework-1_4-[0.1 hanming]
//
//  Created by 韩明 on 16/1/5.
//  Copyright © 2016年 韩明. All rights reserved.
//

#import "mainViewController.h"
#import "historyViewController.h"
#import "CurrentLevel.h"
#import "InitSqlite3.h"
#import "PNChart.h"
#import "CurrentLevel.h"

@interface mainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UITextView *mainTopLabel;
@property (weak, nonatomic) IBOutlet UIButton *flowerBtn;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;


@end

@implementation mainViewController

//滑动手势
@synthesize leftSwipeGestureRecognizer, rightSwipeGestureRecognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    //滑动手势
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    
    //初始化数据库
    //InitSqlite3 *initsqlite3 = [InitSqlite3 new];
    //[initsqlite3 createDataBase];
    
    
    //0. 获取用户的属性
    CurrentLevel * currentLevel = [CurrentLevel new];
    
    
    //1. 左上角天气，取决于用户当前的压力值，压力小天气好
    //2. 右上角的提示文字,如今天情绪很好哦，花也格外旺盛呢
    NSString * weatherImgeName;
    NSString * topLabelText;
    //streeLevel还没确定时int还是float，如果时float，则需要将float映射成0～2再进行显示
    //yangj
    NSLog(@"current level %i", currentLevel.stressLevel.intValue);
    switch (currentLevel.stressLevel.intValue) {
        case 0:
            weatherImgeName = @"sun";
            topLabelText = @"今天心情不错，继续保持哦～";
            break;
        case 1:
            weatherImgeName = @"cloudy";
            topLabelText = @"今天心情一般，试着做点开心的事情吧~";
            break;
        case 2:
            weatherImgeName = @"rain";
            topLabelText = @"今天心情有点低沉，要多多照顾下自己的心情哦~";
            break;
        default:
            weatherImgeName = @"snow";
            topLabelText = @"今天心情很差，注意调节啊~";
            break;
    }
    self.weatherImage.image = [UIImage imageNamed:weatherImgeName];
    self.mainTopLabel.text = topLabelText;
    
    //压力值赋值 不一定是int
    NSLog(@"current level %f", currentLevel.stressLevel.floatValue);
    self.label1.text = currentLevel.stressLevel;
    //睡眠赋值 不一定是int
    NSLog(@"current level %f", currentLevel.sleepLevel.floatValue);
    self.label2.text = currentLevel.sleepLevel;
    //计步赋值 不一定是int
    NSLog(@"current level %f", currentLevel.stepLevel.floatValue);
    self.label3.text = currentLevel.stepLevel;
    //卡路里赋值 不一定是int
    NSLog(@"current level %f", currentLevel.calorieLevel.floatValue);
    self.label4.text = currentLevel.calorieLevel;
    /* 以下是杨俊写的圆圈显示数值的代码（暂时不用了）
    // stress
    self.circleChartStress = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,450.0, SCREEN_WIDTH*0.45, 80.0)
                                                      total:@14.0
                                                    current:@12.0
                                                  clockwise:YES];
    self.circleChartStress.backgroundColor = [UIColor clearColor];
    [self.circleChartStress setStrokeColor:[UIColor clearColor]];
    // change color according to the stress lever
    [self.circleChartStress setStrokeColorGradientStart:[UIColor redColor]];
    [self.circleChartStress strokeChart];
    [self.view addSubview:self.circleChartStress];
    
    // sleep
    self.circleChartSleep = [[PNCircleChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.55,450.0, SCREEN_WIDTH*0.45, 80.0)
                                                            total:@14.0
                                                          current:@12.0
                                                        clockwise:YES];
    self.circleChartSleep.backgroundColor = [UIColor clearColor];
    [self.circleChartSleep setStrokeColor:[UIColor clearColor]];
    // change color according to the stress lever
    [self.circleChartSleep setStrokeColorGradientStart:[UIColor redColor]];
    [self.circleChartSleep strokeChart];
    [self.view addSubview:self.circleChartSleep];
    
    // step
    self.circleChartStep = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,600.0, SCREEN_WIDTH*0.45, 80.0)
                                                           total:@14.0
                                                         current:@12.0
                                                       clockwise:YES];
    self.circleChartStep.backgroundColor = [UIColor clearColor];
    [self.circleChartStep setStrokeColor:[UIColor clearColor]];
    // change color according to the stress lever
    [self.circleChartStep setStrokeColorGradientStart:[UIColor redColor]];
    [self.circleChartStep strokeChart];
    [self.view addSubview:self.circleChartStep];
    
    // calorie
    self.circleChartCalorie = [[PNCircleChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.55,600.0, SCREEN_WIDTH*0.45, 80.0)
                                                           total:@14.0
                                                         current:@12.0
                                                       clockwise:YES];
    self.circleChartCalorie.backgroundColor = [UIColor clearColor];
    [self.circleChartCalorie setStrokeColor:[UIColor clearColor]];
    // change color according to the stress lever
    [self.circleChartCalorie setStrokeColorGradientStart:[UIColor redColor]];
    [self.circleChartCalorie strokeChart];
    [self.view addSubview:self.circleChartCalorie];
    */
    

    
    //3. 显示当前花的状态
    //3.1 根据历史完成情况获取花的状态名字 xxx
    int flowerState;
    flowerState = 0;

    
    //3.2 获取花的名字
    NSString *flowerImageName;
    switch (flowerState) {
        case 0:
            flowerImageName = @"zhongzi";
            break;
        case 1:
            flowerImageName = @"youmiao";
            break;
        case 2:
            flowerImageName = @"xiaohua";
            break;
        case 3:
            flowerImageName = @"dahua";
            break;
        default:
            flowerImageName = @"guoshi";
            break;
    }
    [self.flowerBtn setImage:[UIImage imageNamed:flowerImageName] forState:UIControlStateNormal];
    
    
    NSString *flowerStateStr = [NSString stringWithFormat:@"%d", flowerState];
    //存花的状态以备后面页面使用
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: flowerStateStr forKey:@"flowerState"];
    [defaults synchronize];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//滑动手势
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"你在往左面滑动～！");
        
        
        //切换页面，记得先修修改要切换的页面的storyboard id
        UIStoryboard *mainStoryboard = self.storyboard;
        historyViewController *SVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"historyViewController"];
        
        
        //设置翻页效果
        [SVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController: SVC animated:YES completion:nil];
        
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"你在往右面滑动～！");
    }
}




//点击压力值按钮
- (IBAction)pressureBtn:(id)sender {
    [self recordBtnTypeAndPresentNewInfoVC:@"pressure"];
}
//点击睡眠按钮
- (IBAction)sleepBtn:(id)sender {
   [self recordBtnTypeAndPresentNewInfoVC:@"sleep"];
}

//点击计步按钮
- (IBAction)stepBtn:(id)sender {
   [self recordBtnTypeAndPresentNewInfoVC:@"step"];
}

//点击卡路里按钮
- (IBAction)kaluliBtn:(id)sender {
    [self recordBtnTypeAndPresentNewInfoVC:@"kaluli"];
}



//记录点击的按钮信息和翻页到info页面
- (void)recordBtnTypeAndPresentNewInfoVC:(NSString *) BtnType{
    //1.记录点击的按钮类型
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: BtnType forKey:@"infoType"];
    [defaults synchronize];
    //2.切换页面，记得先修修改要切换的页面的storyboard id
    UIStoryboard *mainStoryboard = self.storyboard;
    historyViewController *SVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"infoViewController"];
    //设置翻页效果
    [SVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController: SVC animated:YES completion:nil];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
