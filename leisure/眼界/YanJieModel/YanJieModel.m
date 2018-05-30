//
//  YanJieModel.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YanJieModel.h"

@implementation YanJieModel

//+(JSONKeyMapper*)keyMapper
//{
//    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"descrip",@"id":@"ID",@"duration":@"duration",@"consumption.collectionCount":@"collectionCount",@"consumption.replyCount":@"replyCount",@"consumption.shareCount":@"shareCount"}];
//}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    
//    [super setValue:value forKey:key];
//    
//    if ([key isEqualToString:@"duration"]) {
//        
//        self.duration = [value stringValue];
//        
//    }
//    
//        if ([key isEqualToString:@"collectionCount"]) {
//    
//            self.collectionCount = [value stringValue];
//    
//        }
//    
//        if ([key isEqualToString:@"replyCount"]) {
//    
//            self.replyCount = [value stringValue];
//    
//        }
//    
//        if ([key isEqualToString:@"shareCount"]) {
//    
//            self.shareCount = [value stringValue];
//            
//        }
//
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"description"]) {
        
        self.descrip = value;
        
    }
    
    if ([key isEqualToString:@"id"]) {
        
        self.ID = [value stringValue];
        
    }
    
}

- (void)setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"duration"]) {
        
        self.duration = [value stringValue];
        
    }

}





//}
@end
