//
//  InitSqlite3.h
//  store
//
//  Created by yangjun on 16/1/9.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface InitSqlite3 : NSObject{
    
}
- (void) createDataBase;
- (void) createPlanItemTable;
- (void) outputTable;
- (void) insertPlanItem;
- (void) createPlanHistoryTable;
@end