//
//  planViewController.m
//  framework-1_4-[0.1 hanming]
//
//  Created by 韩明 on 16/1/5.
//  Copyright © 2016年 韩明. All rights reserved.
//

#import "planViewController.h"
#import "exe1ViewController.h"
#import "exe2ViewController.h"
#import "exe3ViewController.h"
#import "exe4ViewController.h"
#import "exe5ViewController.h"
#import "exe6ViewController.h"
#import "analysisViewController.h"

#import "CurrentPlan.h"


@interface planViewController ()
@property (weak, nonatomic) IBOutlet UIButton *plan1Btn;
@property (weak, nonatomic) IBOutlet UIButton *plan2Btn;
@property (weak, nonatomic) IBOutlet UIButton *plan3Btn;
@property (weak, nonatomic) IBOutlet UIButton *plan4Btn;

@property (weak, nonatomic) IBOutlet UILabel *plan1Date;
@property (weak, nonatomic) IBOutlet UILabel *plan2Date;
@property (weak, nonatomic) IBOutlet UILabel *plan3Date;
@property (weak, nonatomic) IBOutlet UILabel *plan4Date;

@property (weak, nonatomic) IBOutlet UILabel *plan1Text;
@property (weak, nonatomic) IBOutlet UILabel *plan2Text;
@property (weak, nonatomic) IBOutlet UILabel *plan4Text;
@property (weak, nonatomic) IBOutlet UILabel *plan3Text;

@property (weak, nonatomic) IBOutlet UIImageView *flowerImage;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;//计划的显示窗口（小）
@property (weak, nonatomic) IBOutlet UIView *planCellView;//计划的内容（大）

@property int plan1Type; // 跳转所用的交互类型，由item的inte决定
@property int plan2Type;
@property int plan3Type;
@property int plan4Type;

@property int plan1Sour; // 显示的类别，比如是感恩还是运动，由item的sour决定
@property int plan2Sour;
@property int plan3Sour;
@property int plan4Sour;

@property CurrentPlan* currentPlan;
@end

