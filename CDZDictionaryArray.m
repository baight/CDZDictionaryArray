//
//  CDZDictionaryArray.m
//  HappyKTV
//
//  Created by zhengchen2 on 14-9-5.
//  Copyright (c) 2014年 zhengchen2 All rights reserved.
//

#import "CDZDictionaryArray.h"

@implementation CDZDictionaryArray

-(id)init{
    self = [super init];
    if(self){
        _array = [[NSMutableArray alloc]init];
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    return self;
}

-(id)initWithCapacity:(NSUInteger)numItems{
    self = [super init];
    if(self){
        _array = [[NSMutableArray alloc]initWithCapacity:numItems];
        _dictionary = [[NSMutableDictionary alloc]initWithCapacity:numItems];
    }
    return self;
}
-(NSMutableArray*)mutableArray{
    return [NSMutableArray arrayWithArray:_array];
}
-(NSMutableDictionary*)mutableDictionary{
    return [NSMutableDictionary dictionaryWithDictionary:_dictionary];
}

-(void)addObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if(aKey == nil || anObject == nil){
        return;
    }
    id object = [_dictionary objectForKey:aKey];
    if(object){
        [_array removeObject:object];
    }
    
    [_array addObject:anObject];
    [_dictionary setObject:anObject forKey:aKey];
}

-(BOOL)containsObject:(id)anObject{
    if(anObject == nil){
        return NO;
    }
    return [_array containsObject:anObject];
}
-(BOOL)containsObjectForKey:(id)aKey{
    id object = [_dictionary objectForKey:aKey];
    return (object != nil);
}

// 存在aKey，则进行替换，不存在则进行简单添加
-(void)replaceObjectForKey:(id)aKey withObject:(id)anObject{
    if(aKey == nil || anObject == nil){
        return;
    }
    id object = [_dictionary objectForKey:aKey];
    if(object){
        NSInteger index = [_array indexOfObject:object];
        [_array replaceObjectAtIndex:index withObject:anObject];
    }
    else{
        [_array addObject:anObject];
    }
    [_dictionary setObject:anObject forKey:aKey];
}

-(void)removeObject:(id)anObject{
    if(anObject == nil){
        return;
    }
    NSString* aKey = [self keyOfObject:anObject];
    if(aKey){
        [_dictionary removeObjectForKey:aKey];
    }
    [_array removeObject:anObject];
}

-(void)removeAllObjects{
    [_dictionary removeAllObjects];
    [_array removeAllObjects];
}
-(void)removeObjectForKey:(id)aKey{
    if(aKey == nil){
        return;
    }
    id object = [_dictionary objectForKey:aKey];
    [_array removeObject:object];
    [_dictionary removeObjectForKey:aKey];
}
-(void)removeLastObject{
    id lastObject = [_array lastObject];
    NSString* aKey = [self keyOfObject:lastObject];
    if(aKey){
        [_dictionary removeObjectForKey:aKey];
    }
    [_array removeLastObject];
}
-(id)firstObject{
    return [_array firstObject];
}
-(id)lastObject{
    return [_array lastObject];
}
-(id)objectAtIndex:(NSUInteger)index{
    return [_array objectAtIndex:index];
}
-(id)objectForKey:(id)aKey{
    if(aKey == nil){
        return nil;
    }
    id object = [_dictionary objectForKey:aKey];
    return object;
}

-(NSInteger)count{
    return [_array count];
}
-(NSInteger)indexOfObject:(id)anObject{
    if(anObject == nil){
        return -1;
    }
    return [_array indexOfObject:anObject];
}
-(NSInteger)indexForKey:(id)aKey{
    id object = [_dictionary objectForKey:aKey];
    if(object){
        return [_array indexOfObject:object];
    }
    else{
        return -1;
    }
}

// 获取 anObject 的 key
-(id)keyOfObject:(id)anObject{
    for(NSString *key in _dictionary){
        id object = [_dictionary objectForKey:key];
        if(object == anObject){
            return key;
        }
    }
    return nil;
}

#pragma mark - NSFastEnumeration
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len{
    return [_array countByEnumeratingWithState:state objects:buffer count:len];
}

@end
