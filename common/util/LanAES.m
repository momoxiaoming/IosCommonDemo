//
//  SecurityUtil.m
//  Yelloweb
//
//  Created by allen on 2016/12/26.
//  Copyright © 2016年 allen. All rights reserved.
//

#import "LanAES.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>


#define PASSWORD @"in3&1$d.x?#@XdFm"    //加密的秘钥


@implementation LanAES

/**
 aes 加解密
 */
+(NSString *)AES128:(CCOperation)operation data:(NSData *)text  //加密
{
    
        char keyPtr[kCCKeySizeAES128 + 1];  //kCCKeySizeAES128是加密位数 可以替换成256位的
        bzero(keyPtr, sizeof(keyPtr));
        [PASSWORD getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    
    
        size_t bufferSize = [text length] + kCCBlockSizeAES128;
        void *buffer = malloc(bufferSize);
        size_t numBytesEncrypted = 0;
    
        CCCryptorStatus extractedExpr = CCCrypt(operation, kCCAlgorithmAES128,
                                                kCCOptionPKCS7Padding | kCCOptionECBMode,
                                                keyPtr, kCCKeySizeAES128,
                                                NULL,
                                                [text bytes], [text length],
                                                buffer, bufferSize,
                                                &numBytesEncrypted);
        if (extractedExpr == kCCSuccess) {
            NSData* rlt=[NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
            if(operation==kCCEncrypt){
    
               return [rlt base64EncodedStringWithOptions:0];
            }else{
                return [[NSString alloc] initWithData:rlt encoding:NSUTF8StringEncoding];
            }
    
        }
        free(buffer);
        return nil;
    
    
    
    
    
}





+(NSString*)aes128_encrypt:(NSString *)text{
    return  [LanAES AES128:kCCEncrypt data:[text dataUsingEncoding:NSUTF8StringEncoding]];
}

+(NSString*)aes128_decrypt:(NSString *)text{
    //转换为2进制Data
    //注意这里要先base64解密
    return [LanAES AES128:kCCDecrypt data:[[NSData alloc]initWithBase64EncodedString:text options:0]];
}

@end
