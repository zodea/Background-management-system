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

    /* 审核列表选择 START */
    /* 头部导航 */
    .nav {
      margin-bottom: 40px;
    }

    .details {
      margin-bottom: 50px;
    }

    /* 刷新按钮 */
    .fresh {
      margin-bottom: 30px;
      color: #999999;
      font-size: 12px;
      font-weight: 500;
    }

    .refresh {
      width: 30px;
      height: 30px;
      background: #409eff;
      margin-right: 10px;
      cursor: pointer;
    }

    /* 申请的样式 */
    .title {
      color: #333333;
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 15px;
    }

    /* 详细行 */
    .block {
      padding: 14px 20px;
      width: 100px;
      border-radius: 4px;
      border: 1px solid rgba(0, 0, 0, 0.15);
      cursor: pointer;
    }

    .power {
      font-size: 14px;
      font-weight: 500;
      margin-bottom: 12px;
      color: #333333;
    }

    .number {
      font-size: 18px;
      font-weight: bold;
      color: #1e87fe;
    }

    .icon {
      margin: 0 20px;
    }

    /* 审核列表选择 END */
  </style>
  <!--列表页面END -->
</head>

<body>
  <div id="app" v-cloak>
    <div>
      <el-menu class="nav" :default-active="activeIndex" mode="horizontal" @select="handleSelect">
        <el-menu-item v-for="(item, index) in menuNav" :key="index" :index="index">{{item}}</el-menu-item>
      </el-menu>
      <div class="fresh flex align-center">
        <img class="refresh" src="/icons/refresh.png" alt="" @click="getList">
        更新于{{requestTime}}(15分钟更新一次)
      </div>
      <div class="details" v-for="brandLevel in brandLevels" :key="brandLevel.BrandLevel">
        <h2 class="title">申请{{ brandLevel.BrandLevelName }}</h2>
        <div class="flex">
          <div class="rows flex align-center" v-for="(process, ps) in brandLevel.Processs" :key="ps">
            <div class="block flex flex-column" @click="toDetail(brandLevel, process)">
              <p class="power">待{{ process.ProcessBrandLevelName || process.processType === "I" ? "邀请人" : "总部" }}审核</p>
              <p class="number">{{process.Qty}}</p>
            </div>
            <div v-if="ps < brandLevel.Processs.length - 1" class="icon">
              <img src="/icons/right.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="/d/js/jquery-3.3.1.min.js"></script>
  <script src="/d/js/vue.min.js"></script>
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
  <script src="/d/js/ele-common.js"></script>
  <script>
    var api = "http://192.168.3.222:8024/sr/CustomerApplyProcess.ashx?Oper="; // 开发添加代理，发布需删除
    var NVMicroService = {
      GetApplyProcess: "GetApplyProcess", // 申请审核情况
    }; // 接口地址
    var vm = new Vue({
      el: "#app",
      data: {
        /* 列表选择页 */
        menuNav: [], // 头部导航
        brand_id: [], // 放置头部的id
        activeIndex: 0, // 点击的导航
        brandLevels: null, // 数据
        requestTime: "",
        timer: null,
        /* 详情页 */
      },
      methods: {
        /* 公共部分 START */
        getList: function () {
          var that = this;
          this.MT.request({
            url: api + NVMicroService.GetApplyProcess,
            data: JSON.stringify({}),
            onsuccess: function (data) {
              var list = data.List;
              that.menuNav = [];
              list.forEach(function (item) {
                that.menuNav.push(item.BrandName);
                that.brand_id.push(item.Brand_ID);
              });
              // 根据点击的头部导航赋值
              that.brandLevels = that.setList(data.List, that.menuNav[that.activeIndex])[0].BrandLevels;
              var time = new Date();
              var Y = time.getFullYear();
              var M = time.getMonth() + 1;
              var D = time.getDate();
              var H = time.getHours();
              var m = time.getMinutes();
              var s = time.getSeconds();
              that.requestTime = Y + "-" + that.numToTen(M) + "-" + that.numToTen(D) + " " + that.numToTen(H) + ":" + that.numToTen(m) + ":" + that.numToTen(s);
            },
            onfail: function (err) {
              console.error(err);
            }
          });
        },
        numToTen: function (val) {
          return val < 10 ? "0" + val : val;
        },
        /**
         *  根据 点击的头部标签type 对展示的数据进行筛选
         */
        setList: function (data, type) {
          return data.filter(function (item) {
            return item.BrandName === type;
          });
        },
        /* 公共部分 END */
        /* 头部导航 START */
        /**
         *  获取切换的导航是第几位，再调用获取数据
         *  @param {Number} e 返回的序列号 
         */
        handleSelect: function (e) {
          this.activeIndex = e;
          this.getList();
        },
        /* 头部导航 END */
        /* 列表 START */
        /**
         * 跳转至详情页
         * @param {Array} brandLevel 传入的等级
         * @param {Array} process 该等级下的详细分支
         */
        toDetail: function (brandLevel, process) {
          parent.addTab(this.menuNav[this.activeIndex] + "-申请店代-待" + brandLevel.BrandLevelName + "审核", 'NewCustomer/CustomerApplyProcessList.aspx?rows=10&page=1&sort=1&Brand_ID=' + this.brand_id[this.activeIndex] + "&BrandLevel=" + brandLevel.BrandLevel + "&ProcessType=" + process.ProcessType + "&BrandLevelName=" + process.ProcessBrandLevelName);
        },
        /* 列表 END */
      },
      mounted: function () {
        this.getList();
        var that = this;
        // 15分钟刷新一次
        this.timer = setInterval(function () {
          that.getList();
        }, 15 * 60 * 1000);
      },
      destoryed: function () {
        clearInterval(this.timer);
        this.timer = null;
      }
    });
  </script>
</body>

</html>