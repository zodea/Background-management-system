<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>活动列表</title>
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
  <script type="text/javascript" charset="utf-8" src="//unpkg.com/wangeditor/release/wangEditor.min.js"></script>
  <style>
    [v-cloak] {
      display: none;
    }

    * {
      padding: 0;
      margin: 0;
      font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
    }

    html,
    body {
      height: 100%;
      width: 100%;
    }

    ul,
    li,
    ol {
      list-style: none;
    }

    #app,
    .el-scrollbar {
      height: 100%;
      font-size: 12px;
    }

    .page {
      background: rgba(255, 255, 255, 1);
      box-shadow: 0 0 10px #ccc;
      min-width: 1610px;
      height: 100%;
      box-sizing: border-box;
    }
  </style>
  <!--列表页面STATE -->
  <style>
    .List {
      padding: 22px 20px;
      overflow: auto;
    }

    .List .header {
      display: flex;
      justify-content: space-between;
      padding-bottom: 20px;
    }

    .List .header .title {
      font-size: 16px;
      font-weight: bold;
      color: rgba(51, 51, 51, 1);
      line-height: 22px;
    }

    .el-link {
      padding: 0 5px;
    }

    .List .page_box {
      margin-top: 20px;
      text-align: right;
    }

    .dialod_address {
      width: 240px;
      border: 1px solid rgba(217, 217, 217, 1);
    }

    .dialod_addressTop {
      border-bottom: 1px solid rgba(217, 217, 217, 1);
      padding: 10px;
      width: 100%;
      box-sizing: border-box;
    }

    .dialod_addressItem {
      height: 300px;
      background: rgba(255, 255, 255, 1);
      border-radius: 4px;
      box-sizing: border-box;
      overflow: auto;
    }

    .dialod_addressItem .el-checkbox {
      display: block;
      padding: 5px 10px;
    }

    .stock_box {
      display: flex;
      border: 1px solid #eeeeee;
    }

    .stock_item {
      text-align: center;
    }

    .stock_item1 {
      width: 260px;
    }

    .stock_item2 {
      width: 150px;
    }

    .stock_item3 {
      width: 190px;
    }

    .stock_item4 {
      width: 400px;
    }

    .stock_title {
      height: 40px;
      line-height: 40px;
      background: rgba(238, 238, 238, 1);
      font-size: 12px;
    }

    .stock_text {
      height: 50px;
      line-height: 50px;
    }

    .stock_item3 .stock_title,
    .stock_item3 .stock_text,
    .stock_item4 .stock_title,
    .stock_item4 .stock_text {
      padding: 0 20px;
    }

    .stock_tips {
      margin-top: 10px;
      height: 17px;
      font-size: 12px;
      color: rgba(153, 153, 153, 1);
      line-height: 17px;
    }

    /* 处理input type = number的上下箭头 */
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
    }

    input[type="number"] {
      -moz-appearance: textfield;
    }
  </style>
  <!--列表页面END -->
  <style>
    /* 覆盖原本的padding样式 */
    .el-table .cell {
      padding: 0;
    }

    /* table单格多列 */
    .spec-content {
      display: flex;
      flex-direction: column;
    }

    .spec-content p {
      line-height: 40px;
    }

    .spec-content p+p {
      border-top: 1px solid #eee;
    }

    .group-input {
      width: 100px;
    }

    /* 拼团成功设置 */
    .middle-font {
      display: flex;
      align-items: center;
    }

    .middle-font .el-input {
      width: 80px;
      margin: 0 15px;
    }

    .middle-font .el-input__inner {
      height: 30px;
      line-height: 30px;
    }

    .model .page_main {
      height: calc(100% - 60px);
      padding: 20px;
      overflow: auto;
      box-sizing: border-box;
    }

    .model .module {
      margin-bottom: 20px;
    }

    .model .module .title {
      position: relative;
      font-size: 16px;
      font-weight: bold;
      color: rgba(51, 51, 51, 1);
      padding-left: 20px;
      margin-bottom: 10px;
      line-height: 22px;
    }

    .model .module .title_tips {
      font-size: 12px;
      font-weight: 500;
      line-height: 17px;
      color: rgba(255, 255, 255, 1);
      background: rgba(64, 158, 255, 1);
      border-radius: 2px;
      padding: 2px 10px;
      margin-left: 10px;
    }

    .model .module .title::before {
      position: absolute;
      content: '';
      display: inline-block;
      width: 3px;
      height: 18px;
      left: 0;
      top: 0;
      bottom: 0;
      margin: auto 0;
      background: #409EFF;
    }

    .model .module .activity_info {
      margin-top: 10px;
      padding: 26px 0 26px 20px;
      border-radius: 2px;
      border-top: 1px solid rgba(204, 204, 204, 1);
      box-sizing: border-box;
      display: flex;
    }

    .model .left {
      margin-right: 2%;
      min-width: 530px;
    }

    .model .left.product {
      margin-right: 2%;
      min-width: 734px;
    }

    .model .left.product .input_list {
      width: 80%;
    }

    /* .el-input__inner,
    .el-form-item__content,
    .el-form-item__label,
    .el-input__icon {
      height: 30px;
      line-height: 30px;
    } */

    .el-date-editor--datetimerange.el-input__inner {
      width: auto !important;
    }

    .el-date-editor .el-range-separator {
      line-height: 22px;
    }

    .model .text {
      display: flex;
    }

    .model .text .el-select {
      margin-right: 16px !important;
    }

    .model .GoodsImages_warp .el-form-item__content {
      display: flex;
    }

    .model .GoodsImages {
      position: relative;
      width: 80px;
      height: 80px;
      margin-right: 10px;
      margin-bottom: 10px;
    }

    .model .GoodsImages img {
      width: 100%;
      height: 100%;
      border-radius: 6px;
    }

    .model .GoodsImages i {
      position: absolute;
      top: -8px;
      right: -8px;
      width: 16px;
      height: 16px;
      color: #aaa;
      display: none;
      cursor: pointer
    }

    .model .GoodsImages:hover i {
      display: inline-block;
    }

    .model .GoodsImages .model .text .el-select,
    .model .text .el-select .el-input {
      width: 110px !important;
      margin: 0;
    }

    .model .text .el-input {
      width: 80px;
      margin: 0 8px;
    }

    .model .text .el-input__inner {
      text-align: center;
    }

    .model .footer {
      position: fixed;
      width: 100%;
      height: 60px;
      bottom: 0;
      left: 0;
      background: #FFF;
      border-top: 1px solid #CCC;
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 999;
    }

    .model .img_list .el-form-item__content {
      height: auto !important;
    }

    .model .el-upload--picture-card {
      width: 80px;
      height: 80px;
      line-height: 84px;
    }

    .model .tabel_list {
      display: flex;
      line-height: 30px;
      font-size: 12px;
      color: rgba(51, 51, 51, 1);
    }

    .model .tabel_list img {
      flex: 0 0 30px;
      width: 30px;
      height: 30px;
      border: 1px solid #CCC;
      box-sizing: border-box;
      margin-right: 6px;
    }

    .module .right.product {
      display: flex;
    }

    .module .right.product .product_tips {
      height: 30px;
      line-height: 30px;
      float: left;
      font-size: 14px;
      color: #606266;
      padding: 0 12px 0 0;
      box-sizing: border-box;
    }

    .module .right.product .product_tips::before {
      content: '*';
      color: #F56C6C;
      margin-right: 4px;
    }

    #wangEditor {
      width: 658px;
      position: relative;
      z-index: 1;
    }

    .w-e-toolbar {
      width: 658px;
      flex-wrap: wrap;
    }

    .w-e-text-container {
      height: 600px !important;
    }

    .input_2 .el-form-item__content {
      display: flex;
      align-items: center;
      flex-wrap: wrap;
      height: auto;
    }

    .el-input_100 {
      width: 100px;
      margin: 0 8px;
    }

    .el-input_120 {
      width: 120px;
    }

    .el-input_220 {
      width: 220px;
    }

    .tips {
      color: #999999;
    }

    .over_height .el-form-item__content {
      height: auto !important;
    }

    .el-input-number {
      line-height: 1 !important;
    }

    .el-input-number.is-controls-right .el-input-number__decrease,
    .el-input-number.is-controls-right .el-input-number__increase {
      line-height: 14px;
    }

    .region {
      padding: 15px;
      background: #F7F8FA;
    }

    .region .address_list {
      display: flex;
      width: 420px;
      background: #FFF;
      border: 1px solid #DCDFE6;
    }

    .region .address_list div {
      flex: 1;
      padding: 0 5px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      word-break: break-all;
    }

    .region .address_list span {
      width: 64px;
      cursor: pointer
    }

    .mt20 {
      margin-top: 20px;
    }

    .mr20 {
      margin-right: 20px;
    }

    .module_200 {
      width: 200px;
      margin-right: 100px;
    }

    .module_tips {
      font-size: 12px;
      color: #999999;
      margin-left: 10px;
    }

    .send_qty {
      width: 300px;
      margin-top: 10px;
      padding: 10px 15px;
      color: #333333;
      background: #F7F8FA;
    }

    /* 代理价 */
    .BrandLevel {
      max-width: 700px;
      overflow-x: auto;

    }

    .BrandLevel_head,
    .BrandLevel_body {
      border: 1px solid #F5F5F5;
      display: flex;
    }

    .BrandLevel_head span {
      background: #EBEEF1;
    }

    .BrandLevel_head span,
    .BrandLevel_body div {
      flex: 0 0 100px;
      width: 100px;
      display: flex;
      justify-content: center;
      align-items: center;
      border-right: 1px solid #F5F5F5;
    }

    .BrandLevel_body div .el-input {
      padding: 10px;
      box-sizing: border-box;
    }

    .BrandLevel_body div .el-input input {
      text-align: center;
    }

    /* 代理价 */
  </style>
