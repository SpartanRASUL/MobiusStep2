//
//  Injector.m
//  MOBFramework
//
//  Created by Rasul Tataev on 10/04/2020.
//  Copyright © 2020 RSY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CydiaSubstrate/CydiaSubstrate.h>
#import "Injector.h"

@implementation Injector

static void (*spendMoneyHook_orig)(int) = NULL;

static void __attribute__((constructor)) initialize(void){
    NSLog(@"Hello from Framework");
    void *spendMoneyHook = MSFindSymbol(NULL, "_$s11MobiusStep215PurchaseManagerC5spendyySiF");
    MSHookFunction(spendMoneyHook, (void*)spendMoneyHookSwizzled, (void**)&spendMoneyHook_orig);
}

static void spendMoneyHookSwizzled(int amount) {
    spendMoneyHook_orig(0);
}

@end