@implementation planViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //-------------------------------------------------------------------------
    //-1. 使用实现滚动
    [self.myScrollView addSubview:self.planCellView];
    // 设置UIScrollView的滚动范围（内容大小）
    self.myScrollView.contentSize = CGSizeMake(0, 1500);//只设置长度，这样就只能左右滑
    
    // 隐藏水平滚动条
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.showsVerticalScrollIndicator = NO;
    
    
    // 增加额外的滚动区域（逆时针，上、左、下、右）
    // top  left  bottom  right
    self.myScrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //0. 获取当前的计划信息 xxx
    self.currentPlan = [CurrentPlan new];
    if (self.currentPlan.have.boolValue == 1) {
        //还没有计划，当然需要有一个张图片显示说没有计划啦
        
    }else if(self.currentPlan.done.boolValue == 1){
        //计划已经做完啦，所以呢，显示你已经完成计划的提示啦
        
    }
    
    //设置日期格式啦
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    fmt.dateFormat = @"MM月dd日";
    //NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    //NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"America/New_York"];
    //[fmt setTimeZone:timeZone];
    //1. 修改四个plan的显示信息
    //1.1 plan1
    if(self.currentPlan.number > 0){
        self.plan1Date.text = [fmt stringFromDate:self.currentPlan.time1];
        self.plan1Text.text = self.currentPlan.info1;
        self.plan1Type = self.currentPlan.type1.intValue;
        self.plan1Sour = self.currentPlan.sour1.intValue;
        NSString *plan1BtnImageName;
        switch (self.plan1Sour) {
            case 0:
                plan1BtnImageName = PLANSOURCE0;
                break;
            case 1:
                plan1BtnImageName = PLANSOURCE1;
                break;
            case 2:
                plan1BtnImageName = PLANSOURCE2;
                break;
            case 3:
                plan1BtnImageName = PLANSOURCE3;
                break;
            case 4:
                plan1BtnImageName = PLANSOURCE4;
                break;
            case 5:
                plan1BtnImageName = PLANSOURCE5;
                break;
            case 6:
                plan1BtnImageName = PLANSOURCE6;
                break;
            case 7:
                plan1BtnImageName = PLANSOURCE7;
                break;
            case 8:
                plan1BtnImageName = PLANSOURCE8;
                break;
            case 9:
                plan1BtnImageName = PLANSOURCE9;
                break;
            case 10:
                plan1BtnImageName = PLANSOURCE10;
                break;
            default:
                plan1BtnImageName = PLANSOURCE0;
                break;
        }
        [self.plan1Btn setImage:[UIImage imageNamed:plan1BtnImageName] forState:UIControlStateNormal];
    }else{
       //不显示
    }
    //1.2 plan2
    if(self.currentPlan.number.intValue > 1){
        self.plan2Date.text = [fmt stringFromDate:self.currentPlan.time2];
        self.plan2Text.text = self.currentPlan.info2;
        self.plan2Type = self.currentPlan.type2.intValue;
        self.plan2Sour = self.currentPlan.sour2.intValue;
        NSString *plan2BtnImageName;
        switch (self.plan2Sour) {
            case 0:
                plan2BtnImageName = PLANSOURCE0;
                break;
            case 1:
                plan2BtnImageName = PLANSOURCE1;
                break;
            case 2:
                plan2BtnImageName = PLANSOURCE2;
                break;
            case 3:
                plan2BtnImageName = PLANSOURCE3;
                break;
            case 4:
                plan2BtnImageName = PLANSOURCE4;
                break;
            case 5:
                plan2BtnImageName = PLANSOURCE5;
                break;
            case 6:
                plan2BtnImageName = PLANSOURCE6;
                break;
            case 7:
                plan2BtnImageName = PLANSOURCE7;
                break;
            case 8:
                plan2BtnImageName = PLANSOURCE8;
                break;
            case 9:
                plan2BtnImageName = PLANSOURCE9;
                break;
            case 10:
                plan2BtnImageName = PLANSOURCE10;
                break;
            default:
                plan2BtnImageName = PLANSOURCE0;
                break;
        }
        [self.plan2Btn setImage:[UIImage imageNamed:plan2BtnImageName] forState:UIControlStateNormal];
    }else{
        //不显示
    }
    //1.3 plan3
    if(self.currentPlan.number.intValue > 2){
        self.plan3Date.text = [fmt stringFromDate:self.currentPlan.time3];
        self.plan3Text.text = self.currentPlan.info3;
        self.plan3Type = self.currentPlan.type3.intValue;
        self.plan3Sour = self.currentPlan.sour3.intValue;
        NSString *plan3BtnImageName;
        switch (self.plan3Sour) {
            case 0:
                plan3BtnImageName = PLANSOURCE0;
                break;
            case 1:
                plan3BtnImageName = PLANSOURCE1;
                break;
            case 2:
                plan3BtnImageName = PLANSOURCE2;
                break;
            case 3:
                plan3BtnImageName = PLANSOURCE3;
                break;
            case 4:
                plan3BtnImageName = PLANSOURCE4;
                break;
            case 5:
                plan3BtnImageName = PLANSOURCE5;
                break;
            case 6:
                plan3BtnImageName = PLANSOURCE6;
                break;
            case 7:
                plan3BtnImageName = PLANSOURCE7;
                break;
            case 8:
                plan3BtnImageName = PLANSOURCE8;
                break;
            case 9:
                plan3BtnImageName = PLANSOURCE9;
                break;
            case 10:
                plan3BtnImageName = PLANSOURCE10;
                break;
            default:
                plan3BtnImageName = PLANSOURCE0;
                break;

        }
        [self.plan3Btn setImage:[UIImage imageNamed:plan3BtnImageName] forState:UIControlStateNormal];
    }else{
        //不显示
    }
    //1.4 plan4
    if(self.currentPlan.number.intValue > 3){
        self.plan4Date.text =  [fmt stringFromDate:self.currentPlan.time4];
        self.plan4Text.text = self.currentPlan.info1;
        self.plan4Type = self.currentPlan.type4.intValue;
        self.plan4Sour = self.currentPlan.sour4.intValue;
        NSString *plan4BtnImageName;
        switch (self.plan4Sour) {
            case 0:
                plan4BtnImageName = PLANSOURCE0;
                break;
            case 1:
                plan4BtnImageName = PLANSOURCE1;
                break;
            case 2:
                plan4BtnImageName = PLANSOURCE2;
                break;
            case 3:
                plan4BtnImageName = PLANSOURCE3;
                break;
            case 4:
                plan4BtnImageName = PLANSOURCE4;
                break;
            case 5:
                plan4BtnImageName = PLANSOURCE5;
                break;
            case 6:
                plan4BtnImageName = PLANSOURCE6;
                break;
            case 7:
                plan4BtnImageName = PLANSOURCE7;
                break;
            case 8:
                plan4BtnImageName = PLANSOURCE8;
                break;
            case 9:
                plan4BtnImageName = PLANSOURCE9;
                break;
            case 10:
                plan4BtnImageName = PLANSOURCE10;
                break;
            default:
                plan4BtnImageName = PLANSOURCE0;
                break;

        }
        [self.plan4Btn setImage:[UIImage imageNamed:plan4BtnImageName] forState:UIControlStateNormal];
    }else{
        //不显示
        self.plan4Btn.hidden = YES;
        self.plan4Date.hidden = YES;
        self.plan4Text.hidden = YES;
    }
    
    //2. 右上角花的状态（同mainVC中的花的状态）
    //2.1 根据历史完成情况获取花的状态名字
    
    int flowerState = [[[NSUserDefaults standardUserDefaults] valueForKey:@"flowerState"] intValue];
    
    //2.2 获取花的名字
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
        case 4:
            flowerImageName = @"dahua";
            break;
        case 5:
            flowerImageName = @"dahua";
            break;
        case 6:
            flowerImageName = @"dahua";
            break;
        default:
            flowerImageName = @"guoshi";
            break;
    }
    self.flowerImage.image = [UIImage imageNamed: flowerImageName];//改变imageview的图标
    
    //上面的代码呀，都是设置值的，下面来调调大小呀，设置美化呀等等
    //那个字太大了，给它弄小点
    self.plan1Date.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    self.plan2Date.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    self.plan3Date.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    self.plan4Date.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//4个button的点击
