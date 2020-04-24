//
//  QRDecomposer.h
//  Library Qris
//
//  Created by Dedye Irawan on 23/04/20.
//  Copyright © 2020 Dedye Irawan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QRDecomposer : NSObject

+ (NSString *)getTagValueWithNSString:(NSString *)idValue withNSString:(NSString *)tagId;

+ (NSMutableDictionary *)doDecompose: (NSString *)qrdata;

@end

