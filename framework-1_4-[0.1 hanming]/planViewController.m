//
//  planViewController.m
//  framework-1_4-[0.1 hanming]
//
//  Created by 韩明 on 16/1/5.
//  Copyright © 2016年 韩明. All rights reserved.
//

#import "planViewController.h"
#import "exeViewController.h"
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


@end

@implementation planViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //0. 获取当前的计划信息 xxx
    
    //1. 修改四个plan的显示信息
    //1.1 plan1
    self.plan1Date.text = @"Jan 1";
    self.plan1Text.text = @"运动下";
    int plan1Type;
    plan1Type = 0;
    
    
     NSString *plan1BtnImageName;
    switch (plan1Type) {
        case 0:
            plan1BtnImageName = @"planType0";
            break;
        case 1:
            plan1BtnImageName = @"planType1";
            break;
        case 2:
            plan1BtnImageName = @"planType2";
            break;
        case 3:
            plan1BtnImageName = @"planType3";
            break;
        case 4:
            plan1BtnImageName = @"planType4";
            break;
        default:
            plan1BtnImageName = @"planType0";
            break;
    }
    
    //1.2 plan2
    self.plan2Date.text = @"Jan 2";
    self.plan2Text.text = @"写点东西";
    int plan2Type;
    plan2Type = 1;
    
    
    NSString *plan2BtnImageName;
    switch (plan2Type) {
        case 0:
            plan2BtnImageName = @"planType0";
            break;
        case 1:
            plan2BtnImageName = @"planType1";
            break;
        case 2:
            plan2BtnImageName = @"planType2";
            break;
        case 3:
            plan2BtnImageName = @"planType3";
            break;
        case 4:
            plan2BtnImageName = @"planType4";
            break;
        default:
            plan2BtnImageName = @"planType0";
            break;
    }
    
    //1.3 plan3
    
    self.plan3Date.text = @"Jan 3";
    self.plan3Text.text = @"日记";
    int plan3Type;
    plan3Type = 3;
    
    NSString *plan3BtnImageName;
    switch (plan3Type) {
        case 0:
            plan3BtnImageName = @"planType0";
            break;
        case 1:
            plan3BtnImageName = @"planType1";
            break;
        case 2:
            plan3BtnImageName = @"planType2";
            break;
        case 3:
            plan3BtnImageName = @"planType3";
            break;
        case 4:
            plan3BtnImageName = @"planType4";
            break;
        default:
            plan3BtnImageName = @"planType0";
            break;
    }
    
    //1.4 plan4
    self.plan4Date.text = @"Jan 4";
    self.plan4Text.text = @"感恩";
    int plan4Type;
    plan4Type = 4;
    
    
    NSString *plan4BtnImageName;
    switch (plan4Type) {
        case 0:
            plan4BtnImageName = @"planType0";
            break;
        case 1:
            plan4BtnImageName = @"planType1";
            break;
        case 2:
            plan4BtnImageName = @"planType2";
            break;
        case 3:
            plan4BtnImageName = @"planType3";
            break;
        case 4:
            plan4BtnImageName = @"planType4";
            break;
        default:
            plan4BtnImageName = @"planType0";
            break;
    }
    
    //2. 右上角花的状态（同mainVC中的花的状态）
    //2.1 根据历史完成情况获取花的状态名字
    
    NSString *flowerStateStr = [[NSUserDefaults standardUserDefaults] valueForKey:@"flowerState"];
    int flowerState;
    flowerState = [flowerStateStr intValue];
    
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
        default:
            flowerImageName = @"guoshi";
            break;
    }
    self.flowerImage.image = [UIImage imageNamed: flowerImageName];//改变imageview的图标
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//4个button的点击
- (IBAction)plan1BtnClicked:(id)sender {
    [self recordBtnTypeAndPresentNewExeVC:@"plan1"];
}
- (IBAction)plan2BtnClicked:(id)sender {
    [self recordBtnTypeAndPresentNewExeVC:@"plan2"];
}
- (IBAction)plan3BtnClicked:(id)sender {
    [self recordBtnTypeAndPresentNewExeVC:@"plan3"];
}
- (IBAction)plan4BtnClicked:(id)sender {
    [self recordBtnTypeAndPresentNewExeVC:@"plan4"];
}






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





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
