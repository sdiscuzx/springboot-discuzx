#### 登录成功后
* 更新在线时间 pre_common_onlinetime
```sql
UPDATE pre_common_onlinetime SET total=total+'10', thismonth=thismonth+'10', lastupdate='1570238938' WHERE `uid`='1'
```
* 更新用户状态 pre_common_member_status 
```sql
UPDATE  pre_common_member_status SET `lastip`='127.0.0.1' , `port`='55348' , `lastvisit`='1570238192' , `lastactivity`='1570238192' WHERE `uid`='1'
```
* 更新 pre_common_member_count 金钱
```sql
UPDATE pre_common_member_count SET `extcredits2`=`extcredits2`+'2' WHERE uid IN ('1')
```
* 更新 pre_common_member 总积分
```sql
UPDATE  pre_common_member SET `credits`='8' WHERE `uid`='1'
```

#### 登录时
* 查询 pre_common_usergroup
```sql
SELECT * FROM pre_common_usergroup WHERE `groupid`='1'
```