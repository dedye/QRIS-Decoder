//
//  CRCCalculator.h
//  Library Qris
//
//  Created by Dedye Irawan on 06/04/20.
//  Copyright © 2020 Dedye Irawan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRCCalculator: NSObject

+ (Boolean)isValidCrc:(NSString *)data compareWithValueCrc:(NSString *)valueCrc;

@end
