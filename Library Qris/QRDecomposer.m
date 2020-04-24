//
//  QRDecomposer.m
//  Library Qris
//
//  Created by Dedye Irawan on 23/04/20.
//  Copyright © 2020 Dedye Irawan. All rights reserved.
//

#import "QRDecomposer.h"

@implementation QRDecomposer

+ (NSString *)getTagValue:(NSString *)idValue tagId:(NSString *)tagId {
    int start = 0;
    long end = idValue.length;
    NSMutableDictionary *tagMap = [[NSMutableDictionary alloc] init];

    while (end - start != 0) {
        int idDigit = 2;
        int lengthDigit = 2;

        NSString *id = [idValue substringWithRange:NSMakeRange(start, idDigit)];
        int dataLength = [[idValue substringWithRange:NSMakeRange(start + idDigit, lengthDigit)] intValue];
        NSString *value = [idValue substringWithRange:NSMakeRange(start + idDigit + lengthDigit, dataLength)];
        [tagMap setValue: value forKey: id];

        start = start + idDigit + lengthDigit + dataLength;
    }
    return [tagMap objectForKey: tagId];
}

+ (NSMutableDictionary *)doDecompose: (NSString *)qrdata {
    int start = 0;
    long end = qrdata.length;

    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];

    while (end - start != 0) {
        int idDigit = 2;
        int lengthDigit = 2;

        NSString *id = [qrdata substringWithRange:NSMakeRange(start, idDigit)];
        int dataLength = [[qrdata substringWithRange:NSMakeRange(start + idDigit, lengthDigit)] intValue];
        NSString *value = [qrdata substringWithRange:NSMakeRange(start + idDigit + lengthDigit, dataLength)];
        [map setValue: value forKey: id];
        start = start + idDigit + lengthDigit + dataLength;
    }
    return map;
}

@end
