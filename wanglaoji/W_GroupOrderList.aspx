<!-- 拼团的订单 -->

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" href="https://static.hyxmt.cn/d/js/element-2.3.9.min.css">
  <style>
    .color-primary {
      color: #409EFF !important;
    }

    .color-danger {
      color: #FF4444 !important;
    }

    .color-gray {
      color: #666 !important;
    }

    .font-bold {
      font-weight: bold
    }

    .text-center {
      text-align: center;
    }

    .pointer {
      cursor: pointer;
    }

    .hover-primary.cur {
      color: #1c8dff !important;
    }

    .hover-pass.cur {
      color: #678cf7 !important
    }

    .hover-pay.cur {
      color: #08c1a0 !important
    }

    .hover-send.cur {
      color: #fe8f62 !important
    }

    .hover-get.cur {
      color: #fbb44c !important
    }

    .hover-finish.cur {
      color: #25aecb !important
    }

    .hover-close.cur {
      color: #fe7792 !important
    }

    .hover-primary:hover {
      color: #1c8dff !important;
    }

    .hover-pass:hover {
      color: #678cf7 !important
    }

    .hover-pay:hover {
      color: #08c1a0 !important
    }

    .hover-send:hover {
      color: #fe8f62 !important
    }

    .hover-get:hover {
      color: #fbb44c !important
    }

    .hover-finish:hover {
      color: #25aecb !important
    }

    .hover-close:hover {
      color: #fe7792 !important
    }

    .bg-primary {
      background-color: #1c8dff !important;
      color: white;
    }

    .bg-pass {
      background-color: #678cf7 !important;
      color: white;
    }

    .bg-pay {
      background-color: #08c1a0 !important;
      color: white;
    }

    .bg-send {
      background-color: #fe8f62 !important;
      color: white;
    }

    .bg-get {
      background-color: #fbb44c !important;
      color: white;
    }

    .bg-finish {
      background-color: #25aecb !important;
      color: white;
    }

    .bg-close {
      background-color: #fe7792 !important;
      color: white;
    }

    .icon-circle {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background-color: #FF4444;
      display: inline-block;
    }

    * {
      font-size: 12px;
      margin: 0;
    }

    .container {
      width: 1200px;
      margin: auto;
      padding-bottom: 30px;
      margin-top: 30px;
    }

    .flex-between {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .flex-center {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .flex-center.column {
      flex-direction: column;
    }

    .list {
      position: relative;
    }

    .list-nav {
      line-height: 40px;
      overflow: hidden;
      border-bottom: 2px solid #409EFF;
      margin-bottom: 10px;
      transition: all .3s;
    }

    .list-nav.primary {
      border-color: #1c8dff;
    }

    .list-nav.pass {
      border-color: #678cf7;
    }

    .list-nav.pay {
      border-color: #08c1a0;
    }

    .list-nav.send {
      border-color: #fe8f62;
    }

    .list-nav.get {
      border-color: #fbb44c;
    }

    .list-nav.finish {
      border-color: #25aecb;
    }

    .list-nav.close {
      border-color: #fe7792;
    }

    .list-nav_item {
      padding-left: 10px;
      padding-right: 10px;
      float: left;
      cursor: pointer;
      font-weight: bold;
    }

    .list-nav_item:hover,
    .list-nav_item.cur {
      color: #409EFF;
    }

    .list-title {
      text-align: center;
      font-weight: bold;
      line-height: 40px;
      background-color: #f8f8f8;
      width: 1200px;
      top: 52px;
      overflow: hidden;
      position: absolute;
    }

    .list-title.fixed {
      position: fixed;
      background-color: #f5f5f5;
      z-index: 2;
      box-shadow: 0 0 10px #ccc;
      top: 0;
    }

    .list-list_item {
      font-size: 12px;
      margin-bottom: 10px;
    }

    .item-hd {
      background-color: #E8ECF9;
      padding: 10px 15px;
      line-height: 20px;
    }

    .item-hd>div {
      display: flex;
    }

    .item-hd_item {
      padding-left: 5px;
      padding-right: 5px;
    }

    .state {
      border: 0;
      background-color: #F58338;
      color: white;
      padding-left: 5px 10px;
      border-radius: 4px;
    }

    /* 订单详情-步骤 */
    .step {
      display: flex;
      line-height: 24px;
    }

    .step:last-child .step-icon_line {
      display: none;
    }

    .step:last-child .step-icon_circle {
      background-color: #409EFF
    }

    .step-icon {
      width: 30px;
      flex-shrink: 0;
      min-height: 24px;
      position: relative;
    }

    .step-icon span {
      display: inline-block;
      background-color: #ccc;
      position: absolute;
      left: 50%;
    }

    .step-icon_circle {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      transform: translateX(-50%);
      top: 7px;
    }

    .step-icon_line {
      width: 2px;
      height: 40%;
      top: calc(50% + 6px);
      transform: translateX(-1px);
    }

    .step-time {
      width: 120px;
      flex-shrink: 0;
    }

    .step-info {
      flex: 1;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      padding-right: 5px;
    }

    .step_detail {
      color: #409EFF;
      cursor: pointer;
    }

    .item__body {
      display: flex;
      border-left: 1px solid #E8ECF9;
      border-bottom: 1px solid #E8ECF9;
    }

    .item__col {
      border-right: 1px solid #E8ECF9;
      padding-top: 10px;
      padding-bottom: 10px;
    }

    .item__foot {
      border-left: 1px solid #E8ECF9;
      border-bottom: 1px solid #E8ECF9;
      border-right: 1px solid #E8ECF9;
      line-height: 30px;
      display: flex;
    }


    .nothing {
      line-height: 60px;
      text-align: center;
      font-size: 14px;
      color: #666;
      border: 1px solid #E8ECF9;
    }

    /* .item__col:last-child{border: 0;} */

    .product__table {
      width: 100%;
      text-align: center;
    }

    /* 分页器 */
    .pagination {
      text-align: right;
      margin-top: 15px;
      margin-bottom: 15px;
    }

    /* 订单详情 */
    .detail {
      display: flex
    }

    .detail-item {
      flex: 1;
    }

    .detail-item_info {
      line-height: 24px;
    }

    .detail-item_icon {
      margin-left: 15px;
    }

    /* 查询代理 */
    .flex {
      display: flex;
    }

    .agentItem {
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #EEE;
      cursor: pointer;
      line-height: 14px;
    }

    .agentItem:hover,
    .agentItem.cur {
      border-color: #409EFF;
    }

    .agentHead {
      width: 42px;
      height: 42px;
      border-radius: 6px;
      margin-right: 8px;
    }

    .top_info_detail img {
      width: 40px;
      height: 40px;
      border-radius: 4px;
      margin-right: 10px;
      line-height: 24px;
    }

    .top_info_detail>p {
      margin-top: 5px;
      margin-bottom: 5px;
    }

    .top_info_detail p {
      line-height: 14px;
    }

    @font-face {
      font-family: "iconfont";
      src: url('iconfont.eot?t=1544522136802');
      /* IE9*/
      src: url('iconfont.eot?t=1544522136802#iefix') format('embedded-opentype'),
        /* IE6-IE8 */
        url('data:application/x-font-woff;charset=utf-8;base64,d09GRgABAAAAAAUoAAsAAAAAB5gAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAABHU1VCAAABCAAAADMAAABCsP6z7U9TLzIAAAE8AAAARAAAAFY9K0inY21hcAAAAYAAAABLAAABcOfdt8lnbHlmAAABzAAAAXUAAAGgQlkDKGhlYWQAAANEAAAALwAAADYTipksaGhlYQAAA3QAAAAcAAAAJAfeA4NobXR4AAADkAAAAAgAAAAICAAAAGxvY2EAAAOYAAAABgAAAAYA0AAAbWF4cAAAA6AAAAAgAAAAIAEPAI9uYW1lAAADwAAAAUUAAAJtPlT+fXBvc3QAAAUIAAAAIAAAADHn4dl+eJxjYGRgYOBikGPQYWB0cfMJYeBgYGGAAJAMY05meiJQDMoDyrGAaQ4gZoOIAgCKIwNPAHicY2BkYWCcwMDKwMHUyXSGgYGhH0IzvmYwYuRgYGBiYGVmwAoC0lxTGByebX22lbnhfwNDDHMDQwNQmBEkBwD5bQ1NeJxjYGBgZWBgYAZiHSBmYWBgDGFgZAABP6AoI1icmYELLM7CoARWwwISf7b1/38YCeSzgEkGRjaGUcADJmWgPHBYQTADIwDjkww9AHicJY3LTttAFIbn+MQz8Xh8iy+TIcUuuTiQBidpSywgyQrEArEpjcorIBZsgA1SJFC7y5I16hIkXgjxLgG73Xw65zv6z0+QkPc7fMYFGZBLck9IR+rdDLppiQzyGUQS04IJlGMkx/n4PxKtcJHeSQeQDrQMKKPrwCQrUsyGBNi/N6zQYbFgBjZIvzwWJpIxyBKY0jKSSzaD0rEM8G919ULd6dahYmnUHHoin6ql+DTZE7nYWjdMxutxj9v+576R7DiA2uoV1mqaplk7CQY9CpDEffTDOsNuPCr6TD+gGmTxDW21HfaU+sexzQzVWevzYNw/eJtefR0Evw5V8/v17OTPKNheeN7C3ty1wgOvIWqjrnIFh5t4TzbiB+HolHHBeRBYzFTy53KzN99/PM935+3Wcm44jqkjwg9+ZTiUh3hh/kZeqbKqoKjfmrDvufZGbTUJTUV1y22EdrM+dq0JnhoVK1VHZ8EXgYb5raOaQ0I+AAOXNp8AAAB4nGNgZGBgAOJprWffx/PbfGXgZmEAgRumq2Yg6P+NLAzMdUAuBwMTSBQAUCkLNQB4nGNgZGBgbvjfwBDDwgACQJKRARUwAQBHCAJrBAAAAAQAAAAAAAAAANAAAAABAAAAAgCDAAMAAAAAAAIAAAAKAAoAAAD/AAAAAAAAeJxlj01OwzAQhV/6B6QSqqhgh+QFYgEo/RGrblhUavdddN+mTpsqiSPHrdQDcB6OwAk4AtyAO/BIJ5s2lsffvHljTwDc4Acejt8t95E9XDI7cg0XuBeuU38QbpBfhJto41W4Rf1N2MczpsJtdGF5g9e4YvaEd2EPHXwI13CNT+E69S/hBvlbuIk7/Aq30PHqwj7mXle4jUcv9sdWL5xeqeVBxaHJIpM5v4KZXu+Sha3S6pxrW8QmU4OgX0lTnWlb3VPs10PnIhVZk6oJqzpJjMqt2erQBRvn8lGvF4kehCblWGP+tsYCjnEFhSUOjDFCGGSIyujoO1Vm9K+xQ8Jee1Y9zed0WxTU/3OFAQL0z1xTurLSeTpPgT1fG1J1dCtuy56UNJFezUkSskJe1rZUQuoBNmVXjhF6XNGJPyhnSP8ACVpuyAAAAHicY2BigAAuBuyAiZGJkZmBvTgjv7Q4I5OBAQAVDwMg') format('woff'),
        url('iconfont.ttf?t=1544522136802') format('truetype'),
        /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
        url('iconfont.svg?t=1544522136802#iconfont') format('svg');
      /* iOS 4.1- */
    }

    .iconfont {
      font-family: "iconfont" !important;
      font-size: 16px;
      font-style: normal;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    .icon-shoushi:before {
      content: "\e6b5";
    }
  </style>
  <style>
    /* 替换的新样式 */
    .search {
      width: 80px;
      height: 30px;
      background: rgba(64, 158, 255, 1);
      border-radius: 2px;
      color: #ffffff;
      line-height: 17px;
      font-size: 12px;
      padding: 6px 28px;
    }

    .product-outer {
      display: flex;
    }

    .product-inner {
      display: flex;
      align-items: start;
      flex-direction: column;
    }

    .ellipsis {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .link {
      color: #409eff;
      cursor: pointer;
      font-size: 14px;
      font-weight: 500;
    }

    .el-table thead {
      color: #909399;
      font-weight: 500;
    }
  </style>
</head>

<body>
  <div class="container">
    <template>
      <el-form ref="form" :size="size" :inline="true" :model="form">
        <!-- 拼团状态 -->
        <el-form-item label="拼团状态">
          <el-select :size="size" v-model="form.W_GroupType" placeholder="请选择">
            <el-option label="全部" value="0"></el-option>
            <el-option label="待成团" value="1"></el-option>
            <el-option label="拼团成功" value="2"></el-option>
          </el-select>
        </el-form-item>
        <!-- 订单号 -->
        <el-form-item label="拼团号">
          <el-input :size="size" style="width: 200px" v-model="form.groupCode" placeholder="拼团号"></el-input>
        </el-form-item>
        <!-- 订单号 -->
        <el-form-item label="订单号">
          <el-input :size="size" style="width: 200px" v-model="form.orderCode" placeholder="订单号"></el-input>
        </el-form-item>
        <!-- 收货人姓名 -->
        <el-form-item label="收货人姓名">
          <el-input :size="size" style="width: 200px" v-model="form.WuserName" placeholder="收货人姓名"></el-input>
        </el-form-item>
        <!-- 收货人手机号 -->
        <el-form-item label="收货人手机号">
          <el-input :size="size" style="width: 200px" v-model="form.WtelNumber" placeholder="收货人手机号">
          </el-input>
        </el-form-item>
        <el-button type="primary" class="search" @click="">搜索</el-button>
      </el-form>
      <!-- 列表 -->
      <div class="list">
        <div :class="['list-nav', stateBgColor[stateType[stateTypeIndex].value.toString()].border]">
          <div v-for="(v, i) in stateType" :key="i" @click="changeState(v.value, i)"
            :class="['list-nav_item', v.color, i == stateTypeIndex ? 'cur':'']">
            {{v.label + (v.num !== false ? '（'+v.num+'）' : '')}}</div>
        </div>
        <div v-if="list && list.length !== 0">
          <el-table :data="list" tooltip-effect="dark" stripe
            :header-cell-style="{background:'#F5F5F5',color:'#333333'}" style="width: 100%;">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="orderType" label="订单状态" width="100" align="center"></el-table-column>
            <el-table-column prop="orderCode" label="订单号" width="177" align="center"></el-table-column>
            <el-table-column label="拼团状态" width="100" align="center">
              <template slot-scope="scope">
                <span :style="{color: scope.row.groupType === '待成团' ? '#333333' : '#29AF39'}">
                  {{scope.row.groupType}}
                </span>
              </template>
            </el-table-column>
            <el-table-column prop="groupCode" label="拼团号" width="140" align="center"></el-table-column>
            <el-table-column label="商品" width="225" align="center">
              <template slot-scope="scope">
                <div class="product-outer">
                  <img :src="scope.row.productPic" alt="" width="40">
                  <div class="product-inner">
                    <span>{{scope.row.productName}}</span>
                    <span>¥{{scope.row.productPrice}}</span>
                  </div>
                </div>
              </template>
            </el-table-column>
            <el-table-column prop="counts" label="数量" width="100" align="center"></el-table-column>
            <el-table-column prop="price" label="金额(元)" width="100" align="center"></el-table-column>
            <el-table-column label="收货信息" width="340" align="center">
              <template slot-scope="scope">
                <p align="left">{{scope.row.deliveryName}} {{scope.row.deliveryPhone}}</p>
                <p class="ellipsis" align="left">{{scope.row.deliveryAddress}}</p>
              </template>
            </el-table-column>
            <el-table-column label="时间" width="220" align="center">
              <template slot-scope="scope">
                <p v-if="scope.row.payTime">支付：{{scope.row.payTime}}</p>
                <p v-if="scope.row.shipTime">发货：{{scope.row.shipTime}}</p>
                <p v-if="scope.row.receiptTime">收货：{{scope.row.receiptTime}}</p>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="120" align="center">
              <!-- 根据发货时间判断是否有物流 -->
              <template slot-scope="scope">
                <el-popover v-if="scope.row.shipTime" placement="bottom"
                  :title="scope.row.courierCompany + ' ' + scope.row.trackNum" width="300" trigger="click">
                  <el-timeline>
                    <el-timeline-item v-for="(activity, index) in scope.row.activities" :key="index"
                      :color="index===0 && '#529EF6'" :timestamp="activity.timestamp">
                      <div>
                        <p>{{activity.content}}</p>
                        <p v-if="activity.city">[{{activity.city}}] {{activity.cityContent}}</p>
                        <p v-if="activity.number">[{{activity.number}}]
                          {{activity.numberContent}}</p>
                        <p v-if="activity.words">{{activity.words}}</p>
                      </div>
                    </el-timeline-item>
                  </el-timeline>
                  <span class="link" slot="reference">查看物流</span>
                </el-popover>
                <span v-else class="link" @click="send(scope.$index)">发货</span>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="nothing" v-else>暂无数据</div>
      </div>
      <!-- 分页器 -->
      <div class="pagination">
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="page"
          :page-sizes="[10, 20, 30, 50]" :page-size="rows" layout="total, sizes, prev, pager, next, jumper"
          :total="RecordCount">
        </el-pagination>
      </div>

      <!-- 发货弹窗 -->
      <el-dialog title="发货" @close="onSendDialogClose" :visible.sync="dialogSendVisible">
        <template v-if="list && list.length != 0">
          <el-form :model="sendForm" v-if="list[listIndex].PostageType != 1">
            <el-form-item label="快递公司" label-width="100px">
              <el-select v-model="sendForm.EMSCompany" placeholder="选择快递">
                <el-option v-for="(item, index) in express" :key="index" :label="item.label" :value="item.label">
                </el-option>
              </el-select>
              <span v-if="list[listIndex].EMSCompany">运费审核中，您选择了 "{{list[listIndex].EMSCompany}}"
                快递公司</span>
            </el-form-item>
            <el-form-item label="快递单号" label-width="100px">
              <el-input v-model="sendForm.EMSCode" placeholder="快递单号"></el-input>
            </el-form-item>
          </el-form>
          <div style="line-height: 30px; color: #666;" v-else>发货方式：{{list[listIndex].PostageTypeText}}</div>
        </template>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogSendVisible = false">取消</el-button>
          <el-button type="primary" @click="submitSend">提交</el-button>
        </div>
      </el-dialog>
    </template>
  </div>
  <script src="https://static.hyxmt.cn/d/js/jquery-3.3.1.min.js"></script>
  <script src="https://static.hyxmt.cn/d/js/vue.min.js"></script>
  <script src="https://static.hyxmt.cn/d/js/element-2.3.9.min.js"></script>
  <script src="https://static.hyxmt.cn/d/js/ele-common.js"></script>
  <script>
    // window.StateID = -1;
    window.baseUrl = '/sr/W_OrderList.ashx?StateID=';
    window.model_type = 1;
    window.getAgentUrl = '/sr/Customer.ashx';
    window.stateType = [
      {
        label: '全部',
        num: false,
        color: 'hover-primary',
        value: -1,
      }, {
        label: '待付款',
        num: 0,
        color: 'hover-pay',
        value: 0,
      }, {
        label: '待发货',
        num: 0,
        color: 'hover-send',
        value: 18,
      }, {
        label: '待收货',
        num: 0,
        color: 'hover-get',
        value: 21,
      }, {
        label: '已完成',
        num: 0,
        color: 'hover-finish',
        value: 66,
      },
    ];
    now = new Date();
    var vm = new Vue({
      el: '.container',
      data: {
        stateBgColor: {
          '-1': {
            bg: 'bg-primary',
            border: 'primary',
          },
          '0': {
            bg: 'bg-pay',
            border: 'pay',
          },
          '18': {
            bg: 'bg-send',
            border: 'send',
          },
          '21': {
            bg: 'bg-get',
            border: 'get',
          },
          '66': {
            bg: 'bg-finish',
            border: 'finish'
          },
        },
        model_type: window.model_type,
        size: 'mini',
        col: [5, 5, 8, 3, 3],
        state: {
          ALL: -1,                //所有
          WAIT_PAY: 0,            //待付款
          WAIT_SEND: 18,          //待发货
          WAIT_DELIVERY: 21,      //待收货
          FINISH: 66              //已完成
        },
        dialogPassVisible: false,
        passLabelWidth: '100px',
        express: [
          {
            label: '优速快递',
            value: 0,
          }, {
            label: '韵达快递',
            value: 1,
          }, {
            label: '圆通速递',
            value: 2,
          }, {
            label: '申通速递',
            value: 3,
          }, {
            label: '百世汇通',
            value: 4,
          }, {
            label: '邮政包裹',
            value: 5,
          }, {
            label: '天天快递',
            value: 6,
          }, {
            label: '中通快递',
            value: 7,
          }, {
            label: '顺丰速递',
            value: 8,
          }, {
            label: 'EMS',
            value: 9,
          }, {
            label: '宅急送',
            value: 10,
          }, {
            label: '全峰快递',
            value: 11,
          }, {
            label: '德邦物流',
            value: 12,
          }, {
            label: '其它',
            value: 1,
          },
        ],
        passForm: {
          PostageType: 3,
          EMSCompany: '',
          Postage: 0,
        },
        passType: [
          {
            label: '邮费',
            value: 3,
          }, {
            label: '免邮费',
            value: 2,
          }
        ],
        //绑定代理
        QueryList: [
          {
            QueryType: '手机号',
            vlaue: 0,
          }, {
            QueryType: '微信号',
            vlaue: 1,
          }, {
            QueryType: '授权代码',
            vlaue: 2,
          }
        ],
        QueryListIndex: 0,
        QueryValue: '',
        dialogBindVisible: false,
        agentLists: null,
        agentListsIndex: '',
        agentListsIndexTemp: '',
        dialogSendVisible: false,
        sendForm: {
          EMSCompany: '',
          EMSCode: '',
        },
        dialogDetailVisible: false,
        // labelWidth: '100px',
        form: {
          W_GroupType: '',
          groupCode: '',
          orderCode: '',
          WuserName: '',
          WtelNumber: ''
        },
        stateType: window.stateType,
        stateTypeIndex: 0,
        page: 1,
        rows: 10,
        PageCount: 0,
        RecordCount: 0,
        IsLastPage: false,
        filters: '',
        StateID: -1,
        //数据实体
        // list: null,
        list: [
          {
            orderType: "待付款",
            orderCode: "81536255425233957044",
            groupType: "待成团",
            groupCode: "73453762323",
            productName: "这是产品名称产品名称",
            productPic: "#",
            productPrice: "29.9",
            counts: 1,
            price: "29.90",
            deliveryName: "米娜娜",
            deliveryPhone: "18809876543",
            deliveryAddress: "广东省广州市越秀区越秀南路185号创举商务大厦8楼",
            payTime: "2020-02-01 12:39:08",
            shipTime: "",
            receiptTime: "",
          },
          {
            orderType: "已完成",
            orderCode: "81536255425233957044",
            groupType: "拼团成功",
            groupCode: "73453762323",
            productName: "这是产品名称产品名称",
            productPic: "#",
            productPrice: "29.9",
            counts: 1,
            price: "29.90",
            deliveryName: "米娜娜",
            deliveryPhone: "18809876543",
            deliveryAddress: "广东省广州市越秀区越秀南路185号创举商务大厦8楼",
            payTime: "2020-02-01 12:39:08",
            shipTime: "2020-02-01 12:39:08",
            receiptTime: "2020-02-01 12:39:08",
            courierCompany: "天天快递",
            trackNum: "78678578976",
            activities: [
              {
                content: "运输中",
                timestamp: "2019-01-01 12:06:29",
                city: "广州市",
                cityContent: "快件已到达广州市"
              },
              {
                content: "已揽件",
                timestamp: "2019-01-01 12:06:29",
                city: "广州市",
                cityContent: "荔湾区",
                number: "18898765432",
                numberContent: "已揽件"
              },
            ]
          },
        ],
        listIndex: 0,
      },
      methods: {
        exports: function () {
          this.MT.request({
            url: window.baseUrl + this.StateID,
            data: {
              oper: 'Export',
              filters: this.filters,
              OrderType: 2,
              SortField: 'ID',
              Sort: this.form.Sort,
            },
            onsuccess: function (data) {
              console.log(data);
              if (data.Success) {
                window.open(data.url);
              } else {
                vm.toast((data.Message || '导出错误'), "warning");
              }
            },
            onfail: function (data) {
              vm.toast((data.Message || '导出失败详情失败'), "error");
            }
          });
        },
        //查询代理
        getAgentList: function () {
          if (this.QueryValue === '') {
            this.$message({
              type: 'warning',
              message: '请填写需要绑定代理的' + this.QueryList[this.QueryListIndex].QueryType
            });
            return;
          }
          this.MT.request({
            url: window.getAgentUrl,
            data: {
              oper: 'Get',
              QueryType: this.QueryList[this.QueryListIndex].QueryType,
              QueryValue: this.QueryValue,
            },
            onsuccess: function (data) {
              console.log("getAgentList", data);
              if (data.Success) {
                this.agentLists = [data.Data];
              } else {
                this.$message({
                  type: 'error',
                  message: data.Message || '代理列表请求失败'
                });
              }
            },
            onfail: function (err) {
              console.log("爱迪生", err);
            }
          });
        },
        //重置表单
        resetForm: function () {
          this.form = {
            WorkDate: '',
            Code: '',
            WuserName: '',
            WtelNumber: '',
            W_ProductActivityType: '',      //null跟产品活动没关系，1参加活动的订单，2通过产品活动下单
            Source: '',
            openid: '',
            IsTransfer: '',
            Sort: 'asc',
          };
        },
        onSendDialogClose: function () {
          this.sendForm = {
            EMSCompany: '',
            EMSCode: '',
          };
        },
        //发货
        send: function (index) {
          this.listIndex = index;
          this.dialogSendVisible = true;
          if (this.list[this.listIndex].PostageType != 1) {
            if (this.list[this.listIndex].EMSCompany) this.sendForm.EMSCompany = this.list[this.listIndex].EMSCompany;
          }
        },
        submitSend: function () {
          if (this.list[this.listIndex].PostageType != 1) {
            if (!this.sendForm.EMSCompany) {
              vm.toast('请选择快递公司', "error");
              return;
            }
            if (!this.sendForm.EMSCode) {
              vm.toast('请填写快递单号', "error");
              return;
            }
          }
          this.MT.request({
            url: window.baseUrl + this.StateID,
            data: {
              oper: 'StateUpdate',
              W_Order_ID: this.list[this.listIndex].ID,
              OldState: this.list[this.listIndex].State,
              NewState: this.state.WAIT_DELIVERY,
              DataJson: JSON.stringify({
                EMSCompany: this.sendForm.EMSCompany,
                EMSCode: this.sendForm.EMSCode,
              }),
            },
            onsuccess: function (data) {
              if (data.Success) {
                if (vm.StateID == -1) {
                  vm.list[vm.listIndex].State = vm.state.WAIT_DELIVERY;
                  vm.list[vm.listIndex].StateText = '待收货';
                  vm.list[vm.listIndex].EMSCode = vm.sendForm.EMSCode;
                  vm.list[vm.listIndex].EMSCompany = vm.sendForm.EMSCompany;
                } else {
                  vm.list.splice(vm.listIndex, 1);
                }
                vm.dialogSendVisible = false;
                vm.stateType[3].num -= 1;
                vm.stateType[4].num += 1;
                vm.toast("操作成功", "success");
              } else vm.toast(data.Message, "error");
              // window.location.reload();
            },
            onfail: function (data) {
              vm.toast(data.Message, "error");
            }
          });
        },
        //自提
        passSelf: function (index) {
          this.listIndex = index;
          this.$confirm('该订单是否需要客户自提吗？').then(function (value) {
            if (value == 'confirm') {
              this.MT.request({
                url: window.baseUrl + this.StateID,
                data: {
                  oper: 'StateUpdate',
                  W_Order_ID: this.list[this.listIndex].ID,
                  OldState: this.list[this.listIndex].State,
                  NewState: this.state.WAIT_DELIVERY,
                  DataJson: JSON.stringify({
                    PostageType: 1,
                  }),
                },
                onsuccess: function (data) {
                  if (data.Success) {
                    if (vm.StateID == -1) {
                      vm.list[vm.listIndex].State = vm.state.WAIT_PAY;
                      vm.list[vm.listIndex].StateText = '代付款';
                      vm.list[vm.listIndex].PostageTypeText = '自提';
                    } else vm.list.splice(vm.listIndex, 1);
                    vm.dialogPassVisible = false;
                    vm.stateType[1].num -= 1;
                    vm.stateType[2].num += 1;
                    vm.toast("操作成功", "success");
                  } else vm.toast(data.Message, "error");
                  // window.location.reload();
                },
                onfail: function (data) {
                  vm.toast(data.Message, "error");
                }
              });
            }
          });
        },
        //邮费审核
        passExpress: function (index) {
          this.dialogPassVisible = true;
          this.listIndex = index;
        },
        //确定审核运费
        pass: function () {
          if (!this.passForm.EMSCompany) {
            vm.toast('请选择快递公司', "error");
            return;
          }
          if (this.passForm.Postage == 0 && this.passForm.PostageType == 3) {
            this.$confirm('运费是否设置为0').then(function (value) {
              if (value == 'confirm') {
                this.passFn();
              }
            });
          } else this.passFn();
        },
        passFn: function () {
          this.MT.request({
            url: window.baseUrl + this.StateID,
            data: {
              oper: 'StateUpdate',
              W_Order_ID: this.list[this.listIndex].ID,
              OldState: this.list[this.listIndex].State,
              NewState: this.state.WAIT_PAY,
              DataJson: JSON.stringify({
                PostageType: this.passForm.PostageType,
                EMSCompany: this.passForm.EMSCompany,
                Postage: this.passForm.PostageType == 3 ? this.passForm.Postage : '',
              }),
            },
            onsuccess: function (data) {
              if (data.Success) {
                if (vm.StateID == -1) {
                  vm.list[vm.listIndex].State = vm.state.WAIT_PAY;
                  vm.list[vm.listIndex].StateText = '代付款';
                  vm.list[vm.listIndex].Postage = vm.passForm.Postage;
                  vm.list[vm.listIndex].PostageTypeText = vm.passForm.PostageType == 2 ? '免邮费' : '邮费';
                } else {
                  vm.list.splice(vm.listIndex, 1);
                }
                vm.dialogPassVisible = false;
                vm.stateType[1].num -= 1;
                vm.stateType[2].num += 1;
                vm.toast("操作成功", "success");
              } else vm.toast(data.Message, "error");
              // window.location.reload();
            },
            onfail: function (data) {
              vm.toast(data.Message, "error");
            }
          });
        },
        //审核失败
        passFail: function (index) {
          this.listIndex = index;
          this.$prompt('该订单是否需要审核失败？').then(function (value) {
            this.MT.request({
              url: window.baseUrl + this.StateID,
              data: {
                oper: 'StateUpdate',
                W_Order_ID: this.list[this.listIndex].ID,
                OldState: this.list[this.listIndex].State,
                NewState: this.state.AUDITED_FAIL,
                DataJson: JSON.stringify({
                  TargetRemark: value,
                }),
              },
              onsuccess: function (data) {
                if (data.Success) {
                  if (vm.StateID == -1) {
                    vm.list[vm.listIndex].State = vm.state.AUDITED_FAIL;
                    vm.list[vm.listIndex].StateText = '审核失败';
                  } else vm.list.splice(vm.listIndex, 1);
                  vm.stateType[1].num -= 1;
                  vm.toast("操作成功", "success");
                } else vm.toast(data.Message, "error");
              },
              onfail: function (data) {
                vm.toast(data.Message, "error");
              }
            });
          });
        },
        getList: function () {
          this.MT.request({
            url: window.baseUrl + this.StateID,
            data: {
              oper: 'List',
              // oper: 'Log',
              page: this.page,
              rows: this.rows,
              filters: this.filters,
              OrderType: 2,
              SortField: 'ID',
              Sort: this.form.Sort,
            },
            onsuccess: function (data) {
              console.log("请求列表", data);
              if (data.Success) {
                if (data.List && data.List.length != 0) {
                  vm.list = data.List;
                  vm.PageCount = data.PageCount;
                  vm.RecordCount = data.RecordCount;
                  vm.IsLastPage = data.IsLastPage;
                  // vm.toast("删除成功","success");
                } else {
                  vm.list = null;
                  vm.RecordCount = 0;
                }
              } else vm.toast(data.Message, "error");
            }
          });
        },
        //订单状态数量
        getStateNum: function () {
          this.MT.request({
            url: window.baseUrl + this.StateID,
            data: {
              oper: 'GetStateCount',
              OrderType: 2,
              TransferType: 0,
            },
            onsuccess: function (data) {
              console.log("请求列表", data);
              if (data.Success) {
                for (var i of vm.stateType) {
                  for (var j = 0; j < data.OrderCounts.length; j++) {
                    if (i.value == data.OrderCounts[j].State) {
                      i.num = data.OrderCounts[j].Qty;
                      break;
                    } else if (j == data.OrderCounts.length - 1) {
                      i.num = false;
                    }
                  }
                }
              }
              else vm.toast(data.Message, "error");
            }
          });
        },
        getDiscountMoney: function (x, y) {
          return (Number(x) - Number(y)).toFixed(2);
        },
        //分页器钩子
        handleSizeChange: function (value) {
          this.rows = value;
          this.getList();
        },
        handleCurrentChange: function (value) {
          this.page = value;
          this.getList();
        },
        changeState: function (state, index) {
          this.page = 1;
          this.resetForm();           //重置便当
          if (this.filters != '') {
            this.getStateNum();
            this.filters = '';          //清空过滤器
          }
          //{"groupOp":"AND","rules":[{"field":"Code","op":"cn","data":"A61115354548737442"}]}
          if (this.stateTypeIndex != index) {
            if (state == -100) {
              this.StateID = -1;
              this.filters = JSON.stringify({ "groupOp": "AND", "rules": [{ "field": "IsClose", "op": "eq", "data": true }] });
            } else {
              this.StateID = state;
              // this.filters = JSON.stringify({"groupOp":"AND","rules":[{"field":"State","op":"eq","data":state}]})
            }
            this.getList();
            this.stateTypeIndex = index;
          }
        },
        //搜索
        onsearch: function () {
          var data = this.form;
          var rules = [];
          for (var i in data) {
            if (i != 'Sort') {
              if (data[i]) {
                if (i == 'WorkDate') {
                  rules.push({
                    field: i,
                    op: 'ge',
                    data: data[i][0]
                  });
                  rules.push({
                    field: i,
                    op: 'le',
                    data: data[i][1]
                  });
                } else if (i == 'IsTransfer') {
                  rules.push({
                    field: i,
                    op: data[i] == 1 ? 'eq' : 'gt',
                    data: 0
                  });
                } else if (i == 'W_ProductActivityType') {
                  rules.push({
                    field: i,
                    op: 'eq',
                    data: data[i] == 3 ? '' : data[i]
                  });
                } else {
                  rules.push({
                    field: i,
                    op: this.isUseEq(i) ? 'eq' : 'cn',
                    data: data[i]
                  });
                }
              }
            }
          }
          if (rules.length > 0) {
            this.clearStateNum();
            if (this.stateType[this.stateTypeIndex].value != -1)
              rules.push({ "field": "State", "op": "cn", "data": this.stateType[this.stateTypeIndex].value });
            this.filters = JSON.stringify({ "groupOp": "AND", "rules": rules });
          } else { this.filters = ''; }
          this.getList();
        },
        //是否需要使用eq的过滤字段
        isUseEq: function (key) {
          var arr = ['Source', 'TargetCustomer_ID'];
          return arr.indexOf(key) !== -1;
        },
      },
      created: function () {
        //请求列表
        this.getList();
        //取每个状态的数量
        this.getStateNum();
      },
      mounted: function () {
        var that = this;
        // this.$nextTick(()=>{
        //     console.log(this.$refs)
        //     console.log(this.$refs.listTitle)
        //     let listTitle = this.$refs.listTitle.$el;
        //     let listTitleTop = listTitle.offsetTop + 30 + listTitle.offsetParent.offsetTop;
        //     window.onscroll = function(){
        //         if(window.scrollY >= listTitleTop){
        //             listTitle.className = 'list-title fixed';
        //         }else listTitle.className = 'list-title';
        //     }
        // })
      },
    });
  </script>
</body>

</html>