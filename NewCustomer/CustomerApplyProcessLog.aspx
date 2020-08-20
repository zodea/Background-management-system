﻿<!DOCTYPE html>
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
    .flex {
      display: flex;
    }

    .flex-column {
      flex-direction: column;
    }

    .flex-center {
      justify-content: center;
    }

    .flex-end {
      justify-content: flex-end;
    }

    .align-center {
      align-items: center;
    }

    .flex-wrap {
      flex-wrap: wrap;
    }

    .space-around {
      justify-content: space-around;
    }

    .space-between {
      justify-content: space-between;
    }

    .container {
      width: 1200px;
      margin: auto;
      padding-bottom: 30px;
      margin-top: 30px;
    }

    /* 审核列表详情 START */
    .tooltip-link {
      margin-left: 30px;
      font-size: 12px;
      font-weight: 500;
    }

    .person-info {
      width: 280px;
      padding: 0 20px;
      text-align: left;
    }

    .audit-img {
      background-color: #000000;
      width: 40px;
      height: 40px;
      margin: 0 10px 20px 0;
    }

    .imgs {
      align-items: flex-start;
    }

    .nav {
      margin-bottom: 20px;
    }

    /* 修改时间线样式 START */
    .el-timeline-item__content {
      color: #999999;
      font-size: 12px;
      font-weight: 500;
    }

    .light .el-timeline-item__content {
      color: #333333;
      font-weight: bold;
    }

    .light .el-timeline-item__timestamp {
      color: #333333;
      font-weight: 400;
    }

    .light .el-timeline-item__tail {
      height: 100%;
      border-left-color: #1E87FE;
    }

    .el-timeline-item__node--normal {
      left: 2px;
      width: 6px;
      height: 6px;
    }

    .el-timeline-item__node--large {
      left: -4px;
      width: 18px;
      height: 18px;
    }

    /* 修改时间线样式 END */

    .search {
      width: 80px;
      height: 30px;
      margin-left: 20px;
      padding: 0;
      border-radius: 2px;
      font-size: 12px;
      font-weight: 500;
    }

    .el-table .audit-table {
      text-align: center;
    }

    .cell .info {
      padding: 0 20px;
      text-align: left;
    }

    .dialog-btn {
      width: 60px;
      height: 30px;
      padding: 0;
      line-height: 30px;
      border-radius: 2px;
      font-size: 12px;
    }

    /* 分页 */
    .pagination {
      margin-top: 20px;
      width: 100%;
    }

    /* 绑定代理设置 */
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

    /* 审核列表详情 END */
  </style>
  <!--列表页面END -->
</head>

