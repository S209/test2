//
//  ViewController.m
//  TestProject
//
//  Created by tuhaisheng on 17/2/6.
//  Copyright © 2017年 tuhaisheng. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"a");

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"c");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    BViewController * b = [[BViewController alloc] init];
    
    UINavigationController * rootView = [[UINavigationController alloc] initWithRootViewController:b];
    [self presentViewController:rootView animated:YES completion:nil];
}


- (void)testProject{
    static const NSInteger version = 420;
    

    
#define Version [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]
    
    
#pragma mark SSL 证书
    
#define ISDEBUG 1
#define IS8089 0
#define gkey @"680e928ca80446a6de56229464b19fca"
#if ISDEBUG
#define certificateSSL @"service.ecrazier.com"
#define DNSHost @"service.ecrazier.com"
    //本地
    //#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"http://192.168.30.228:8080/wakeyoga_service/REST?%@&v=%ld", relativeUrl,version]
#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"https://service.ecrazier.com/REST?%@&v=%ld", relativeUrl,version]
#define GeneralH5URL(H5URL) [NSString stringWithFormat:@"http://h5.ecrazier.com/%@&v=%ld",H5URL,version]
#define GeneralInAppH5URL(H5URL) [NSString stringWithFormat:@"http://h5.ecrazier.com/%@&v=%ld&pt=i",H5URL,version]
    //H5链接没有参数
#define GeneralInAppH5URLNoParameter(H5URL) [NSString stringWithFormat:@"http://h5.ecrazier.com/%@v=%ld&pt=i",H5URL,version]
    
#define hxUrl_GetHost @"http://httpdnsv3.ffdns.net/httpdns?dn=service.ecrazier.com"
    static const NSInteger imAliAccount = 23341684;  //开发环境
    static NSString * imCustomerAccount = @"14847068799be0641802205b98539ec602e96ef220";
#else
#define certificateSSL @"service.wakeyoga.com"
#define DNSHost @"service.wakeyoga.com"
#warning 线上
#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"https://service.wakeyoga.com/REST?%@&v=%ld", relativeUrl,version]
    
    //#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"http://101.200.177.237:8089/REST?%@&v=%ld", relativeUrl,version]
    
#define GeneralH5URL(H5URL) [NSString stringWithFormat:@"http://h5.wakeyoga.com/%@&v=%ld",H5URL,version]
#define GeneralInAppH5URL(H5URL) [NSString stringWithFormat:@"http://h5.wakeyoga.com/%@&v=%ld&pt=i",H5URL,version]
    //H5链接没有参数
#define GeneralInAppH5URLNoParameter(H5URL) [NSString stringWithFormat:@"http://h5.wakeyoga.com/%@v=%ld&pt=i",H5URL,version]
    
    
    
#define hxUrl_GetHost @"http://httpdnsv3.ffdns.net/httpdns?dn=service.wakeyoga.com"
    static const NSInteger imAliAccount = 23331294; //生产环境
    static NSString * imCustomerAccount = @"14423328005ba0e1e85025d09b21256adaca971f50";
#endif
    
    /**
     *  是否开启https SSL 验证
     *
     *  @return YES为开启，NO为关闭
     */
#define openHttpsSSL YES
    
    
    /**
     *  扫码登录
     */
    
#define hxUrl_Qr_Login   GeneralUrl(@"m=wakeyoga.app.user.login.qrcode.get")
    
    /**
     *  获取最新版本号
     */
    
#define hxUrl_Version   GeneralUrl(@"m=wakeyoga.app.version.info.get")
    
    
    /**
     *  注册之前的发送验证码
     */
#define hxUrl_BeforeRegSendVerifCode   GeneralUrl(@"m=wakeyoga.app.register.smscode.send")
    
    /**
     *  忘记密码发送注册码
     */
#define hxUrl_ForgotPassSendARegCode   GeneralUrl(@"m=wakeyoga.app.forgetpsd.smscode.send")
    
    /**
     *  忘记密码之校验验证码
     */
    //#define hxUrl_ForgotYourPassCheckTheVerifCode  GeneralUrl(@"m=wakeyoga.app.forgetpsd.smscode.check")
    
    
    /**
     * 登录密码忘记密码
     */
#define hxUrl_ForgotPassForLogin GeneralUrl(@"m=wakeyoga.app.forgetpsd.change")
    
    /**
     *  解绑手机注册码校验
     */
    
#define hxUrl_LicenseCheckUnbundlingPhone GeneralUrl(@"m=wakeyoga.app.unbindmobile.smscode.check")
    
    /**
     *  获取关注的用户动态列表(发现里面调用)
     */
#define hxUrl_PayAttentionToTheist GeneralUrl(@"m=wakeyoga.app.user.attentions.publishes.get")
    
    /**
     *  获取最新动态列表(发现里面调用)
     */
#define hxUrl_NewestGeneralUrl GeneralUrl(@"m=wakeyoga.app.publish.newest.get")
    
    
#define hxUrl_AttentionUserList GeneralUrl(@"m=wakeyoga.app.user.attentions.get")
    
    /**
     *  解绑手机注册码发送
     */
#define hxUrl_UnbundPhoneRegCode GeneralUrl(@"m=wakeyoga.app.unbindmobile.smscode.send")
    /**
     *  绑定手机注册码
     */
#define hxUrl_BindMPRegistCode
    
    /**
     *  注册
     */
#define hxUrl_Register GeneralUrl(@"m=wakeyoga.app.user.register")
    /**
     *  登录
     */
#define hxUrl_LogIn GeneralUrl(@"m=wakeyoga.app.user.login")
    /**
     *  第三方登录
     */
#define hxUrl_SignInWithThirdParty  GeneralUrl(@"m=wakeyoga.app.3rdpart.login")
    /**
     *  免登录
     */
#define hxUrl_FreeLogin GeneralUrl(@"m=wakeyoga.app.direct.login")
    
    /**
     *  获取生活视频列表
     */
#define hxUrl_GetliveVideo GeneralUrl(@"m=wakeyoga.app.lifemodel.vedios.get,wakeyoga.app.lifemodel.vedio.topics.get")
    /**
     *  获取生活视频详情
     */
    //#define hxUrl_GetliveVideoDetails GeneralUrl(@"wakeyoga.app.vediolife.detail.get")
    /**
     *  上传用户练习数据
     */
#define hxUrl_ExerciseIncreasesUserData GeneralUrl(@"m=wakeyoga.app.practiceddata.add")
    
    /**
     * 头像上传获取token
     */
#define hxUrl_GetTokenAvatarUpload GeneralUrl(@"m=wakeyoga.app.headicon.qiniutk.get")
    /**
     * 更新用户信息
     */
#define hxUrl_UpDateUserInfo GeneralUrl(@"m=wakeyoga.app.user.info.update")
    /**
     *  动态图片上传动态获取token
     */
#define hxUrl_DynamicImageUploadObtainToken GeneralUrl(@"m=wakeyoga.app.publishpic.qiniutk.get")
    
    /**
     *  用户添加B类课程
     */
#define hxUrl_UsersAddClassBCourses GeneralUrl(@"m=wakeyoga.app.user.lesson.add")
    
    /**
     *  用户删除B类课程
     */
#define hxUrl_UserDeletesBCourses GeneralUrl(@"m=wakeyoga.app.user.lesson.del")
    
    /**
     *  获取所有课程
     */
#define hxUrl_LessonsAll GeneralUrl(@"m=wakeyoga.app.lessons.all.get")
    
    /**
     *  获取最新课程
     */
#define hxUrl_LessonsNewest GeneralUrl(@"m=wakeyoga.app.lessons.newest.get")
    
    /**
     *  获取初学者课程
     */
#define hxUrl_LessonsBeiginner GeneralUrl(@"m=wakeyoga.app.lessons.for.beiginner.get")
    
    /**
     *  获取课程A列表
     */
#define hxUrl_GetAListOfCourses GeneralUrl(@"m=wakeyoga.app.lessons.a.get")
    
    /**
     *  服务器端验证购买凭证的有效性
     */
#define hxUrl_LessionPay GeneralUrl(@"m=wakeyoga.app.order.lesson.ios.paid")
    
    /**
     *  获取课程总目录
     */
#define hxUrl_GetTotalDirectory GeneralUrl(@"m=wakeyoga.app.lesson.categories.get,wakeyoga.app.lesson.carousel.list.get")
    
    //体式库
#define hxUrl_GetTotalAsanas GeneralUrl(@"m=wakeyoga.app.asanas.list.get")
    
    /**
     *  获取用户动态详情
     */
#define hxUrl_GetDynamicDetails GeneralUrl(@"m=wakeyoga.app.publish.detail.get")
    /**
     *  获取用户动态列表
     */
#define hxUrl_GetDynamicList GeneralUrl(@"m=wakeyoga.app.user.publishes.get")
    /**
     *  删除用户动态的评论
     */
#define hxUrl_deleteUserPhoto GeneralUrl(@"m=wakeyoga.app.publish.comment.del")
    
    
    /**
     *  获取B类课程详情（含c类动作列表）
     */
#define hxUrl_GetCourseDetailsClassBIncludingClassC GeneralUrl(@"m=wakeyoga.app.lesson.detail.get")
    
    /**
     *  获取课程基本信息（IAP 购买后刷支付状态使用）
     */
#define hxUrl_GetLessonPaid GeneralUrl(@"m=wakeyoga.app.user.lesson.paid.get")
    
    /**
     *  视频打开分享
     */
#define videoPunchShare GeneralH5URL(@"h5/lessonPunchClockShare.do?uid=%@&lssbi=%@&publi=%@")
    
    
    /**
     *  名师课程分享
     */
    
#define hxUrl_teacherShare GeneralH5URL(@"h5/lessonCategoryThreeShare.do?lssi=%@")
    
    /**
     *  名师课程的打卡
     */
#define teacherPunch GeneralH5URL(@"h5/lessonCategoryOnePunchClockShare.do?uid=%@&lssi=%@&publi=%@")
    
    /**
     *  冥想课程分享
     */
#define hxUrl_meditationShare GeneralH5URL(@"h5/lessonCategoryTwoShare.do?lssi=%@")
    
    /**
     *  冥想课程打卡
     */
#define meditationPunch GeneralH5URL(@"h5/lessonCategoryTwoPunchClockShare.do?uid=%@&lssi=%@&publi=%@")
    
    
    /**
     *  用户详情(首页)
     */
#define hxUrl_UserDetailsHome GeneralUrl(@"m=wakeyoga.app.userdetail.part.get")
    
    /**
     *  历史习练数据
     */
#define hxUrl_PracticeHistory GeneralUrl(@"m=wakeyoga.app.user.practice.history.get")
    
    /**
     *  历史习练数据分享成功上传
     */
#define hxUrl_PracticeHistoryShare GeneralUrl(@"m=wakeyoga.app.user.practice.history.share")
    
    /**
     * 添加频道
     */
#define hxUrl_AddChannel GeneralUrl(@"m=wakeyoga.app.publish.topics.get")
    
    /**
     *  用户详情(我的)
     */
#define hxUrl_UserDetailsMy GeneralUrl(@"m=wakeyoga.app.userdetail.all.get")
    
    /**
     *  用户详情(我的，他人主页)
     */
#define hxUrl_UserHomepage GeneralUrl(@"m=wakeyoga.app.user.homepage.get")
    
    /**
     *  我的活动(我的)
     */
#define hxUrl_MyActivity GeneralUrl(@"m=wakeyoga.app.user.activity.offline.details.get")
    
    /**
     * 添加用户动态的评论
     */
#define hxUrl_AddingDynamicUserReviews GeneralUrl(@"m=wakeyoga.app.publish.comment.add")
    
    /**
     * 课程评论
     */
#define hxUrl_AddLessonComment GeneralUrl(@"m=wakeyoga.app.lesson.comment.add")
    
    
    /**
     *  用户添加关注
     */
#define hxUrl_UserAttention GeneralUrl(@"m=wakeyoga.app.user.attention.add")
    
    /**
     *  用户取消关注
     */
#define hxUrl_UserCancelled GeneralUrl(@"m=wakeyoga.app.user.attention.cancel")
    
    
    /**
     *  用户举报
     */
#define hxUrl_UsersToReport GeneralUrl(@"m=wakeyoga.app.publish.report")
    
    
    
    /**
     *  发送验证码到绑定手机
     */
    
#define hxUrl_SendTheVerifCodeToBiMobPhones GeneralUrl(@"m=wakeyoga.app.bindmobile.smscode.send")
    
    /**
     *  修改手机
     */
#define hxUrl_BindingAnewPhone GeneralUrl(@"m=wakeyoga.app.mobile.change")
    
    /**
     * 第三方登录绑定手机
     */
#define hxUrl_ThirdBindMP GeneralUrl(@"m=wakeyoga.app.3rdpart.bind.mobile")
    
    /**
     *  修改密码
     */
#define hxUrl_ChangeThePassword GeneralUrl(@"m=wakeyoga.app.password.change")
    
    /**
     *  查询用户
     */
#define hxUrl_CheckUser GeneralUrl(@"m=wakeyoga.app.users.search")
    
    /**
     *  查询关注用户
     */
#define hxUrl_AttentionsUser GeneralUrl(@"m=wakeyoga.app.user.attentions.search")
    
    
    /**
     *  访问别人的主页  他人用户详情
     */
    
    //#define hxUrl_AccessOtherPeople GeneralUrl(@"m=wakeyoga.app.userdetail.all.get")
    
    /**
     *  用户发布动态
     */
#define hxUrl_UsersDynamically GeneralUrl(@"m=wakeyoga.app.user.publish.add")
    
    /**
     *生活首页
     *wakeyoga.app.lifemodel.home.get
     */
#define hxUrl_lifeHome GeneralUrl(@"m=wakeyoga.app.lifemodel.home.get")
    /**
     *生活简言标签页
     */
#define hxUrl_GetLifeArticles GeneralUrl(@"m=wakeyoga.app.lifemodel.articles.get,wakeyoga.app.lifemodel.article.topics.get")
    /**
     *生活简言详情页H5页面
     *wakeyoga.app.lifemodel.detail.get
     */
#define hxUrl_lifeSimpleDetail GeneralUrl(@"m=wakeyoga.app.lifemodel.detail.get")
    
    /**
     *生活简言详情页H5页面推荐
     *wakeyoga.app.lifemodel.detail.get
     */
#define hxUrl_lifeSimpleDetail_TXT GeneralUrl(@"m=wakeyoga.app.lifemodel.detail.ext.get")
    
    
    /**
     *  生活阅读详情页
     */
    //h5/readDetail.do
#define hxUrl_LifeReadPageForDetails GeneralInAppH5URL(@"h5/readDetailNew.do?lifi=%ld&uid=%ld")
    
    /**
     *  阅读分享
     */
#define hxUrl_ReadingToShare GeneralH5URL(@"h5/readShare.do?lifi=%ld")
    
    
    /**
     *  视频分享
     */
#define hxUrl_VideoSharing  GeneralH5URL(@"h5/videoShare.do?lifi=%ld")
    
    
    /**
     *  生活评论举报
     */
#define hxUrl_lifeVideo GeneralUrl(@"m=wakeyoga.app.lifemodel.comment.report")
    
    /**
     *  课程评论举报
     */
#define hxUrl_LessonReport GeneralUrl(@"m=wakeyoga.app.lesson.comment.report")
    
    /**
     *  课程评论删除
     */
#define hxUrl_LessonDel GeneralUrl(@"m=wakeyoga.app.lesson.comment.del")
    
    /**
     *  活动举报
     */
#define hxUrl_activityreport GeneralUrl(@"m=wakeyoga.app.activity.comment.report")
    
    
    //活动删除的
#define hxUrl_activityDelete GeneralUrl(@"m=wakeyoga.app.activity.comment.del")
    
    //获取订单状态
#define hxUrl_orderSstatus GeneralUrl(@"m=wakeyoga.app.vip.order.status.get")
    
    
    /**
     *举报评论动态
     */
    
#define hxUrl_dynamicComment GeneralUrl(@"m=wakeyoga.app.publish.comment.report")
    
    
    
    /**
     *  生活删除
     */
#define hxUrl_lifeVideoDelete GeneralUrl(@"m=wakeyoga.app.lifemodel.comment.del")
    
    /**
     *  获取用户上传动态PIC的token（没有）
     */
    
#define hxUrl_GetTheUploadDynamic GeneralUrl(@"m=wakeyoga.app.publishpic.qiniutk.get")
    
    
    /**
     * 获取用户上传背景token
     */
#define hxUrl_GetTheUploadBackGround GeneralUrl(@"m=wakeyoga.app.user.background.qiniutk.get")
    
    
    /**
     *  用户提交建议
     */
#define hxUrl_UserSubmitsSuggestion GeneralUrl(@"m=wakeyoga.app.user.suggest.add")
    
    
    
    /**
     * 生活文章或视频评论列表
     *生活：wakeyoga.app.lifemodel.comments.get
     */
#define hxUrl_lifCommentsList GeneralUrl(@"m=wakeyoga.app.lifemodel.comments.get")
    
    
    /**
     * 用户增加生活文章或视频评论
     */
#define hxUrl_UsersIncrLifeArticOrVideoComments GeneralUrl(@"m=wakeyoga.app.lifemodel.comment.add")
    
    /**
     * 活动评论
     */
#define hxUrl_UsersIncrActComments GeneralUrl(@"m=wakeyoga.app.activity.comment.add")
    
    
    
    /**
     * 获取粉丝列表
     */
#define hxUrl_GetForfans GeneralUrl(@"m=wakeyoga.app.user.fans.get")
    
    
    /**
     *  获取用户上传头像
     */
#define hxUrl_GetuploadAvatar GeneralUrl(@"m=wakeyoga.app.headicon.qiniutk.get")
    
    /**
     * 用户收藏文章获文章
     */
#define hxUrl_CollectArticleAndVideo GeneralUrl(@"m=wakeyoga.app.user.lifemodel.collection.add")
    
    /**
     *用户取消收藏生活文章或视频
     */
    
#define hxUrl_CancelArticleAndVideo GeneralUrl(@"m=wakeyoga.app.user.lifemodel.collection.cancel")
    
    /**
     *  用户协议
     */
#define hxUrl_UserAgreement GeneralInAppH5URLNoParameter(@"h5/userAgr.do?")
    /**
     * 用户动态点赞
     */
#define hxUrl_UserDynamicThumbUp GeneralUrl(@"m=wakeyoga.app.publish.favour.add")
    
    /**
     * 用户动态点赞取消
     */
#define hxUrl_UserDynamicThumbUpCancel GeneralUrl(@"m=wakeyoga.app.publish.favour.cancel")
    
    /**
     * 发现分享
     */
#define hxUrl_foundToshare GeneralH5URL(@"h5/findShare.do?pulsi=%ld")
    //http://192.168.1.18:8080/wakeyoga_h5_3rd/h5/activityShare.do?aci=1
    //活动详情分享
#define hxUrl_activityShare GeneralH5URL(@"h5/activityShare.do?aci=%ld")
    
    
    /**
     * 文章收藏
     */
#define hxUrl_GetArticleCollects GeneralUrl(@"m=wakeyoga.app.user.lifemodel.article.collections.get")
    /**
     * 视频收藏
     */
#define hxUrl_VideoCollection GeneralUrl(@"m=wakeyoga.app.user.lifemodel.vedio.collections.get")
    
    
    /**
     *课程详情页的分享
     */
#define hxUrl_CourseDetailsPage GeneralH5URL(@"h5/lessonShare.do?lssbi=%ld")
    
    /**
     *h5教练详情活动详情
     */
#define hxUrl_CoachH5 GeneralInAppH5URL(@"h5/coachDetail.do?coach_id=%@&uid=%@")
    
    
    /**
     *h5教练详情活动详情分享
     */
#define hxUrl_CoachShare GeneralH5URL(@"h5/coachShare.do?coach_id=%ld")
    
    /**
     * 晒活动
     */
#define hxUrl_SunActivity GeneralH5URL(@"h5/offLineActivityShare.do?aci=%ld")
    
    /**
     *  我的活动详情页(线下活动详情页)
     */
#define hxUrl_MyActivityDetail GeneralH5URL(@"h5/offLineActivityDetail.do?aci=%ld")
    
    /**
     *话题的分享
     */
#define hxUrl_Topic GeneralH5URL(@"h5/publishTopicShare.do?publish_topic=%@")
    
    /**
     * 删除用户动态
     */
#define hxUrl_DeleteCourseDeleteUserDynamic GeneralUrl(@"m=wakeyoga.app.user.publish.del")
    
    /**
     * 举报用户动态
     */
#define hxUrl_ReportUserDynamic GeneralUrl(@"m=wakeyoga.app.publish.report")
    
    
    /**
     * 推荐更多教练
     */
#define hxUrl_MoreCoaches GeneralUrl(@"m=wakeyoga.app.recommended.coaches.get")
    
    /**
     * 消息评论
     */
#define hxUrl_MessageComment GeneralUrl(@"m=wakeyoga.app.user.messages.comment.get")
    
    /**
     * 消息粉丝
     */
#define hxUrl_MessageAttention GeneralUrl(@"m=wakeyoga.app.user.messages.attention.get")
    
    /**
     * 消息点赞
     */
#define hxUrl_MessageFavour GeneralUrl(@"m=wakeyoga.app.user.messages.favour.get")
    
    
#define hxUrl_MessageHasNew GeneralUrl(@"m=wakeyoga.app.user.messages.hasnew.get")
    
    
    //发现＊推荐页面 首页:wakeyoga.app.publish.topic.home.get  详情页：wakeyoga.app.publish.topic.detail.get
#define hxUrl_Rec_home GeneralUrl(@"m=wakeyoga.app.publish.topics.home.get")
#define hxUrl_Rec_detail GeneralUrl(@"m=wakeyoga.app.publish.topic.detail.get")
#define hxUrl_Rec_newest GeneralUrl(@"m=wakeyoga.app.publish.topic.newest.get")
    //发现推荐页轮播图跳转的活动详情入口：
    //http://192.168.1.18:8080/wakeyoga_h5_3rd/h5/activityDetail.do?aci=1&uid=1
    //http://h5.ecrazier.com/h5/activityDetail.do?aci=1&uid=1
#define hxUrl_FindActDet GeneralH5URL(@"h5/activityDetail.do?aci=%ld&uid=%ld&coach_v_status=%ld")
    
    /**
     * H5活动网页
     */
#define hxUrl_FindContentDetail GeneralInAppH5URL(@"h5/activityContentDetail.do?aci=%ld")
    
    /**
     * H5活动评论
     */
#define hxUrl_ActivityComments GeneralUrl(@"m=wakeyoga.app.activity.comments.get")
    
    
    /**
     * 活动列表
     */
#define hxUrl_Activity GeneralUrl(@"m=wakeyoga.app.activity.offline.list.get")
    
    /**
     * 活动详情
     */
#define hxUrl_Activity_info GeneralUrl(@"m=wakeyoga.app.activity.offline.info.get")
    
    /**
     *  活动详情H5
     */
    //h5/readDetail.do
#define hxUrl_Activity_H5 GeneralInAppH5URL(@"h5/offLineActivityDetail.do?aci=%ld")
    
    
    /**
     * 我的活动列表
     */
#define hxUrl_UserActivity GeneralUrl(@"m=wakeyoga.app.user.activity.offline.details.get")
    
    /**
     * 删除活动
     */
#define hxUrl_DelActivity GeneralUrl(@"m=wakeyoga.app.user.activity.offline.detail.del")
    
    
    /**
     * 我要参加
     */
#define hxUrl_ActivityParticipate GeneralUrl(@"m=wakeyoga.app.user.activity.offline.participate")
    
    /**
     * 申请组织活动
     */
#define hxUrl_ActivityApply GeneralUrl(@"m=wakeyoga.app.user.activity.offline.apply")
    
    
    /**
     *  微信通过code 获取access_token
     */
    
#define hxUrl_GetAccess_token  (@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code")
    
    /**
     *  access_token 失效了，重新获得
     */
#define hxUrl_refreshGetAccess_token (@"https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@")
    
    /**
     *  点赞人列表
     */
#define hxUrl_getThumbUpListTable GeneralUrl(@"m=wakeyoga.app.publish.favours.get")
    
    /**
     *  系统推荐关注信息
     */
#define hxUrl_getfriends GeneralUrl(@"m=wakeyoga.app.recommended.users.get")
    
    /**
     *  批量关注
     */
#define hxUrl_attentions GeneralUrl(@"m=wakeyoga.app.user.attention.batch.add")
    
    
    /**
     *  获取通讯录 微博好友信息
     */
#define hxUrl_getfriends_Contact_Wb GeneralUrl(@"m=wakeyoga.app.user.friends.get")
    
    /**
     *  教练详情 参加阵营
     */
#define hxUrl_attendActivity GeneralUrl(@"m=wakeyoga.app.activity2.camp.join")
    
    
    /**
     *  用户教练认证图片上传
     */
#define hxUrl_GetuploadRenZheng GeneralUrl(@"m=wakeyoga.app.user.coach.checkdata.qiniutk.get")
    
    
#define hxUrl_FirstLoginAppdelegate GeneralUrl(@"m=wakeyoga.app.first.open")
    /**
     *  用户教练认
     */
#define hxUrl_RenZheng GeneralUrl(@"m=wakeyoga.app.user.coach.authentication.submit")
    
    
    /**
     * 更新设置
     */
#define hxUrl_UpdateSetting GeneralUrl(@"m=wakeyoga.app.user.imcnf.update")
    
    /**
     * 冥想获取mp3下载接口
     */
#define hxUrl_DownloadMeditationUrl GeneralUrl(@"m=wakeyoga.app.meditation.lesson.audio.get")
    
    /**
     * 名师课坊获取mp4下载接口
     */
#define hxUrl_DownloadComprehensiveUrl GeneralUrl(@"m=wakeyoga.app.comprehensive2.lesson.vedio.get")
    
    /**
     * 获取体式库下载地址
     */
#define hxUrl_DownloadAsanasurl GeneralUrl(@"m=wakeyoga.app.asanas.downloadurl.get")
    
    /**
     * 名师课坊在线地址
     */
#define hxUrl_Pm3u8 GeneralUrl(@"m=wakeyoga.app.comprehensive2.lesson.pm3u8.get")
    
    
    /**
     * 能量值提升
     */
#define hxUrl_EnhanceEnergyValue GeneralH5URL(@"h5/energyInfo.do?")
    
    /**
     *  分享获得的能量值
     */
#define hxUrl_GetShareEnergyValue GeneralUrl(@"m=wakeyoga.app.user.publish.punchclock.share")
    
    
    /**
     *  直播首页
     */
#define hxUrl_GetLiveHomeValue GeneralUrl(@"m=wakeyoga.app.live.home.get")
    
    /**
     *  直播回放
     */
#define hxUrl_GetLivePlayBacksValue GeneralUrl(@"m=wakeyoga.app.live.playbacks.get")
    
    
    
    /**
     *  直播详情页
     */
#define hxUrl_LiveDetail GeneralUrl(@"m=wakeyoga.app.live.detail.get")
    
#define hxUrl_LiveDetailShare GeneralH5URL(@"h5/liveShare.do?lvi=%@")
    
    
    //h5 开通VIP VipPurchase
#define OpenVIPPurchase GeneralInAppH5URL(@"h5/vipPayByMyself.do?uid=%@&appequipment=1")
    
    
    //购买前获取商品ID
    /*
     ubid 为谁购买，自己购买不需要传次参数
     odvimsli vip商品id
     odpaypath 支付类型
     
     odamt 订单金额
     */
#define hxUrl_purchaseGetGoodsID GeneralUrl(@"m=wakeyoga.app.vip.order.pay")
    
    
    //IAP 验证支付信息
#define hxUrl_IAPVerifyPaymentInformation GeneralUrl(@"m=wakeyoga.app.vip.order.iap.add")
    
    
    
    //使用兑换券(能量值奖励)
#define hxUrl_RewardCoupon GeneralUrl(@"m=wakeyoga.app.user.vip.history.get")
    
    //使用兑换券(使用兑换券)
#define hxUrl_UserCoupon GeneralUrl(@"m=wakeyoga.app.vip.coupon.activate")
    
    
    //查询能量值获取方式
#define hxUrl_checkEnergyWay GeneralInAppH5URL(@"h5/findEnergyValueWay.do?uid=%@&appequipment=1")
    
    //VIP购买协议
#define hxUrl_VIPPurchaseAgreement GeneralInAppH5URL(@"h5/findVipPayagreement.do?")
    
    
    //给好友购买VIP
#define hxUrl_PaymentToFriend GeneralInAppH5URL(@"h5/vipPayByMyfriend.do?friendid=%@&appequipment=1")
    
    //h5/VipPayresults.do?uid=1&orderid=1&packageid=1&paytype=1
    //支付结果
#define hxUrl_VipPaymentResults GeneralInAppH5URL(@"h5/VipPayresults.do?paytype=%ld&uid=%ld&orderid=%@")
    
    //关闭页面
#define hxUrl_CloseThePage GeneralH5URL(@"h5appclosepage")
    
    //支付记录
#define hxUrl_PaymentRecords GeneralH5URL(@"h5appfindpayrecord")
    
    /**
     *  获取houst 接口
     */
    //#define hxUrl_GetHost @"http://httpdnsv3.ffdns.net/httpdns?dn=service.ecrazier.com"
    
    /**
     * VIP记录
     */
    
#define hxUrl_VIPPurchaseRecords GeneralInAppH5URL(@"h5/vipPayhistory.do?uid=%@&appequipment=1")
    
    /**
     * 获取app的信息
     */
#define hxUrl_GetAppInfo GeneralUrl(@"m=wakeyoga.app.sys.bonusact.mapping.get")
    
    /**
     * 获取视频的话题
     */
#define hxUrl_GetVedioTopics GeneralUrl(@"m=wakeyoga.app.lifemodel.vedios.get")
    
    /**
     * 获取简言的话题
     */
#define hxUrl_GetArticle GeneralUrl(@"m=wakeyoga.app.lifemodel.articles.get")
    
#endif

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
