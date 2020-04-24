//
//  CRCCalculator.m
//  Library Qris
//
//  Created by Dedye Irawan on 06/04/20.
//  Copyright © 2020 Dedye Irawan. All rights reserved.
//

#import "CRCCalculator.h"

@implementation CRCCalculator

uint16_t genCrc16 (const uint8_t * buffer, uint32_t size) {
    uint16_t crc = 0xFFFF;

    if (buffer && size)
        while (size--)
        {
            crc = (crc >> 8) | (crc << 8);
            crc ^= *buffer++;
            crc ^= ((unsigned char) crc) >> 4;
            crc ^= crc << 12;
            crc ^= (crc & 0xFF) << 5;
        }

    return crc;
}

+ (Boolean) isValidCrc:(NSString *)data compareWithValueCrc:(NSString *)valueCrc {
    Boolean validCrc = false;
    NSString *validasiData = [data substringWithRange:NSMakeRange(0, [data length] - 4)];
    NSData* dataCrc = [validasiData dataUsingEncoding:NSUTF8StringEncoding];
    unsigned long result = [self callCrc: dataCrc];
    result &= (int) 0xffff;
    NSString *formatHex = [NSString stringWithFormat:@"%2lX", result];

    if ([formatHex isEqualToString:valueCrc]) {
        validCrc = true;
    }
    return validCrc;
}

+ (unsigned short)callCrc:(NSData*)data {
    const uint8_t *bytes = (const uint8_t *)[data bytes];
    uint16_t length = (uint16_t)[data length];
    return (unsigned short)genCrc16(bytes, length);
}

@end