<body>
  <div id="app" v-cloak>
    <div class="container">
      <el-form size="mini" class="flex flex-wrap" ref="filterForms" :model="filterForm" :inline="true">
        <el-form-item prop="applyTime" label="申请时间">
          <el-date-picker size="mini" v-model="filterForm.applyTime" type="datetimerange" range-separator="至"
            start-placeholder="开始日期" end-placeholder="结束日期" value-format="yyyy-MM-dd HH:mm:ss">
          </el-date-picker>
        </el-form-item>
        <el-form-item prop="applyName" label="申请人姓名">
          <el-input size="mini" v-model="filterForm.applyName" placeholder="申请人姓名"></el-input>
        </el-form-item>
        <el-form-item prop="applyPhone" label="申请人手机号">
          <el-input size="mini" v-model="filterForm.applyPhone" placeholder="申请人手机号"></el-input>
        </el-form-item>
        <el-form-item prop="applyWeChat" label="申请人微信号">
          <el-input size="mini" v-model="filterForm.applyWeChat" placeholder="申请人微信号"></el-input>
        </el-form-item>
        <el-form-item prop="sort" label="排序">
          <el-select size="mini" v-model="filterForm.sort">
            <el-option v-for="item in sortList" :key="item.value" :label="item.label" :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-tooltip class="item flex" effect="dark" content="按推荐人查询" placement="bottom">
            <div>
              <el-link class="tooltip-link" type="primary" :underline="false" @click="check('referrer')">
                <span v-if="referrerLists && referrerLists[referrerListsIndex]">
                  当前查询推荐人：{{referrerLists[referrerListsIndex].CustomField1}}
                </span>
                <span v-else>查询推荐人</span>
              </el-link>
              <span v-if="referrerLists && referrerLists[referrerListsIndex]" class="pointer"
                @click="disBindAgent('referrer')">解除</span>
            </div>
          </el-tooltip>
        </el-form-item>
        <el-form-item>
          <el-tooltip class="item flex" effect="dark" content="按申请人上级查询" placement="bottom">
            <div>
              <el-link class="tooltip-link" type="primary" :underline="false" @click="check('applicant')">
                <span v-if="applicantLists && applicantLists[applicantListsIndex]">
                  当前查询申请人上级：{{applicantLists[applicantListsIndex].CustomField1}}
                </span>
                <span v-else>查询申请人上级</span>
              </el-link>
              <span v-if="applicantLists && applicantLists[applicantListsIndex]" class="pointer"
                @click="disBindAgent('applicant')">解除</span>
            </div>
          </el-tooltip>
        </el-form-item>
        <el-button type="primary" class="search" @click="search">搜索</el-button>
        <el-button class="search" @click="reset">重置</el-button>
      </el-form>
      <el-menu class="nav" :default-active="activeIndex" mode="horizontal" @select="handleSelect">
        <el-menu-item v-for="(item, index) in menuNav" :key="index" :index="index">{{item}}</el-menu-item>
      </el-menu>
      <el-table :header-cell-style="{background:'#F5F5F5',color:'#333333',textAlign: 'center'}"
        cell-class-name="audit-table" :data="list" width="100%" border>
        <el-table-column prop="Operate" label="状态" width="80">
        </el-table-column>
        <el-table-column prop="ID" label="ID" width="80">
        </el-table-column>
        <el-table-column prop="IsOldCustomerText" label="新/老" width="80">
        </el-table-column>
        <el-table-column label="申请人信息" width="450">
          <template slot-scope="scope">
            <div class="flex flex-center">
              <div class="person-info flex flex-column">
                <span>授权品牌：{{scope.row.BrandName}}</span>
                <span>申请级别：{{scope.row.BrandLevelName}}</span>
                <span>授权名：{{scope.row.Name}}</span>
                <span>微信号：{{scope.row.WeChat}}</span>
                <span>手机号：{{scope.row.Phone}}</span>
                <span>二代身份证：{{scope.row.AuthorizationCode}}</span>
                <span>省市区：{{scope.row.CustomField6}}{{scope.row.CustomField7}}{{scope.row.CustomField8}}</span>
                <span>详细地址：{{scope.row.CustomField5}}</span>
                <span>推荐人：{{scope.row.HandleCustomer}}</span>
              </div>
              <div class="imgs flex flex-column">
                <div>
                  <el-image class="audit-img" :src="scope.row.HeadUrl" alt="" :preview-src-list="[scope.row.HeadUrl]" />
                </div>
                <div class="flex">
                  <el-image class="audit-img" :src="scope.row.CustomImageUrl1" alt=""
                    :preview-src-list="[scope.row.CustomImageUrl1]" @click="console.log(11111)" />
                  <el-image class="audit-img" :src="scope.row.CustomImageUrl2" alt=""
                    :preview-src-list="[scope.row.CustomImageUrl2]" />
                </div>
                <div>
                  <el-image class="audit-img" :src="scope.row.HeadUrl" alt="" :preview-src-list="[scope.row.HeadUrl]" />
                </div>
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="上级信息" width="180">
          <template slot-scope="scope">
            <div class="flex flex-column align-center flex-center">
              <span>{{scope.row.ParentCustomer.Name}}</span>
              <span>(区代：{{scope.row.ParentCustomer.AuthorizationCode}})</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="审核进度" width="380">
          <template slot-scope="scope">
            <div class="flex flex-center">
              <el-timeline class="info">
                <el-timeline-item v-for="(pc, index) in scope.row.timeline" :key="index"
                  :class="{light: pc.type==='primary'}" :type="pc.type" :icon="pc.icon" :size="pc.size"
                  :timestamp="pc.timestamp">
                  {{pc.BrandLevelName}}
                </el-timeline-item>
              </el-timeline>
            </div>
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页器 -->
      <div class="pagination flex flex-end">
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="page"
          :page-sizes="[10, 20, 30, 50]" :page-size="rows" layout="total, sizes, prev, pager, next, jumper"
          :total="RecordCount">
        </el-pagination>
      </div>
    </div>
    <el-dialog :title="'查询'+checkType" :visible.sync="checkVisible" width="500px">
      <el-radio-group v-model="typeIndex">
        <el-radio size="mini" v-for="(item, index) in typeList" :key="index" :value="index" :label="index">
          {{item.QueryType}}
        </el-radio>
      </el-radio-group>
      <div class="flex" style="margin-top: 30px;">
        <el-input size="mini" :placeholder="'请输入' + checkType + typeList[typeIndex].QueryType" v-model="checkInput">
        </el-input>
        <el-button size="mini" type="primary" style="margin-left: 10px;" @click="dialogSearch">搜索</el-button>
      </div>
      <div class="flex" v-if="checkType === '推荐人'">
        <div @click="referrerListsIndexTemp = index"
          :class="['flex-between', 'agentItem', referrerListsIndexTemp === index?'cur':""]"
          v-for="(item, index) in referrerLists" :key="index">
          <img :src="item.HeadUrl" v-if="item.HeadUrl" class="agentHead" alt="">
          <div>
            <p v-if="item.CustomField1">代理名：{{item.CustomField1}}</p>
            <p v-if="item.CustomField2">电话：{{item.CustomField2}}</p>
            <p v-if="item.CustomField3">微信：{{item.CustomField3}}</p>
          </div>
        </div>
      </div>
      <div class="flex" v-if="checkType === '申请人上级'">
        <div @click="applicantListsIndexTemp = index"
          :class="['flex-between', 'agentItem', applicantListsIndexTemp === index?'cur':""]"
          v-for="(item, index) in applicantLists" :key="index">
          <img :src="item.HeadUrl" v-if="item.HeadUrl" class="agentHead" alt="">
          <div>
            <p v-if="item.CustomField1">代理名：{{item.CustomField1}}</p>
            <p v-if="item.CustomField2">电话：{{item.CustomField2}}</p>
            <p v-if="item.CustomField3">微信：{{item.CustomField3}}</p>
          </div>
        </div>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button size="mini" @click="checkVisible = false">取 消</el-button>
        <el-button v-if="referrerLists && referrerListsIndexTemp !== "" && checkType === '推荐人'" size="mini"
          type="primary" @click="submitAgent('referrer')">确 定</el-button>
        <el-button v-if="applicantLists && applicantListsIndexTemp !== "" && checkType === '申请人上级'" size="mini"
          type="primary" @click="submitAgent('applicant')">确 定
        </el-button>
      </div>
    </el-dialog>
  </div>

  <script src="/d/js/jquery-3.3.1.min.js"></script>
  <script src="/d/js/vue.min.js"></script>
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
  <script src="/d/js/ele-common.js"></script>
  <script>
    var api = "http://192.168.3.222:8024/sr/"; // 开发添加代理，发布需删除
    var NVMicroService = {
      GetApplyLog: "CustomerApplyProcess.ashx?Oper=GetApplyLog", // 申请审核-所有申请记录
      Customer: "http://192.168.3.130:8086/sr/Customer.ashx", // 查找代理
    }; // 接口地址
    var vm = new Vue({
      el: "#app",
      data: {
        /* 头部导航  */
        filterForm: { // 搜索框表单
          applyTime: "",
          applyName: "",
          applyPhone: "",
          applyWeChat: "",
          sort: "",
          referrerTargetCustomer_ID: "",
          applicantTargetCustomer_ID: "",
        },
        sortList: [
          {
            value: "1",
            label: "申请时间（降）"
          },
          {
            value: "2",
            label: "申请时间（升）"
          },
        ],
        checkType: "", // 查询表单标题
        checkVisible: false, // 查询表单显隐
        activeIndex: 0,
        menuNav: ["全部", "申请中", "申请通过", "申请失败"],
        typeList: [ // 上级及推荐人搜索的单选选项
          {
            QueryType: "授权名",
            value: 0,
          }, {
            QueryType: "授权代码",
            value: 1,
          }, {
            QueryType: "手机号",
            value: 2,
          }, {
            QueryType: "微信号",
            value: 3,
          }
        ],
        typeIndex: 0, // 当前选中的选项序号
        checkInput: "", // 查询弹窗的输入框
        referrerLists: null, // 搜索找出的推荐人
        referrerListsIndex: "", // 当前选中推荐人
        referrerListsIndexTemp: "", // 确认绑定的推荐人
        applicantLists: null, // 搜索找出的申请人上级
        applicantListsIndex: "", // 当前选中申请人上级
        applicantListsIndexTemp: "", // 确认绑定的申请人上级
        /* 展示的列表 */
        list: null, // 列表
        /* 分页 */
        page: 1, // 当前是第几页
        rows: 10, // 一页的个数
        RecordCount: 0, // 总页数
      },
      methods: {
        /* 详情页 START */
        /* 对参数进行处理 */
        /* 获取详细数据 */
        getDetail: function (data) {
          var that = this;
          var datas = {
            "Data": {
              "rows": this.rows, // 直接获取默认的分页数据
              "page": this.page,
              "sort": this.filterForm.sort || 1,
              "Query": data
            }
          };
          this.MT.request({
            url: api + NVMicroService.GetApplyLog,
            data: JSON.stringify(datas),
            onsuccess: function (res) {
              if (res) {
                var models = res.CustomerApplyModels;
                that.RecordCount = res.RecordCount;
                that.list = models;
                // 对时间线的数据进行赋值
                models.forEach(function (res, index) {
                  that.list[index].timeline = [
                    {
                      type: "primary",
                      icon: "el-icon-check",
                      size: "large",
                      timestamp: res.ApplyTime,
                      BrandLevelName: "提交订单"
                    }];
                  for (var i = 0; i < res.ProcessCustomer.length; i++) {
                    if (!res.ProcessCustomer[i].HandleTime) {
                      that.list[index].timeline[i + 1] = {
                        timestamp: res.ProcessCustomer[i].HandleTime || "",
                        BrandLevelName: res.ProcessCustomer[i].BrandLevelName + "审核（" + res.ProcessCustomer[i].Name + "）"
                      };
                    } else {
                      that.list[index].timeline[i + 1] = {
                        type: "primary",
                        icon: "el-icon-check",
                        size: "large",
                        timestamp: res.ProcessCustomer[i].HandleTime || "",
                        BrandLevelName: res.ProcessCustomer[i].BrandLevelName + "审核（" + res.ProcessCustomer[i].Name + "）"
                      };
                    }
                    if (i === res.ProcessCustomer.length - 1 && res.Operate === "申请失败") {
                      that.list[index].timeline[i + 1] = {
                        type: "danger",
                        icon: "el-icon-close",
                        size: "large",
                        timestamp: res.ProcessCustomer[i].HandleTime || "",
                        BrandLevelName: res.ProcessCustomer[i].BrandLevelName + "审核（" + res.ProcessCustomer[i].Name + "）"
                      };
                    }
                  }
                  if (res.Operate === "申请通过") {
                    that.list[index].timeline.push({
                      type: "primary",
                      icon: "el-icon-check",
                      size: "large",
                      timestamp: "",
                      BrandLevelName: "审核成功"
                    })
                  } else {
                    that.list[index].timeline.push(
                      {
                        timestamp: "",
                        BrandLevelName: "审核成功"
                      });
                  }
                });
              }
            },
            onfail: function (err) {
              that.list = null;
              that.RecordCount = 0;
              that.$message.error("暂未获取到数据");
              console.error(err);
            }
          });
        },
        /* 搜索 START */
        /**
         * 弹出一个 dialog 进行数据的筛选，并根据 type 的类型请求不同的接口
         */
        check: function (type) {
          this.checkType = type === "referrer" ? "推荐人" : "申请人上级";
          this.checkVisible = true;
        },
        /*
         * 对头部搜索栏进行数据合并，在作出相关搜索
         */
        search: function () {
          var filters = [];
          if (this.activeIndex === 0) {
            filters = [];
          } else {
            filters.push({
              "QueryField": "Operate",
              "op": "eq",
              "QueryValue": this.menuNav[this.activeIndex]
            });
          }
          if (this.filterForm.applyTime[0] !== "") {
            filters.push({
              "QueryField": "ApplyTime",
              "op": "gt",
              "QueryValue": this.filterForm.applyTime[0]
            }, {
              "QueryField": "ApplyTime",
              "op": "lt",
              "QueryValue": this.filterForm.applyTime[1]
            });
          }
          if (this.filterForm.applyName) {
            filters.push({
              "QueryField": "Name",
              "op": "eq",
              "QueryValue": this.filterForm.applyName
            });
          }
          if (this.filterForm.applyPhone) {
            filters.push({
              "QueryField": "Phone",
              "op": "eq",
              "QueryValue": this.filterForm.applyPhone
            });
          }
          if (this.filterForm.applyWeChat) {
            filters.push({
              "QueryField": "WeChat",
              "op": "eq",
              "QueryValue": this.filterForm.applyWeChat
            });
          }
          if (this.filterForm.referrerTargetCustomer_ID) {
            filters.push({
              "QueryField": "Brand_RecommendId",
              "op": "eq",
              "QueryValue": this.filterForm.referrerTargetCustomer_ID
            });
          }
          if (this.filterForm.applicantTargetCustomer_ID) {
            filters.push({
              "QueryField": "ParentId",
              "op": "eq",
              "QueryValue": this.filterForm.applicantTargetCustomer_ID
            });
          }

          if (filters.length === 0) {
            this.$message.error("请输入搜索条件后再试");
            return;
          }
          this.page = 1;
          var item = filters;
          this.getDetail(item);
        },
        reset: function () {
          this.$refs.filterForms.resetFields();
          this.page = 1;
          this.getDetail([]);
        },
        /* 搜索 END */
        /* 表单 START */
        // 头部选择框
        handleSelect: function (e) {
          this.activeIndex = e;
          this.search();
        },
        /* 分页 START */
        handleSizeChange: function (value) {
          this.rows = value;
          this.getDetail([]);
        },
        handleCurrentChange: function (value) {
          this.page = value;
          this.getDetail([]);
        },
        /* 分页 END */
        /* 表单 END */
        /* 弹窗操作 START */
        // 暂时无查找人的接口
        dialogSearch: function () {
          var that = this;
          if (this.checkInput === "") {
            this.$message({
              type: "warning",
              message: "请填写需要绑定代理的" + this.typeList[this.typeIndex].QueryType
            });
            return;
          }
          // 暂时只能通过id进行查找
          this.MT.request({
            url: NVMicroService.Customer,
            data: {
              oper: "Get",
              QueryType: this.typeList[this.typeIndex].QueryType,
              QueryValue: this.checkInput,
            },
            onsuccess: function (data) {
              console.log(data);
              if (data.Success) {
                if (that.checkType === "推荐人") {
                  that.referrerLists = [data.Data];
                }
                if (that.checkType === "申请人上级") {
                  that.applicantLists = [data.Data];
                }
              } else {
                that.$message({
                  type: "error",
                  message: data.Message || "代理列表请求失败"
                });
              }
            },
            onfail: function (err) {
              console.error(err);
            }
          });
        },
        //确认绑定代理
        submitAgent: function (type) {
          // 先清除表单
          this.$refs.filterForms.resetFields();
          if (type === "referrer") {
            // 将当前选中的赋值
            this.referrerListsIndex = this.referrerListsIndexTemp;
            this.filterForm.referrerTargetCustomer_ID = this.referrerLists[this.referrerListsIndex].ID;
          }
          if (type === "applicant") {
            // 将当前选中的赋值
            this.applicantListsIndex = this.applicantListsIndexTemp;
            this.filterForm.applicantTargetCustomer_ID = this.applicantLists[this.applicantListsIndex].ID;
          }
          this.checkVisible = false;
          this.search();
        },
        //解除绑定代理
        disBindAgent: function (type) {
          if (type === "referrer") {
            this.filterForm.referrerTargetCustomer_ID = "";
            this.referrerLists = null;
            this.referrerListsIndex = "";
            this.referrerListsIndexTemp = "";
          }
          if (type === "applicant") {
            this.filterForm.applicantTargetCustomer_ID = "";
            this.applicantLists = null;
            this.applicantListsIndex = "";
            this.applicantListsIndexTemp = "";
          }
          this.getDetail([]);
        },
        /* 弹窗操作 END */
        /* 详情页 END */
      },
      mounted: function () {
        this.getDetail([]);
      }
    });
  </script>
</body>

</html>