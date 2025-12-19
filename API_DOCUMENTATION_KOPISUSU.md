# Kopisusu API 接口文档（完整版）

## 概述
本文档描述了 Kopisusu 应用的所有 RESTful API 接口，包含详细的请求参数说明。所有接口均返回 `ApiResponse<T>` 格式的响应。

---

## 目录
- [请求 Header 参数](#请求-header-参数)
- [签名机制](#签名机制)
- [基础接口](#基础接口)
- [游客用户接口](#游客用户接口)
- [正式用户接口](#正式用户接口)
- [贷款接口](#贷款接口)
- [存款接口](#存款接口)
- [积分接口](#积分接口)
- [账户注销接口](#账户注销接口)
- [其他接口](#其他接口)

---

## 请求 Header 参数

所有接口请求都需要携带以下公共 Header 参数：

### 公共 Header 参数

| 参数名 | 类型 | 必填 | 说明 | 示例值 |
|--------|------|------|------|--------|
| language | String | 是 | 语言标识 | `id` (印尼语) |
| version | String | 是 | 应用版本号 | 从 AppUtils.getVersion() 获取 |
| device-type | String | 是 | 设备类型 | `ANDROID` |
| api-version | String | 是 | API 版本号 | `2.1` |
| app-name | String | 是 | 应用名称 | 从 AppUtils.getAppName() 获取 |
| place | String | 是 | 渠道标识 | 从 AppUtils.getChannel() 获取 |
| credito | String | 是 | 信用标识 | `1` |
| User-Agent | String | 是 | 用户代理 | `Android/{VERSION_NAME}` |

### 游客接口专用 Header

游客接口需要额外携带：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| guest-token | String | 是 | 游客用户令牌 |

### 正式用户接口专用 Header

正式用户接口需要额外携带：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| token | String | 是 | 正式用户令牌 |

---

## 签名机制

### 通用签名算法

部分接口需要在请求参数中包含 `sign` 字段，用于验证请求的合法性。签名生成采用 **MD5 加密算法**，这是一个通用的签名机制。

### 签名生成步骤：

1. **参数收集**：
   - 收集所有需要签名的请求参数（不包括 sign 字段本身）

2. **参数拼接**：
   - 将参数按照 `key=value&key=value` 格式拼接
   - 参数可以是任意数量
   - 最后添加固定的 `&secret_key=8GWeRtjQs9xHR5Y4h162`
   - 完整格式：`param1=value1&param2=value2&...&paramN=valueN&secret_key=8GWeRtjQs9xHR5Y4h162`

3. **MD5 加密**：
   - 对拼接后的完整字符串进行 MD5 加密
   - 得到的 32 位小写字符串即为 sign 值

### 通用签名生成代码示例 (Kotlin):

```kotlin
/**
 * 通用签名生成方法
 * @param params 需要签名的参数 Map
 * @return MD5 签名字符串
 */
fun generateSign(params: Map<String, String>): String {
    // 将参数按 key=value 格式拼接
    val paramsString = params.entries.joinToString("&") { "${it.key}=${it.value}" }
    // 添加固定的 secret_key
    val signString = "$paramsString&secret_key=8GWeRtjQs9xHR5Y4h162"
    // 进行 MD5 加密
    return MD5Encode.md5(signString)
}
```

### 使用示例：

```kotlin
// 示例 1: 游客登录签名
val params = mapOf(
    "phone" to "+6281234567890",
    "sim_phone" to "+6281234567890",
    "is_root" to "false",
    "phone_model" to "SM-G973F"
)
val sign = generateSign(params)

// 示例 2: 其他接口签名
val otherParams = mapOf(
    "param1" to "value1",
    "param2" to "value2",
    "param3" to "value3"
)
val otherSign = generateSign(otherParams)
```

### 重要说明：

| 项目 | 说明 |
|------|------|
| **secret_key** | 固定值：`8GWeRtjQs9xHR5Y4h162`，所有接口通用 |
| **参数数量** | 可根据不同接口需求动态传入任意数量的参数 |
| **参数值** | 必须使用实际传递给接口的值 |
| **加密算法** | MD5 加密，返回 32 位小写字符串 |
| **适用范围** | 所有需要签名验证的接口 |
| **特殊情况** | 

---

## 基础接口

### 1. 获取域名配置
**接口地址**: `GET /domain/urls.json`
**描述**: 获取应用的域名配置信息
**请求参数**: 无
**返回数据**: 

---

### 2. Ping 检测 (非必须)
**接口地址**: `GET /kopisusu_server/basic/ping`
**描述**: 检测服务器连接状态
**请求参数**: 无
**返回数据**: 

---

## 游客用户接口

### 3. 游客获取首页数据
**接口地址**: `POST /kopisusu_server/guestUser/get_home_data`
**描述**: 获取游客模式下的首页数据
**请求参数**: 无
**返回数据**: 

---

### 4. 游客登录
**接口地址**: `POST /kopisusu_server/guestUser/login`
**描述**: 游客用户登录
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| phone | String | 是 | 手机号（含国家代码） |
| adid | String | 否 | Adjust 广告 ID |
| sim_phone | String | 是 | SIM 卡手机号 |
| is_root | String | 是 | 设备是否 Root (true/false) |
| phone_model | String | 是 | 手机型号 |
| user_pseudo_id | String | 否 | firebase ID |
| source | String | 否 | UTM 来源 |
| medium | String | 否 | UTM 媒介 |
| campaign | String | 否 | UTM 活动 |
| sign | String | 是 | 签名（MD5加密，见下方说明） |

**Sign 签名生成方法**:

签名使用 MD5 加密算法，这是一个**通用的签名算法**，适用于所有需要签名的接口。

### 签名生成规则：

1. **参数拼接**：
   - 将所有需要签名的参数按照 `key=value&key=value` 格式拼接
   - 参数可以是任意数量的动态参数
   - 最后拼接固定的 `&secret_key=8GWeRtjQs9xHR5Y4h162`
   - 格式：`param1=value1&param2=value2&...&paramN=valueN&secret_key=8GWeRtjQs9xHR5Y4h162`

2. **MD5 加密**：
   - 对拼接后的完整字符串进行 MD5 加密
   - 得到的结果即为 sign 值

3. **游客登录签名示例代码** (Kotlin):
```kotlin
fun sign(phone: String, sim_phone: String, is_root: String, phone_model: String): String {
    val code = "phone=$phone&sim_phone=$sim_phone&is_root=$is_root&phoe_model=$phone_model&secret_key=8GWeRtjQs9xHR5Y4h162"
    return MD5Encode.md5(code)
}
```

4. **通用签名生成示例** (伪代码):
```kotlin
fun generateSign(params: Map<String, String>): String {
    // 将参数按 key=value 格式拼接
    val paramsString = params.entries.joinToString("&") { "${it.key}=${it.value}" }
    // 添加 secret_key
    val signString = "$paramsString&secret_key=8GWeRtjQs9xHR5Y4h162"
    // MD5 加密
    return MD5Encode.md5(signString)
}
```

5. **游客登录具体示例**:
```
输入参数:
  phone: +6281234567890
  sim_phone: +6281234567890
  is_root: false
  phone_model: SM-G973F

拼接字符串:
  phone=+6281234567890&sim_phone=+6281234567890&is_root=false&phoe_model=SM-G973F&secret_key=8GWeRtjQs9xHR5Y4h162

MD5加密后得到 sign 值
```

**重要说明**:
- **secret_key 固定值**: `8GWeRtjQs9xHR5Y4h162`
- **动态参数**: 可以根据不同接口的需求传入不同数量和类型的参数
- **参数顺序**: 游客登录接口中，`phoe_model` 为固定拼写（注意不是 `phone_model`）
- **参数值**: 所有参数值必须使用实际传递的值
- **适用范围**: 此签名算法是通用的，可用于所有需要签名验证的接口

**返回数据**: 

---

### 5. 获取游客详细信息
**接口地址**: `POST /kopisusu_server/guestUser/get_user_detail_info`
**描述**: 获取游客用户的详细信息
**请求参数**: 无
**返回数据**: 

---

### 6. 游客上传照片
**接口地址**: `POST /kopisusu_server/guestUser/upload_photo`
**描述**: 游客用户上传照片
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| photo_type | String | 是 | 照片类型 (`idcard_hand`: 手持身份证, `idcard_front`: 身份证正面) |
| photo_base64 | String | 是 | Base64 编码的照片数据 (格式: `data:image/{extension};base64,{data}`) |

**返回数据**: `UploadPic`

---

### 7. 更新游客详细信息
**接口地址**: `POST /kopisusu_server/guestUser/update_user_detail_info`
**描述**: 更新游客用户的详细信息
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id_no | String | 是 | 身份证号 |
| real_name | String | 是 | 真实姓名 |
| education_degree | String | 是 | 学历 |
| job_category | String | 是 | 职业类别 |
| family_province | String | 是 | 家庭地址省份 |
| family_city | String | 是 | 家庭地址城市 |
| family_detail_address | String | 是 | 家庭详细地址 |
| email | String | 是 | 电子邮箱 |

**返回数据**: `DefaultModel`

---

### 8. 游客认证
**接口地址**: `POST /kopisusu_server/guestUser/auth`
**描述**: 游客用户身份认证
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| valid_code | String | 是 | 验证码 |

**返回数据**: `GuestValid`

---

### 9. 游客风险评估
**接口地址**: `POST /kopisusu_server/guestUser/risk`
**描述**: 获取游客用户的风险评估信息
**请求参数**: 无
**返回数据**: 

---

### 10. 游客 OTP 验证
**接口地址**: `POST /kopisusu_server/guestUser/otp_check`
**描述**: 游客用户 OTP 验证检查
**请求参数**: 无
**返回数据**: 

---

## 正式用户接口

### 11. 获取地区列表
**接口地址**: `POST /kopisusu_server/user/get_region_list`
**描述**: 获取可选地区列表
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | String | 是 | 父级地区 ID (顶级为 "0") |

**返回数据**: 

---

### 12. 上传设备信息
**接口地址**: `POST /kopisusu_server/user/update_user_device_info`
**描述**: 更新用户设备信息
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| phone_brand | String | 是 | 手机品牌 |
| phone_model | String | 是 | 手机型号 |
| os | String | 是 | 操作系统版本 |
| cpu | String | 是 | CPU 名称 |
| cpu_num | String | 是 | CPU 核心数 |
| total_disk_size | String | 是 | 总存储空间 |
| available_disk_size | String | 是 | 可用存储空间 |
| total_ram_size | String | 是 | 总内存 |
| available_ram_size | String | 是 | 可用内存 |
| device_type | String | 是 | 设备类型 (固定值: "ANDROID") |
| imei | String | 是 | IMEI 号 |
| imsi | String | 是 | IMSI 号 |
| screen | String | 是 | 屏幕分辨率 |
| lang | String | 是 | 系统语言 |
| battery | String | 是 | 电池电量 |
| net_type | String | 是 | 网络类型 |
| app_version | String | 是 | 应用版本 |
| channel | String | 是 | 渠道标识 |

**返回数据**: 

---

### 13. 获取用户信息
**接口地址**: `POST /kopisusu_server/user/get_user_info`
**描述**: 获取正式用户的基本信息
**请求参数**: 无
**返回数据**: 

---

### 14. 图片上传
**接口地址**: `POST /kopisusu_server/user/pic_upload`
**描述**: 上传图片文件
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| picture_type | String | 是 | 图片类型 (1: 身份证正面, 2: 手持身份证, 3: 工作证明, 4: 收入证明) |
| picture | Object | 是 | 图片对象 |
| picture.content | String | 是 | Base64 编码的图片数据 (格式: `data:image/jpg;base64,{data}`) |
| picture.extension | String | 是 | 图片扩展名 (jpg/png/jpeg) |

**返回数据**: 

---

### 15. 获取还款银行列表
**接口地址**: `POST /kopisusu_server/loan/get_repay_bank_list`
**描述**: 获取可用的还款银行列表
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| type | Int | 是 | 类型标识 |

**返回数据**: 

---

### 16. 获取 VIP 信息
**接口地址**: `POST /kopisusu_server/user/get_vip_info`
**描述**: 获取用户的 VIP 会员信息
**请求参数**: 无
**返回数据**: 

---

### 17. 密码登录
**接口地址**: `POST /kopisusu_server/user/pwd_login`
**描述**: 使用密码进行用户登录
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| phone | String | 是 | 手机号（含国家代码） |
| adid | String | 否 | Adjust 广告 ID |
| user_pseudo_id | String | 否 | firebase ID |
| pwd | String | 是 | 密码 |

**返回数据**: 

---

### 18. 获取验证码
**接口地址**: `POST /kopisusu_server/user/get_validate_code`
**描述**: 获取登录或验证所需的验证码
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| phone | String | 是 | 手机号（含国家代码） |
| place | String | 是 | 渠道标识 |

**返回数据**: 

---

### 19. 用户登录
**接口地址**: `POST /kopisusu_server/user/login`
**描述**: 用户登录接口
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| phone | String | 是 | 手机号（含国家代码） |
| valid_code | String | 是 | 验证码 |
| place | String | 是 | 渠道标识 |
| clientId | String | 否 | firebaseID（使用 user_pseudo_id） |
| adid | String | 否 | Adjust 广告 ID |

**返回数据**: 

---

### 20. 设置用户密码
**接口地址**: `POST /kopisusu_server/user/set_user_pwd`
**描述**: 设置或修改用户密码
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| pwd | String | 是 | 密码 |

**返回数据**: 

---

### 21. 获取用户详细信息
**接口地址**: `POST /kopisusu_server/tloan/get_user_detail_info`
**描述**: 获取用户的详细信息
**请求参数**: 无
**返回数据**: 

---

### 22. 更新用户详细信息
**接口地址**: `POST /kopisusu_server/tloan/update_user_detail_info`
**描述**: 更新用户的详细信息
**请求参数**: 动态参数（根据业务需求传入用户信息字段）

**返回数据**: 

---

### 23. 异步获取到Adjust adid时候上传
**接口地址**: `POST /kopisusu_server/user/update_adid`
**描述**: 更新adid
**请求参数**: 根据业务需求传入

**返回数据**: 

---

### 24. 放款失败，更新银行账户
**接口地址**: `POST /kopisusu_server/user/upload_bank_account`
**描述**: 更新用户的银行账户信息
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| order_no | String | 是 | 订单号 |
| bank_id | String | 是 | 银行 ID |
| account_no | String | 是 | 银行账号 |

**返回数据**: 

---

### 25. 上传已安装应用列表
**接口地址**: `POST /kopisusu_server/user/upload_install_app_list`
**描述**: 上传AppList
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| app_list | Array | 是 | 应用列表 (AppInfo 对象数组) |

**返回数据**: 

---

### 26. 获取用户贷款信息
**接口地址**: `POST /kopisusu_server/user/get_user_loan_info`
**描述**: 获取用户的贷款信息
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| record_status | Int | 是 | 记录状态 (1: 进行中, 2: 已完成) |

**返回数据**: 

---

### 27. 获取用户贷款计划
**接口地址**: `POST /kopisusu_server/user/get_user_loan_plan`
**描述**: 获取用户的贷款还款计划
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| order_no | String | 是 | 订单号 |

**返回数据**: 

---

### 28. 检查上传信息
**接口地址**: `POST /kopisusu_server/user/check_upload_info`
**描述**: 检查用户上传的信息状态
**请求参数**: 无
**返回数据**: 

---

### 29. 客户端FireBase ClientId异步获取到时候上传
**接口地址**: `POST /kopisusu_server/user/fire_client`
**描述**: 上传firebase id
**请求参数**: 根据业务需求传入

**返回数据**: 

---

## 贷款接口

### 30. 获取贷款列表
**接口地址**: `POST /kopisusu_server/loan/loan_lists`
**描述**: 获取可用的贷款产品列表
**请求参数**: 无
**返回数据**: 

---

### 31. 获取贷款选项
**接口地址**: `POST /kopisusu_server/loan/get_loan_options`
**描述**: 获取贷款的可选配置项
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| group_name | String | 否 | 分组名称 |

**返回数据**: 

---

### 32. 获取申请页面数据
**接口地址**: `POST /kopisusu_server/loan/get_apply_page_data`
**描述**: 获取贷款申请页面所需的数据
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| loan_option_id | String | 是 | 贷款选项 ID |
| apply_amount | String | 是 | 申请金额 |

**返回数据**: 

---

### 33. 签署贷款协议
**接口地址**: `POST /kopisusu_server/loan/sign`
**描述**: 签署贷款合同或协议
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| img | String | 是 | 签名图片 Base64 |
| type | String | 是 | 签名类型 |
| extension | String | 是 | 图片扩展名 (固定值: "png") |

**返回数据**: 

---

### 34. 申请贷款
**接口地址**: `POST /kopisusu_server/loan/apply_loan`
**描述**: 提交贷款申请
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| loan_option_id | String | 是 | 贷款选项 ID |
| apply_amount | String | 是 | 申请金额 |
| phone_brand | String | 是 | 手机品牌 |
| phone_model | String | 是 | 手机型号 |

**返回数据**: 

---

### 35. 获取分期还款虚拟账户
**接口地址**: `POST /kopisusu_server/loan/get_instalment_va`
**描述**: 获取分期还款VA
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| order_no | String | 是 | 订单号 |
| advance | Int | 是 | 预付期数 |
| term | Int | 是 | 分期期数 |
| repay_type | String | 是 | 还款类型 |
| repay_bank | String | 是 | 还款银行 |

**返回数据**: 

---

### 36. 获取展期还款虚拟账户
**接口地址**: `POST /kopisusu_server/loan/get_postpone_va`
**描述**: 获取展期VA
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| order_no | String | 是 | 订单号 |
| term | Int | 是 | 延期期数 |
| repay_type | String | 是 | 还款类型 |
| repay_bank | String | 是 | 还款银行 |

**返回数据**: 

---

### 37. 更新返回订单状态
**接口地址**: `POST /kopisusu_server/loan/update_goback_order_status`
**描述**: 回退提交图片后更新订单状态
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| order_no | String | 是 | 订单号 |

**返回数据**: 

---

## 存款接口

### 38. 获取存款列表
**接口地址**: `POST /kopisusu_server/deposit/get_deposits`
**描述**: 获取用户的存款产品列表
**请求参数**: 无
**返回数据**: 

---

### 39. 获取存款
**接口地址**: `POST /kopisusu_server/deposit/get_deposit_v2`
**描述**: 获取用户存款信息（V2版本）
**请求参数**: 无
**返回数据**: 

---

### 40. 获取申请存款
**接口地址**: `POST /kopisusu_server/deposit/get_apply_deposit`
**描述**: 获取存款申请页面数据
**请求参数**: 无
**返回数据**: 

---

### 41. 提交存款申请
**接口地址**: `POST /kopisusu_server/deposit/submit_deposit`
**描述**: 提交存款申请
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| amount | String | 是 | 存款金额 |
| term | String | 是 | 存款期限 |

**返回数据**: 

---

### 42. 获取存款详情
**接口地址**: `POST /kopisusu_server/deposit/get_deposit_detail`
**描述**: 获取存款的详细信息
**请求参数**: 无
**返回数据**: 

---

### 43. 提取存款
**接口地址**: `POST /kopisusu_server/deposit/withdraw_deposit`
**描述**: 提取存款
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| deposit_no | String | 是 | 存款单号 |
| bank_id | String | 是 | 银行 ID |
| account_no | String | 是 | 银行账号 |
| amount | String | 是 | 提取金额 |

**返回数据**: 

---

### 44. 获取存款选项
**接口地址**: `POST /kopisusu_server/deposit/get_deposit_options`
**描述**: 获取存款用途等选项
**请求参数**: 无
**返回数据**: 

---

### 45. 保存用户选项
**接口地址**: `POST /kopisusu_server/deposit/save_user_option`
**描述**: 保存用户的存款选项配置
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| deposit_id | String | 是 | 存款 ID |
| purpose | String | 是 | 存款目的 |
| frequency | String | 是 | 存款频率 |
| interest | String | 是 | 利息方式 |
| source | String | 是 | 资金来源 |
| term | String | 是 | 存款期限 |
| amount | String | 是 | 存款金额 |

**返回数据**: 

---

### 46. 获取存款虚拟账户
**接口地址**: `POST /kopisusu_server/deposit/get_deposit_va`
**描述**: 获取存款的VA
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| deposit_no | String | 是 | 存款单号 |
| repay_type | String | 是 | 还款类型 |
| repay_bank | String | 是 | 还款银行 |

**返回数据**: 

---

### 47. 获取提前支取详情
**接口地址**: `POST /kopisusu_server/deposit/get_early_detail`
**描述**: 获取提前支取存款的详细信息
**请求参数**: 根据业务需求传入

**返回数据**: 

---

### 48. 提交提前支取
**接口地址**: `POST /kopisusu_server/deposit/submit_early`
**描述**: 提交提前支取存款申请
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| deposit_no | String | 是 | 存款单号 |

**返回数据**: 

---

## 积分接口

### 49. 获取积分产品
**接口地址**: `POST /kopisusu_server/score/get_score_products`
**描述**: 获取可用积分兑换的产品列表
**请求参数**: 无
**返回数据**: 

---

### 50. 获取积分记录
**接口地址**: `POST /kopisusu_server/score/get_score_record`
**描述**: 获取积分收支和兑换流水记录
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| type | String | 是 | 记录类型 |

**返回数据**: 

---

### 51. 兑换积分
**接口地址**: `POST /kopisusu_server/score/exchange_score`
**描述**: 使用积分兑换产品
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| product_id | String | 是 | 产品 ID |

**返回数据**: `DefaultModel`

---

## 账户注销接口

### 52. 获取用户身份证号
**接口地址**: `POST /kopisusu_server/user/get_user_id_no`
**描述**: 获取用户的身份证号信息（用于注销验证）
**请求参数**: 无
**返回数据**: 

---

### 53. 注销账户查询
**接口地址**: `POST /kopisusu_server/user/cancel_account_inquiry`
**描述**: 查询账户是否可以注销
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| fuzzy_id_no | String | 是 | 身份后四位 |

**返回数据**: 

---

### 54. 确认注销账户
**接口地址**: `POST /kopisusu_server/user/cancel_account_confirm`
**描述**: 确认并执行账户注销
**请求参数**: 无
**返回数据**: 

---

## 其他接口

### 55. 获取评论
**接口地址**: `POST /kopisusu_server/user/get_comment`
**描述**: 获取评论信息
**请求参数**: 无
**返回数据**: 

---

### 56. 埋点上报
**接口地址**: `POST /kopisusu_server/basic/buried_point`
**描述**: 上报用户行为埋点数据（协程方式）
**请求参数**: 根据埋点事件传入相应数据
**返回数据**: `ResponseBody`
**注意**: 此接口使用 suspend 函数，返回 Retrofit 的 `Response<ResponseBody>`

---

### 57. 放弃借款理由
**接口地址**: `POST /kopisusu_server/retention/get_retention_pop`
**描述**: 放弃借款理由
**请求参数**: 无
**返回数据**:

---

### 58. 提交放弃理由
**接口地址**: `POST /kopisusu_server/retention/add_retention`
**描述**: 提交放弃理由
**请求参数**:

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| r_id | String | 是 | 上面借款的 ID |
| remark | String | 否 | 备注信息 |

**返回数据**: 

---

## 响应格式

所有接口（除埋点接口外）均返回以下格式：

```kotlin
ApiResponse<T> {
    code: Int          // 状态码
    message: String    // 响应消息
    data: T           // 响应数据
}
```

## 注意事项

1. 所有请求参数均为 JSON 格式，使用 `application/json` Content-Type
2. 大部分接口返回 `LiveData<ApiResponse<T>>`，便于在 Android 中使用 MVVM 架构
3. 埋点接口 `buried_point` 使用 Kotlin 协程的 `suspend` 函数
4. 接口中标注为可空类型 (`?`) 的返回值需要做空值判断
5. 手机号参数通常包含国家代码（如：+62）
6. Base64 图片数据格式为：`data:image/{extension};base64,{base64_data}`

---

**文档生成时间**: 2025-11-20
**API 版本**: v1.0
**文档版本**: v2.0 (包含详细请求参数)
