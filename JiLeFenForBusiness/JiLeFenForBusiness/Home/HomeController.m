//
//  HomeController.m
//  JiLeFenForBusiness
//
//  Created by huanghaiyang on 16/5/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HomeController.h"
#import "HomeTopView.h"
#import "AccountController.h"
#import "ActivityListController.h"
#import "GoodsConvertController.h"
#import "UsableScoreController.h"
#import "ModifyScoreController.h"
#import "ConsumeScoreController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DEFAULT_VIEW_CONTROLLER_BACKGROUND_COLOR;
    
    HomeTopView *topView = [[HomeTopView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, 150)];
    [topView.accountButton addTarget:self action:@selector(toAccountVC) forControlEvents:UIControlEventTouchUpInside];
    [topView.activityButton addTarget:self action:@selector(toActivityVC) forControlEvents:UIControlEventTouchUpInside];
    [topView.goodsConvertButton addTarget:self action:@selector(toGoodsConvertVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topView];
    
    
    CGFloat width = (self.view.width-2)/3;
    NSArray *images = @[@"首页-可用积分小图标", @"首页消费积分", @"首页-积分倍数修改小图标"];
    NSArray *titles = @[@"可用积分", @"消费积分", @"积分倍数修改"];
    CGFloat height = width;
    for (int index = 0; index < 3; index++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(index*(width+1), topView.y+topView.height, width, height);
        [self.view addSubview:view];
        
        UIView *contentView = [UIView new];
        contentView.frame = CGRectMake(0, 20, view.width, view.height-40);
        [view addSubview:contentView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:images[index]];
        CGFloat buttonHeight = contentView.height-16;
        CGFloat buttonWidth = image.size.width/image.size.height*buttonHeight;
        button.frame = CGRectMake((contentView.width-buttonWidth)/2, 0, buttonWidth, buttonHeight);
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [contentView addSubview:button];
        if (index == 0) {
            [button addTarget:self action:@selector(toUsableScoreVC) forControlEvents:UIControlEventTouchUpInside];
        } else if (index == 1) {
            [button addTarget:self action:@selector(toConsumeScoreVC) forControlEvents:UIControlEventTouchUpInside];
        } else if (index == 2) {
            [button addTarget:self action:@selector(toModifyScorePointVC) forControlEvents:UIControlEventTouchUpInside];
        }
        
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = kRGBColor(110, 110, 110);
        label.text = titles[index];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(5, button.height+3, contentView.width-10, 13);
        [contentView addSubview:label];
        
        
    }
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}

- (void)toAccountVC {
    AccountController *account = [AccountController new];
    [self.navigationController pushViewController:account animated:YES];
    
}
- (void)toActivityVC {
    ActivityListController *activityList = [ActivityListController new];
    [self.navigationController pushViewController:activityList animated:YES];
    
}
- (void)toGoodsConvertVC {
    GoodsConvertController *goodsConvert = [GoodsConvertController new];
    [self.navigationController pushViewController:goodsConvert animated:YES];
    
}
- (void)toUsableScoreVC {
    UsableScoreController *usableScore = [UsableScoreController new];
    [self.navigationController pushViewController:usableScore animated:YES];
    
}
- (void)toConsumeScoreVC {
    ConsumeScoreController *consumeScore = [ConsumeScoreController new];
    [self.navigationController pushViewController:consumeScore animated:YES];
    
}
- (void)toModifyScorePointVC {
    ModifyScoreController *modifyScore = [ModifyScoreController new];
    [self.navigationController pushViewController:modifyScore animated:YES];
    
}
@end
