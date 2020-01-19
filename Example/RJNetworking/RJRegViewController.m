//
//  RJRegViewController.m
//  RJNetworking_Example
//
//  Created by jia on 2020/1/19.
//  Copyright © 2020 Ronniejia. All rights reserved.
//

#import "RJRegViewController.h"
#import <RJNetworking/RJHTTPSessionManager+API.h>

@interface RJRegViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UILabel *resLabel;

@end

@implementation RJRegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height+44+60, self.view.frame.size.width, self.view.frame.size.height/2-([UIApplication sharedApplication].statusBarFrame.size.height+44+60)-10)];
    [self.view addSubview:scrollV];
    
    for (int i = 0; i<self.count; i++) {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, i*45+10, self.view.frame.size.width-40, 35)];
        textField.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
        textField.textColor = [UIColor blackColor];
        textField.tag = 100+i;
        [scrollV addSubview:textField];
        scrollV.contentSize = CGSizeMake(self.view.frame.size.width, textField.frame.size.height+textField.frame.origin.x+10);
    }
    
}

- (IBAction)sureAction:(id)sender {
    if (self.index==0) {
        [kRJHTTPClient regis:self.phone.text code:[self fetchStringIndex:0] pwd:[self fetchStringIndex:1] completion:^(RJHTTPResponse * _Nonnull response) {
            [self showRes:response];
        }];
    }
}

- (NSString *)fetchStringIndex:(NSInteger)index {
    UITextField *tf = [self.view viewWithTag:100+index];
    return tf.text;
}

- (IBAction)codeAction:(id)sender {
    [kRJHTTPClient fetchPhoneCode:self.phone.text type:PhoneCodeTypeRegis completion:^(RJHTTPResponse * _Nonnull response) {
        [self showRes:response];
    }];
}

- (void)showRes:(RJHTTPResponse *)res {
    if (res.responseCode <= RJResponseCodeSuccess) {
        self.resLabel.text = [NSString stringWithFormat:@"%@",res.responseObject];
    } else {
        self.resLabel.text = [NSString stringWithFormat:@"%@",res.message];
    }
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
