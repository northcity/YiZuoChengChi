
#ifndef _NetInterface_h
#define _NetInterface_h

/*
 限免页面接口
 EXAMPLE:http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1&category_id=0
 传参 
 currency       货币传rmb就行
 page           页码
 category_id    分类
 */
#define kLimitUrl @"http://iappfree.candou.com:8080/free/applications/limited"
//不写category_id就是全部   0也表示全部

/*
 降价页面接口
 EXAMPLE:http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=1&category_id=0
 传参
 currency
 page
 category_id
 */
#define kReduceUrl @"http://iappfree.candou.com:8080/free/applications/sales"

/*
 免费页面接口
 EXAMPLE:http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=1&category_id=0
 传参
 currency
 page
 category_id
 */
#define kFreeUrl @"http://iappfree.candou.com:8080/free/applications/free"

/*
 专题界面接口
 EXAMPLE:
 传参
 page
 number
 */
#define kSubjectUrl @"http://1000phone.net:8088/app/iAppFree/api/topic.php"

/*
 热榜页面接口
 EXAMPLE:http://1000phone.net:8088/app/iAppFree/api/hot.php?page=1&number=10
 传参
 page
 number
 */
#define kHotUrl @"http://1000phone.net:8088/app/iAppFree/api/hot.php"

/*
 分类界面接口
 */
#define kCateUrl @"http://1000phone.net:8088/app/iAppFree/api/appcate.php"

/*
 详情页面接口
 EXAMPLE:http://iappfree.candou.com:8080/free/applications/688743207?currency=rmb
 传参
 AppID appID不带‘{}’
 currency 是货币
 */
#define kDetailUrl @"http://iappfree.candou.com:8080/free/applications/%@?currency=rmb"
//要传一个applicationid

/*
 周边使用应用接口:
 EXAMPLE:http://iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346
 参数longitude,latitude填写经度和纬度。
 longitude  经度
 latitude   纬度
 */
#define kNearAppUrl @"http://iappfree.candou.com:8080/free/applications/recommend?"

//内网搜索接口 有四个
/*
 限免搜索
 传参
 page   页码
 number 数量
 search 搜索文本
 */
#define SEARCH_LIMIT_URL @"http://www.1000phone.net:8088/app/iAppFree/api/limited.php?"
//免费搜索
#define SEARCH_FREE_URL @"http://www.1000phone.net:8088/app/iAppFree/api/free.php?page=%d&number=20&search=%@"
//降价搜索
#define SEARCH_REDUCE_URL @"http://www.1000phone.net:8088/app/iAppFree/api/reduce.php?page=%d&number=20&search=%@"
//热榜搜索
#define SEARCH_HOT_URL @"http://www.1000phone.net:8088/app/iAppFree/api/hot.php?page=%d&number=20&search=%@"

//蚕豆推荐应用接口
#define kCandouUrl @"http://open.candou.com/mobile/candou"

//配置界面-我的账户接口 第三行数据 限免多少 总价多少的接口
#define kMyUserUrl @"http://iappfree.candou.com:8080/free/categories/limited"


#endif