- (IBAction)plan1BtnClicked:(id)sender {
    if (self.currentPlan.number.intValue > 0) {
        //记录当前plan的信息，以备后面执行界面显示
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSTimeInterval interval = [self.currentPlan.time1 timeIntervalSinceNow];
        NSLog(@"time interval to be judged: %i",(int)interval / 3600);
        if (interval > 24*3600) {          //一天以后
            [defaults setObject:[NSNumber numberWithInt:2] forKey:PLANSTATE];
        }else if (interval > - 24 * 3600){ //前后一天之内
            [defaults setObject:[NSNumber numberWithInt:1] forKey:PLANSTATE];
        }else{                             //一天之前
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        if (self.currentPlan.fin1.boolValue == YES) {
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        [defaults setObject: self.currentPlan.id1      forKey:PLANID];
        [defaults setObject: self.currentPlan.time1    forKey:PLANDATE];
        [defaults setObject: self.currentPlan.content1 forKey:PLANTEXT];
        [defaults setObject: self.currentPlan.info1    forKey:PLANINFO];
        [defaults setObject: self.currentPlan.sour1    forKey:PLANTYPE];
        [defaults setObject: self.currentPlan.fintime1 forKey:PLANFINTIME];
        [defaults setObject: self.currentPlan.output1  forKey:PLANOUTPUT];
        [defaults setObject: self.currentPlan.fin1     forKey:PLANFIN];
        [defaults synchronize];
        //跳转到执行页面
        [self presentExeVC:self.plan1Type];
    }else{
        //do nothing because don't have this item
    }
}


- (IBAction)plan2BtnClicked:(id)sender {
    if (self.currentPlan.number.intValue > 1) {
        //记录当前plan的信息，以备后面执行界面显示
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSTimeInterval interval = [self.currentPlan.time2 timeIntervalSinceNow];
        NSLog(@"time interval to be judged: %i",(int)interval / 3600);
        if (interval > 24*3600) {          //一天以后
            [defaults setObject:[NSNumber numberWithInt:2] forKey:PLANSTATE];
        }else if (interval > - 24 * 3600){ //前后一天之内
            [defaults setObject:[NSNumber numberWithInt:1] forKey:PLANSTATE];
        }else{                             //一天之前
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        if (self.currentPlan.fin2.boolValue == YES) {
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        [defaults setObject: self.currentPlan.id2      forKey:PLANID];
        [defaults setObject: self.currentPlan.time2    forKey:PLANDATE];
        [defaults setObject: self.currentPlan.content2 forKey:PLANTEXT];
        [defaults setObject: self.currentPlan.info2    forKey:PLANINFO];
        [defaults setObject: self.currentPlan.sour2    forKey:PLANTYPE];
        [defaults setObject: self.currentPlan.fintime2 forKey:PLANFINTIME];
        [defaults setObject: self.currentPlan.output2  forKey:PLANOUTPUT];
        [defaults setObject: self.currentPlan.fin2     forKey:PLANFIN];
        [defaults synchronize];
        //跳转到执行页面
        [self presentExeVC:self.plan2Type];
    }else{
        //do nothing because don't have this item
    }
}


- (IBAction)plan3BtnClicked:(id)sender {
    if (self.currentPlan.number.intValue > 2) {
        //记录当前plan的信息，以备后面执行界面显示
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSTimeInterval interval = [self.currentPlan.time3 timeIntervalSinceNow];
        NSLog(@"time interval to be judged: %i",(int)interval / 3600);
        if (interval > 24*3600) {          //一天以后
            [defaults setObject:[NSNumber numberWithInt:2] forKey:PLANSTATE];
        }else if (interval > - 24 * 3600){ //前后一天之内
            [defaults setObject:[NSNumber numberWithInt:1] forKey:PLANSTATE];
        }else{                             //一天之前
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        if (self.currentPlan.fin3.boolValue == YES) {
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        [defaults setObject: self.currentPlan.id3      forKey:PLANID];
        [defaults setObject: self.currentPlan.time3    forKey:PLANDATE];
        [defaults setObject: self.currentPlan.content3 forKey:PLANTEXT];
        [defaults setObject: self.currentPlan.info3    forKey:PLANINFO];
        [defaults setObject: self.currentPlan.sour3    forKey:PLANTYPE];
        [defaults setObject: self.currentPlan.fintime3 forKey:PLANFINTIME];
        [defaults setObject: self.currentPlan.output3  forKey:PLANOUTPUT];
        [defaults setObject: self.currentPlan.fin3     forKey:PLANFIN];
        [defaults synchronize];
        //跳转到执行页面
        [self presentExeVC:self.plan3Type];
    }else{
        //do nothing because don't have this item
    }
}

- (IBAction)plan4BtnClicked:(id)sender {
    if (self.currentPlan.number.intValue > 3) {
        //记录当前plan的信息，以备后面执行界面显示
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSTimeInterval interval = [self.currentPlan.time4 timeIntervalSinceNow];
        NSLog(@"time interval to be judged: %i",(int)interval / 3600);
        if (interval > 24*3600) {          //一天以后
            [defaults setObject:[NSNumber numberWithInt:2] forKey:PLANSTATE];
        }else if (interval > - 24 * 3600){ //前后一天之内
            [defaults setObject:[NSNumber numberWithInt:1] forKey:PLANSTATE];
        }else{                             //一天之前
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        if (self.currentPlan.fin4.boolValue == YES) {
            [defaults setObject:[NSNumber numberWithInt:0] forKey:PLANSTATE];
        }
        [defaults setObject: self.currentPlan.id4      forKey:PLANID];
        [defaults setObject: self.currentPlan.time4    forKey:PLANDATE];
        [defaults setObject: self.currentPlan.content4 forKey:PLANTEXT];
        [defaults setObject: self.currentPlan.info4    forKey:PLANINFO];
        [defaults setObject: self.currentPlan.sour4    forKey:PLANTYPE];
        [defaults setObject: self.currentPlan.fintime4 forKey:PLANFINTIME];
        [defaults setObject: self.currentPlan.output4  forKey:PLANOUTPUT];
        [defaults setObject: self.currentPlan.fin4     forKey:PLANFIN];
        [defaults synchronize];
        //跳转到执行页面
        [self presentExeVC:self.plan4Type];
    }else{
        //do nothing because don't have this item

    }
}


- (void) presentExeVC:(int) planType{
    UIStoryboard *mainStoryboard = self.storyboard;
    exe1ViewController *SVC;
    NSLog(@"to %i", planType);

    switch (planType) {
        case 1:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe1ViewController"];
            NSLog(@"jump to page: exe1 ");
            break;
        case 2:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe2ViewController"];
            NSLog(@"jump to page: exe2 ");
            break;
        case 3:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe3ViewController"];
            NSLog(@"jump to page: exe3 ");
            break;
        case 4:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe4ViewController"];
            NSLog(@"jump to page: exe4 ");
            break;
        case 5:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe5ViewController"];
            NSLog(@"jump to page: exe5 ");
            break;
        case 6:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe6ViewController"];
            NSLog(@"jump to page: exe6 ");
            break;
        case 7:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe7ViewController"];
            NSLog(@"jump to page: exe7 ");
            break;
        default:
            SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"exe1ViewController"];
            NSLog(@"jump to page: exe1 ");
            break;
    }
    //设置翻页效果
    [SVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController: SVC animated:YES completion:nil];
}
- (IBAction)finishBtnClicked:(id)sender {
    
    Plan * plan = [Plan new];
    [plan store];
    
    UIStoryboard *mainStoryboard = self.storyboard;
    analysisViewController *SVC;
    SVC= [mainStoryboard instantiateViewControllerWithIdentifier:@"analysisViewController"];
    [self presentViewController: SVC animated:YES completion:nil];
    
}

/*

//记录点击的按钮信息和翻页到info页面
- (void)recordBtnTypeAndPresentNewExeVC:(NSString *) BtnType{
    //1.记录点击的按钮类型
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: BtnType forKey:@"planType"];
    [defaults synchronize];

    //2.切换页面，记得先修修改要切换的页面的storyboard id
    //2.1 判断要调到哪种类型的页面
    NSString *whichVCtoJump;
    
    UIStoryboard *mainStoryboard = self.storyboard;
    exeViewController *SVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"exeViewController"];
    
    //设置翻页效果
    [SVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController: SVC animated:YES completion:nil];
}
*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
