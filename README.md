# Readhub-iOS

## API

<!--ts-->
   * [域名](#域名)
   * [热门话题](#热门话题)
   * [热门话题详情](#热门话题详情)
   * [科技动态](#科技动态)
   * [开发者资讯](#开发者资讯)
   * [区块链快讯](#区块链快讯)
   * [即时查看](#即时查看)
   * [关键词](#关键词)
   * [通知](#通知)
<!--te-->


### 域名
`https://api.readhub.me`

`https://search.readhub.me`

### 热门话题

**实例**：`https://api.readhub.me/topic?pageSize=5&lastCursor= 1519712106000`

* **url**: /topic
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   |pageSize|Int|5|
   |lastCursor|String|1519712106000|时间戳（毫秒）|
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```


### 热门话题详情

**实例**：`https://api.readhub.me/topic/32dBj7MwfVG`

* **url**: /topic/topic_id
* **method**: GET
* **request**:

   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   |topic_id|String|32dBj7MwfVG|直接加载topic/后面|
   
* **response**:

### 科技动态

**实例**：`https://api.readhub.me/news?pageSize=5`

* **url**: /news
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   |pageSize|Int|5|
   |lastCursor|String|1519712106000|时间戳（毫秒）|
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```

### 开发者资讯

**实例**：`https://api.readhub.me/technews?pageSize=5`

* **url**: /technews
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   |pageSize|Int|5|
   |lastCursor|String|1519712106000|时间戳（毫秒）|
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```

### 区块链快讯

**实例**：`https://api.readhub.me/blockchain?pageSize=5`

* **url**: /blockchain
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   |pageSize|Int|5|
   |lastCursor|String|1519712106000|时间戳（毫秒）|
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```

### 即时查看(ForceTouch)

**实例**：`https://api.readhub.me/topic/instantview?topicId=RwOK8HoWNG`

* **url**: /topic/instantview
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   |topicId|String|RwOK8HoWNG|
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```

    
### 关键词

**实例**：`https://api.readhub.me/topic/related?entityId=42&eventType=10&order=25027&t=1517995244492`

* **url**: /topic/related
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   | entityId | String | 42 |
   | eventType | Int | 10 |
   | order | String | 25027 |
   | t | Sting | 1517995244492 |
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```
	
### 通知

**实例**：`https://api.readhub.me/topic/newCount?latestCursor=37215`

* **url**: /topic/newCount
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   | latestCursor | String | 37215 | 数量 |
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```
	
	
### 搜索（需要登录）
**实例**：`https://search.readhub.me/result?search=entity,264,company,工信部,工信部&filter=hot`

* **url**: /result
* **method**: GET
* **request**:
   
   |参数|类型|样例|备注|
   |:--:|:--:|:--:|:--:|
   | search | String | entity,264,company,工信部,工信部 |逗号分开|
   | filter | String | hot/event | 筛选（hot 热门话题，event 所有结果） |
   
* **response**:

	```
	{
   		太长了，自己去chrome看
	}
	```