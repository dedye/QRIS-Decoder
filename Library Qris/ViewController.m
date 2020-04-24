//
//  ViewController.m
//  Library Qris
//
//  Created by Dedye Irawan on 05/04/20.
//  Copyright © 2020 Dedye Irawan. All rights reserved.
//

#import "ViewController.h"
#import "CRCCalculator.h"
#import "QRDecomposer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];

    NSString * dataQR = @"00020101021126690017COM.TELKOMSEL.WWW011893600911000160100102151905150116010010303UMI27610014COM.GO-JEK.WWW01189360091434451371680210G4451371680303UMI51440014ID.CO.QRIS.WWW0215ID10190000014030303UMI5204866153033605802ID5908Infak.ID6012Kota Bandung61054027562070703A016304692E";

    map = [QRDecomposer doDecompose: dataQR];

    Boolean validCrc = [CRCCalculator isValidCrc:dataQR compareWithValueCrc:[map objectForKey:@"63"]];
    if (validCrc) {
        NSLog(@"Valid CRC");
    } else {
        NSLog(@"Invalid CRC");
    }

    NSString *dataCRC = [map objectForKey:@"63"];
    NSLog(@"CRC : %@",dataCRC);

    NSString *countryCode = [map objectForKey:@"58"];
    NSLog(@"Country Code : %@",countryCode);

    NSString *merchantId = [QRDecomposer getTagValueWithNSString:[map objectForKey:@"51"] withNSString:@"02"];
    NSLog(@"Merchant Id : %@",merchantId);

    NSString *merchantName = [map objectForKey:@"59"];
    NSLog(@"Merchant Name : %@",merchantName);

    NSString *merchantCategoryCode = [map objectForKey:@"52"];
    NSLog(@"Merchant Category Code : %@",merchantCategoryCode);

    NSString *merchantCity = [map objectForKey:@"60"];
    NSLog(@"Merchant City : %@",merchantCity);

    NSString *merchantCriteria = [QRDecomposer getTagValueWithNSString:[map objectForKey:@"26"] withNSString:@"03"];
    NSLog(@"Merchant Criteria : %@",merchantCriteria);

    NSString *terminalId = [QRDecomposer getTagValueWithNSString:[map objectForKey:@"62"] withNSString:@"07"];
    NSLog(@"Terminal Id : %@",terminalId);
}

@end
