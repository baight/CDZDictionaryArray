//
//  CDZDictionaryArray.h
//  
//
//  Created by zhengchen2 on 14-9-5.
//  Copyright (c) 2014年 zhengchen2 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDZDictionaryArray : NSObject <NSFastEnumeration>{
    NSMutableArray* _array;
    NSMutableDictionary* _dictionary;
}

-(id)initWithCapacity:(NSUInteger)numItems;
-(NSMutableArray*)mutableArray;
-(NSMutableDictionary*)mutableDictionary;

-(void)addObject:(id)anObject forKey:(id<NSCopying>)aKey;
-(void)insertObject:(id)anObject atIndex:(NSUInteger)index forKey:(id<NSCopying>)aKey;
-(void)removeObject:(id)anObject;
-(BOOL)containsObject:(id)anObject;
-(BOOL)containsObjectForKey:(id)aKey;

// 存在aKey，则进行替换，不存在则进行简单添加
-(void)replaceObjectForKey:(id)aKey withObject:(id)anObject;

-(NSInteger)count;
-(NSInteger)indexOfObject:(id)anObject;
-(NSInteger)indexForKey:(id)aKey;

-(id)firstObject;
-(id)lastObject;
-(id)objectAtIndex:(NSUInteger)index;
-(id)objectForKey:(id)aKey;

// 获取 anObject 的 key
-(id)keyOfObject:(id)anObject;

-(void)removeAllObjects;
-(void)removeObjectForKey:(id)aKey;
-(void)removeLastObject;

@end