</head>

<body>
  <div id="app" v-cloak>
    <!-- 列表START -->
    <div v-show="Page === 'List'" class="warp_class">
      <div class="List page">
        <div class="header">
          <div class="title">活动列表</div>
          <el-button plain size="small" @click="addActivity">+创建活动</el-button>
        </div>
        <div class="table">
          <!-- 表格start -->
          <el-table :data="listData" border stripe :header-cell-style="{background:'#F5F5F5',color:'#333333'}"
            style="width: 100%">
            <el-table-column v-for="(col, index) in listHead" :prop="col.prop" :key="index" :label="col.label"
              :width="col.width" align="center">
              <template slot-scope="scope">
                <div v-if="col.prop === 'Time'" class="link-groud">
                  <span>
                    {{scope.row.SaleCartStartTime}}
                    至 {{scope.row.SaleCartEndTime}}
                  </span>
                </div>
                <!-- 展示一格多列 -->
                <template v-for="(specifica, sp) in SepcificationItemsList" :key="sp">
                  <div v-if="col.prop === specifica">
                    <div class="spec-content">
                      <p v-for="(spec,s) in scope.row.SepcificationItems" :key="s">
                        <span>{{spec[specifica]}}</span>
                      </p>
                    </div>
                  </div>
                </template>
                <div v-if="col.prop === 'State'" class="link-groud">
                  <span v-if="scope.row.State === STATE_TYPE.START">启用</span>
                  <span v-if="scope.row.State === STATE_TYPE.END" style="color: red;">停用</span>
                </div>
                <div v-else-if="col.prop === 'action'" class="link-groud">
                  <el-link v-if="scope.row.State === STATE_TYPE.START" @click="UpdateState(scope.row)"
                    :underline="false" type="primary">停用</el-link>
                  <el-link v-if="scope.row.State === STATE_TYPE.END" @click="UpdateState(scope.row)" :underline="false"
                    type="primary">启用</el-link>
                  <el-link :underline="false" type="primary" @click="edit(scope.row,'edit')">编辑</el-link>
                  <el-link :underline="false" type="primary" @click="Delete(scope.row)">删除</el-link>
                </div>
                <div v-else>
                  {{ scope.row[col.prop] }}
                </div>
              </template>
            </el-table-column>
          </el-table>
          <!-- 表格end -->
          <!-- 分页start -->
          <div class="page_box">
            <el-pagination background @size-change="handleSizeChange" @current-change="handleCurrentChange"
              :current-page="page" :page-sizes="[10, 20, 50, 100]" :page-size="rows"
              layout="total, sizes, prev, pager, next, jumper" :total="RecordCount">
            </el-pagination>
          </div>
          <!-- 分页end -->
        </div>
      </div>
    </div>
    <!-- 列表END -->
    <!-- 实体 -->
    <div v-show="Page === 'Model'" class="warp_class">
      <div class="model page">
        <div class="page_main">
          <!-- 活动设置START -->
          <div class="module">
            <div class="title">活动设置</div>
            <div class="activity_info">
              <div class="left">
                <el-form :model="activitySet" label-position="right" label-width="100px" class="demo-ruleForm">
                  <el-form-item label="活动状态:" required>
                    <el-radio-group v-model="activitySet.State">
                      <el-radio :label="true">启用</el-radio>
                      <el-radio :label="false">停用</el-radio>
                    </el-radio-group>
                  </el-form-item>
                  <el-form-item label="活动名称:" required>
                    <el-input v-model="activitySet.Name"></el-input>
                  </el-form-item>
                  <el-form-item label="开卖时间段:" required>
                    <el-date-picker v-model="activitySet.SaleCartTime" value-format="yyyy-MM-dd HH:mm:ss"
                      type="datetimerange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="拼团规则:" required>
                    <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}" placeholder="在此输入拼团规则"
                      v-model="activitySet.Tips">
                    </el-input>
                  </el-form-item>
                </el-form>
              </div>
            </div>
          </div>
          <!-- 活动设置END -->
          <!-- 活动产品设置START -->
          <div class="module">
            <div class="title">活动产品设置</div>
            <div class="activity_info">
              <div class="product">
                <el-form :model="activityProductSet" label-position="right" label-width="110px" class="demo-ruleForm">
                  <el-form-item class="input_list" label="活动产品" required style="height: 100%;">
                    <!-- ***********活动产品*********** -->
                    <el-table :data="Products" border stripe :header-cell-style="{background:'#F5F5F5',color:'#333333'}"
                      style="width: 100%">
                      <template v-for="(col, index) in ProductHead" :key="index">
                        <template v-if="col.prop === 'Qty' && (pageType === 1 || pageType === 3)"></template>
                        <el-table-column v-else :prop="col.prop" :key="index" :label="col.label" :width="col.width"
                          align="center">
                          <template slot-scope="scope">
                            <div class="tabel_list" v-if="col.prop === 'ProductName'" class="link-groud">
                              <span
                                :style="scope.row.Err ? 'color: red;' :''">{{!scope.row.Err ?scope.row.ProductName : scope.row.Err}}</span>
                            </div>
                            <div v-else-if="col.prop === 'OriginalPrice' || col.prop === 'ActivityPrice'"
                              class="link-groud">
                              <div v-if="!scope.row.Err">
                                <el-input v-model="scope.row[col.prop]" type="Number" min="0" placeholder=""></el-input>
                              </div>
                            </div>
                            <div v-else-if="col.prop === 'Qty' " class="link-groud">
                              <div v-if="!scope.row.Err">
                                <el-input v-model="scope.row[col.prop]" type="Number" min="1" placeholder=""></el-input>
                              </div>
                            </div>
                            <div v-else-if="col.prop === 'action'" class="link-groud">
                              <el-link :underline="false" type="primary" @click="deleteProduct(scope.$index)">删除
                              </el-link>
                            </div>
                            <div v-else :style="scope.row.Err ? 'color: red;' :''">
                              {{ scope.row[col.prop] }}
                            </div>
                          </template>
                        </el-table-column>
                      </template>

                    </el-table>
                    <el-button size="medium" @click="addProduct">+添加产品</el-button>
                  </el-form-item>
                </el-form>
              </div>
            </div>
          </div>
          <!-- 活动产品设置END -->
          <!-- 拼团成功设置START -->
          <div class="module">
            <div class="title">拼团成功设置</div>
            <div class="activity_info middle-font">
              <el-form :model="activityProductSet" label-width="20px" class="demo-ruleForm">
                <el-form-item class="" label=" " required>
                  满
                  <el-input v-model="activityProductSet.fullMoney" class="suc-input"></el-input> 元，团长反
                  <el-input v-model="activityProductSet.returnMoney" class="suc-input"></el-input>元
                </el-form-item>
              </el-form>
            </div>
          </div>
          <!-- 拼团成功设置END -->
          <!-- 购买限制START -->
          <div class="module">
            <div class="title">
              购买限制
            </div>
            <div class="activity_info">
              <div class="left">
                <el-form :model="groupLimit" ref="limitForm" label-width="120px">
                  <el-form-item label="谁可以发起拼团" prop="initiate" required>
                    <el-checkbox-group v-model="groupLimit.initiate">
                      <el-checkbox label="会员" name="type"></el-checkbox>
                      <el-checkbox label="普通用户" name="type"></el-checkbox>
                      <el-checkbox label="代理" name="type"></el-checkbox>
                    </el-checkbox-group>
                  </el-form-item>
                  <el-form-item label="谁可以参团" prop="join" required>
                    <el-checkbox-group v-model="groupLimit.join">
                      <el-checkbox label="会员" name="type"></el-checkbox>
                      <el-checkbox label="普通用户" name="type"></el-checkbox>
                      <el-checkbox label="代理" name="type"></el-checkbox>
                    </el-checkbox-group>
                  </el-form-item>
                </el-form>
              </div>
            </div>
          </div>
          <!-- 购买限制END -->
        </div>
        <!-- 操作区start -->
        <div class="footer">
          <el-button @click="Page = 'List'">取消</el-button>
          <el-button type="primary" @click="keepActivity">{{ ID ? '修改' : '保存' }}</el-button>
        </div>
        <!-- 操作区end -->
      </div>
    </div>
    <!-- 添加产品 -->
    <el-dialog title="提示" :visible.sync="productVisible" width="30%">
      <div>
        <el-input type="textarea" :rows="6" placeholder="在此输入产品代码，例： &#XA 876543 &#XA 123456 &#XA 765432"
          v-model="textarea">
        </el-input>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="productVisible = false">取 消</el-button>
        <el-button type="primary" @click="searchProduct">确 定</el-button>
      </span>
    </el-dialog>
  </div>

  <script src="/d/js/jquery-3.3.1.min.js"></script>
  <script src="/d/js/vue.min.js"></script>
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
  <script src="/d/js/ele-common.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script>
    var requestCount = 0; // 请求计数
    var loading = null; // 是否加载
    axios.interceptors.request.use(
      function (response) {
        loading = vm.$loading({
          lock: true,
          text: "Loading",
          spinner: "el-icon-loading",
          background: 'rgba(0, 0, 0, 0.7)'
        });
        requestCount++;
        return response;
      },
      function (err) {
        return Promise.reject(err);
      }
    );
    axios.interceptors.response.use(
      function (response) {
        if (requestCount === 1) {
          loading.close();
        }
        requestCount--;
        return response;
      },
      function (err) {
        if (requestCount === 1) {
          loading.close();
        }
        requestCount--;
        return Promise.reject(err);
      }
    );
    var api = ""; // 开发添加代理，发布需删除
    var NVMicroService = {
      List: api + '/sr/W_ProductActivity.ashx?Oper=List', // 获取列表
      UpdateState: api + '/sr/W_ProductActivity.ashx?Oper=UpdateState', // 修改活动状态
      Delete: api + '/sr/W_ProductActivity.ashx?Oper=Delete', // 删除活动
      ActivityStockGet: api + '/sr/W_ProductActivity.ashx?Oper=ActivityStockGet', // 获取库存
      Model: api + '/sr/W_ProductActivity.ashx?Oper=Model', // 获取实体
      GetByCode: api + '/sr/Product.ashx?Oper=GetByCode', // 拉产品信息
    }; // 接口地址
    var STATE_TYPE = {
      START: true, // 启用
      END: false // 停用
    };
    var vm = new Vue({
      el: "#app",
      data: {
        Page: "List", // 页面显示 List / Model
        pageType: 3, // 当前活动类型
        /****************** List START ******************/
        STATE_TYPE: STATE_TYPE, // 当前显示的类型
        page: 1, // 分页页数
        rows: 10, // 一页条数
        RecordCount: 0, // 总条数
        listHead: [ // 表格
          {
            label: "序号",
            prop: "ID",
            width: 80
          },
          {
            label: "活动名称",
            prop: "Name",
            width: 300
          },
          {
            label: "开卖时间",
            prop: "Time",
            width: 340
          },
          {
            label: "活动状态",
            prop: "State",
            width: 200
          },
          {
            label: "拼团商品",
            prop: "products",
            width: 240
          },
          {
            label: "开团数",
            prop: "startNumber",
            width: 100
          },
          {
            label: "待成团",
            prop: "waitNumber",
            width: 100
          },
          {
            label: "拼团成功",
            prop: "groupSuccess",
            width: 100
          },
          {
            label: "操作",
            prop: "action",
            width: 200
          }
        ],
        listData: [ // 数据
          {
            ID: 1,
            Name: "挺好玩",
            SaleCartStartTime: "2020-01-01 00:00:00",
            SaleCartEndTime: "2020-02-01 23:59:59",
            State: STATE_TYPE.START,
            SepcificationItems: [
              {
                products: "商品1",
                startNumber: 987,
                waitNumber: 123,
                groupSuccess: 678
              },
              {
                products: "商品2",
                startNumber: 234,
                waitNumber: 132,
                groupSuccess: 165
              },
            ]
          },
          {
            ID: 2,
            Name: "腊味",
            SaleCartStartTime: "2020-01-01 00:00:00",
            SaleCartEndTime: "2020-02-01 23:59:59",
            State: STATE_TYPE.END,
            SepcificationItems: [
              {
                products: "商品1",
                startNumber: 987,
                waitNumber: 123,
                groupSuccess: 678
              },
              {
                products: "商品2",
                startNumber: 234,
                waitNumber: 132,
                groupSuccess: 165
              },
            ]
          }
        ],
        SepcificationItemsList: ["products", "startNumber", "waitNumber", "groupSuccess"], // 一行多列的数据
        /****************** List END ******************/
        /****************** Model START ******************/
        ID: "", // 点击修改后跳转的页面的数据ID
        activitySet: { // 活动设置
          State: false, // 活动状态
          Name: "", // 活动名称
          SaleCartTime: null, // 开卖时间段
          Tips: "" // 活动描述
        },
        activitySetLabel: { // 活动设置检验是否输入文字
          State: "活动状态", // 活动状态
          Name: "活动名称", // 活动名称
          SaleCartTime: "开卖时间段", // 开卖时间段
          Tips: "活动描述" // 活动描述
        },
        productVisible: false, // 添加产品的弹窗展示
        textarea: '', // 填写的产品编码
        ProductHead: [ // 活动产品标题
          // 表格
          {
            label: "产品代码",
            prop: "ProductCode",
            width: 100
          },
          {
            label: "产品名称",
            prop: "ProductName",
            width: 240
          },
          {
            label: "拼团价(元)",
            prop: "ActivityPrice",
            width: 120
          },
          {
            label: "单买价(元)",
            prop: "OriginalPrice",
            width: 120
          },
          {
            label: "数量",
            prop: "Qty",
            width: 120
          },
          {
            label: "操作",
            prop: "action",
            width: 80
          }
        ],
        activityProductSet: { // 活动产品设置
          fullMoney: null, // 满
          returnMoney: null, // 减
        },
        activityProductSetLabel: { // 活动产品设置检验是否输入文字
          fullMoney: null, // 满
          returnMoney: null, // 减
        },
        Products: [], // 活动产品
        // 购买限制
        groupLimit: {
          initiate: [],
          join: []
        },
        /****************** Model END ******************/
      },
      methods: {
        /****************** List START ******************/
        // 切换每页条数
        handleSizeChange: function (val) {
          this.page = 1;
          this.rows = val;
          this.GetList();
        },
        // 切换页
        handleCurrentChange: function (val) {
          this.page = val;
          this.GetList();
        },
        // 创建活动
        addActivity: function () {
          // 重置ID
          this.ID = 0;
          // 活动设置
          this.activitySet = {
            State: true, // 活动状态
            Name: "", // 活动名称
            SaleCartTime: null, // 开卖时间段
            Tips: "" // 活动描述
          };
          // 活动产品设置
          this.activityProductSet = {
            fullMoney: null,
            returnMoney: null
          };
          // 购买限制
          this.$refs.limitForm.resetFields();
          this.Products = [];
          this.Page = "Model";
        },
        // 查询活动列表
        GetList: function () {
          // 调接口
          axios({
            method: 'post',
            url: NVMicroService.List,
            // 传递参数
            data: {
              type: this.pageType,
              page: this.page,
              rows: this.rows,
              filters: ''
            },
            responseType: 'json'
          }).then(function (response) {
            // 请求成功
            var res = response.data;
            console.log("GetList: ", res);
            if (res.Success) {
              if (res.Data.List && res.Data.List.length) {
                this.listData = res.Data.List;
              } else {
                this.listData = [];
              }
              this.RecordCount = res.Data && res.Data.RecordCount || "";
            }
          }).catch(function (error) {
            // 请求失败，
            console.log("GetList error: ", error);
            this.$message.error('网络请求出错');
          });
        },
        /**
         * 修改状态
         * @param {Array} row 当前点击行的参数
         */
        UpdateState: function (row) {
          this.$confirm("是否要" + row.State ? '停用' : '启用' + "该活动?", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(function() {
            axios({
              method: 'post',
              url: NVMicroService.UpdateState,
              // 传递参数
              data: {
                Data: {
                  ID: row.ID,
                  State: !row.State,
                }
              },
              responseType: 'json'
            }).then(function(response) {
              // 请求成功
              var res = response.data;
              console.log("UpdateState: ", res);
              if (!res.Success) {
                this.$message.error(res.Message);
              } else {
                this.$message.success('操作成功');
                this.GetList();
              }
            }).catch(function(error) {
              // 请求失败，
              console.log("UpdateState error: ", error);
              this.$message.error('网络请求出错');
            });
          });
        },
        // 删除活动
        Delete: function (row) {
          this.$confirm('确定要删除该活动?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(function() {
            axios({
              method: 'post',
              url: NVMicroService.Delete,
              // 传递参数
              data: {
                Data: {
                  ID: row.ID,
                }
              },
              responseType: 'json'
            }).then(function(response) {
              // 请求成功
              var res = response.data;
              console.log(res);
              if (!res.Success) {
                this.$message.error(res.Message);
              } else {
                this.$message.success('操作成功');
                this.GetList();
              }
            }).catch(function(error) {
              // 请求失败，
              console.log(error);
              this.$message.error('网络请求出错');
            });
          });
        },
        // 点击修改库存
        updataStock: function (row) {
          axios({
            method: 'post',
            url: NVMicroService.ActivityStockGet,
            // 传递参数
            data: {
              ID: row.ID,
              type: row.Type,
            },
            responseType: 'json'
          }).then(function(response) {
            // 请求成功
            var res = response.data;
            console.log(res);
            if (res.Success) {
              this.stockdata = {
                Name: row.Name,
                stockValue: res.Data.ActivityStockQty,
                stockUpdataValue: '',
                ID: row.ID,
                type: row.Type,
                Reason: ''
              };
              this.stockVisible = true;
            } else {
              this.$message.error(res.Message);
            }
          }).catch(function(error) {
            // 请求失败，
            console.log(error);
            this.$message.error('网络请求出错');
          });
        },
        // 点击编辑
        edit: function (row, type = "edit") {
          //  type 如果是edit就是编辑 如果是copy就是复制
          axios({
            method: 'post',
            url: NVMicroService.Model,
            // 传递参数
            data: {
              id: row.ID,
              type: row.Type
            },
            responseType: 'json'
          }).then(function(response) {
            // 请求成功
            var res = response.data;
            if (res.Success) {
              this.Page = 'Model';
              var data = res.Data;
              console.log(data);
              if (type === 'edit') {
                // 保存ID
                this.ID = data.ID;
              } else {
                this.ID = 0;
              }
              // 活动设置
              this.activitySet = {
                State: data.State, // 活动状态
                Name: data.Name, // 活动名称
                SaleCartTime: [data.SaleCartStartTime, data.SaleCartEndTime], // 开卖时间段
                Tips: data.Tips // 活动描述
              };
              // 活动产品设置
              this.activityProductSet = {
                fullMoney: null,
                returnMoney: null
              };
              // 活动产品
              this.Products = data.Products;
            }
          }).catch(function(error) {
            // 请求失败，
            console.log(error);
            this.$message.error('网络请求出错');
          });
        },
        /****************** List END ******************/
        /****************** Model START ******************/
        // 删除活动产品
        deleteProduct: function (index) {
          this.Products.splice(index, 1);
        },
        // 添加活动产品
        addProduct: function (v) {
          console.log(v);
          this.ProductState = v;
          this.productVisible = true;
        },
        searchProduct: function () {
          var CodeData = this.textarea.split(/[(\r\n)\r\n]+/);
          if (!CodeData.length) return;
          // 去除空格项目
          var data = [];
          CodeData.map(function(v) {
            if (v) {
              data.push(v);
            }
          });
          var cfArr = [];
          this.Products.map(function(item) {
            data.map(function(v, i) {
              if (item.ProductCode === v) {
                cfArr.push(v);
              }
            });
          });
          if (cfArr.length) {
            this.$message.error(cfArr.join(',') + ' 已存在，请勿重复添加');
            return;
          }
          this.GetByCode(data);
        },
        // 拉取产品并添加
        GetByCode: function (Code) {
          axios({
            method: 'post',
            url: NVMicroService.GetByCode,
            // 传递参数
            data: {
              Code: Code
            },
            responseType: 'json'
          }).then(function(response) {
            // 请求成功
            var res = response.data;
            console.log(res);
            if (res.Success) {
              var data = res.List;
              // 添加到组合的产品
              this.Products = this.Products.concat(data);
              this.productVisible = false;
              this.textarea = '';
            } else {
              this.$message.error(res.Message);
            }
          }).catch(function(error) {
            // 请求失败，
            console.log(error);
          });
        },
        // 校验新增方案参数是否为空
        checkAddItem: function (itemName) {
          var item = {};
          var itemLabel = {};
          if (itemName === "activitySet") {
            item = this.activitySet;
            itemLabel = this.activitySetLabel;
          } else if (itemName === 'activityProductSet') {
            item = this.activityProductSet;
            itemLabel = this.activityProductSetLabel;
          } else {
            return false;
          }
          for (var x in item) {
            if (x == "remark") {
              continue;
            }
            if (item[x] === '' || item[x] === null) {
              if (itemLabel[x]) {
                this.$message({
                  message: itemLabel[x] + "不能为空",
                  type: "warning",
                  showClose: true,
                });
                return false;
              }
            }
          }
          return true;
        },
        // 活动产品判断
        ProductsFn: function () {
          if (!this.Products || !this.Products.length) {
            this.$message({
              message: "活动产品不能为空",
              type: "warning",
              showClose: true,
            });
            return false;
          }
          var Bool = true;
          for (var i = 0; i < this.Products.length; i++) {
            if (this.Products[i].Err) {
              this.$message({
                message: "请先删除产品中不存在或者重复的项",
                type: "warning",
                showClose: true,
              });
              Bool = false;
              return;
            } else if (!this.Products[i].OriginalPrice) {
              this.$message({
                message: `产品${this.Products[i].ProductName}：单买价不能为空`,
                type: "warning",
                showClose: true,
              });
              Bool = false;
              return;
            } else if (!this.Products[i].ActivityPrice) {
              this.$message({
                message: `产品${this.Products[i].ProductName}：拼团价不能为空`,
                type: "warning",
                showClose: true,
              });
              Bool = false;
              return;
            }
          }
          return Bool;
        },
        // 保存活动, 此处做相关商品的处理
        keepActivity: function () {
          if (!this.checkAddItem('activitySet')) return;
          if (!this.checkAddItem('activityProductSet')) return;
          if (!this.ProductsFn()) return;
          for (var item in groupLimit) {
            if (groupLimit[item].length === 0) {
              this.$message({
                message: groupLimit[item] + "不能为空",
                type: "warning",
                showClose: true,
              });
              return false;
            }
          }
          // 在此做数据的判断，是否填写完毕
          // 数据都正确则进行赋值
          // 接口请求
        },
        /****************** Model END ******************/
      }
    });
  </script>
</body>

</html>