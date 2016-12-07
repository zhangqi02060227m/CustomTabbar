//
//  FilmCommentModel.h
//  Demo
//
//  Created by zhangqi on 2016/12/6.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "BaseModel.h"

@interface FilmCommentModel : BaseModel

@property (nonatomic, copy) NSString *avatarurl;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *authInfo;
@property (nonatomic, assign) NSInteger approve;





//"approve": 1153,
//"approved": false,
//"authInfo": "新浪娱乐电影记者",
//"avatarurl": "http://p0.meituan.net/avatar/0b1f2530d8258f182dc3e1caf41c2a7553357.jpg",
//"cityName": "北京",
//"content": "以前对新海诚无感，第一次看大银幕被touch到了，细节丰富，还想再刷。日本现象级票房炸弹，换身+穿越剧本相对扎实，画风继续壁纸，原声照旧很煽，对灾难和民俗的刻画让故事走出了矫情空泛的老路子。看哭的人都会相信，冥冥之中缘分天注定，茫茫人海总有相遇那一天。",
//"created": 1479995538000,
//"filmView": false,
//"gender": 2,
//"id": 87358329,
//"isMajor": false,
//"juryLevel": 1,
//"movieId": 344881,
//"nick": "何小沁",
//"nickName": "何小沁",
//"oppose": 0,
//"pro": true,
//"reply": 0,
//"score": 4,
//"spoiler": 0,
//"startTime": "2016-11-24 21:52:18",
//"supportComment": false,
//"supportLike": true,
//"sureViewed": 0,
//"time": "2016-11-24 21:52",
//"userId": 5041135,
//"userLevel": 4,
//"vipInfo": "猫眼专业评委",
//"vipType": 3


@end
