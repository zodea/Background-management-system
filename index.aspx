<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><% =LTP.Common.ConfigHelper.GetConfigString("TypeName")%>代理商管理系统</title>
    <link type="text/css" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqueryui/1.8.12/themes/redmond/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqueryui/1.8.12/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/css/nyroModal.css" type="text/css" media="screen" />
	  <link rel="stylesheet" href="icons/font/iconfont.css">
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.nyroModal-1.5.5.pack.js"></script>
    <script type="text/javascript" src="d/js/tab_new.js?v=1"></script>
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.layout.min.js"></script>
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.qrcode-0.11.0.min.js"></script>
  <style type="text/css">
    @IMPORT url("imgs/tab.css");
    @IMPORT url("css/new_new.css?v=1");

    html,
    body {
      height: 100%;
    }

    body {
      font-family: Arial, sans-serif;
      font-size: 12px;
      margin: 0;
      padding: 0;
      min-width: 1100px;
    }

    table {
      font-size: 12px;
    }

    a {
      text-decoration: none
    }

    .ui-layout-pane-west {
      /* OVERRIDE 'default styles' */
      padding: 0 !important;
      overflow: hidden !important;
      border-width: 0px !important;
    }

    .ui-layout-north {
      /* OVERRIDE 'default styles' */
      padding: 0 !important;
      overflow: hidden !important;
      border-width: 0px !important;

    }

    .ui-layout-south {
      padding: 0 !important;
      overflow: hidden !important;
      border-width: 0px !important;
    }

    .ui-layout-center {
      margin-left: 0;
    }

    .ui-tabs .ui-tabs-panel {
      padding: 0px 10px 0px 10px !important;
      overflow: hidden !important;
    }

    .ui-accordion .ui-accordion-content {
      padding-left: 10px;
      padding-top: 0px;
      padding-right: 0px;
    }


    .ui-layout-resizer {
      background: #DFEFFC url(css/redmond/images/ui-bg_glass_85_dfeffc_1x400.png) repeat-x scroll 50% 50% !important;

    }

    .ui-layout-resizer-closed {
      background: #DFEFFC url(css/redmond/images/ui-bg_glass_85_dfeffc_1x400.png) repeat-x scroll 50% 50% !important;
      border: 1px solid #6C0;
      border-width: 1px 0;
    }

    .ui-layout-toggler {
      background: #FF9900 repeat-x scroll 50% 50% !important;
    }


    h2 {
      background-color: #cccccc;
      padding: 0px;
      font-size: 18px;
      font-family: "黑体";
    }

    ul {
      margin: 1px;
    }


    #tab_menu {
      padding: 0px;
      width: 99%;
      overflow: hidden;
    }

    #page {
      width: calc(100% - 15px);
      height: calc(100% - 50px);
      margin-left: 15px;
    }

    A:link {
      FONT-SIZE: 12px;
      COLOR: #666666;
      TEXT-DECORATION: none
    }

    A:active {
      FONT-SIZE: 12px;
      COLOR: #666666;
      TEXT-DECORATION: none
    }

    A:visited {
      FONT-SIZE: 12px;
      COLOR: #666666;
      TEXT-DECORATION: none
    }

    A:hover {
      FONT-SIZE: 12px;
      COLOR: #f29422;
      TEXT-DECORATION: none
    }

    A.blue:link {
      FONT-SIZE: 12px;
      COLOR: #ffffff;
      TEXT-DECORATION: none
    }

    A.blue:active {
      FONT-SIZE: 12px;
      COLOR: #73a2d6;
      TEXT-DECORATION: none
    }

    A.blue:visited {
      FONT-SIZE: 12px;
      COLOR: #ffffff;
      TEXT-DECORATION: none
    }

    A.blue:hover {
      FONT-SIZE: 12px;
      COLOR: #73a2d6;
      TEXT-DECORATION: underline
    }

    .demoHeaders {
      margin-top: 2em;
    }

    #dialog_link {
      padding: .4em 1em .4em 20px;
      text-decoration: none;
      position: relative;
    }

    #dialog_link span.ui-icon {
      margin: 0 5px 0 0;
      position: absolute;
      left: .2em;
      top: 50%;
      margin-top: -8px;
    }

    ul#icons {
      margin: 0;
      padding: 0;
    }

    ul#icons li {
      margin: 2px;
      position: relative;
      padding: 4px 0;
      cursor: pointer;
      float: left;
      list-style: none;
    }

    ul#icons span.ui-icon {
      float: left;
      margin: 0 4px;
    }

    .oper {
      padding: .4em 1em .4em 20px;
      text-decoration: none;
      position: relative;
    }

    .oper span.ui-icon {
      margin: 0 5px 0 0;
      position: absolute;
      left: .2em;
      top: 50%;
      margin-top: -8px;
    }

    .delBtn {
      float: right;
      color: #89b7d9;
      border: none;
      background: none;
      display: inline-block;
    }
  </style>
	<script type="text/javascript">
    function PopIt() {
        $("a.trigger").trigger('click');
        window.onbeforeunload = UnPopIt;
        return "确定不安全退出?";
    }
    function UnPopIt() { /* nothing to return */ }

    window.onbeforeunload = PopIt;

    $(document).ready(function() {
        $("a[id!=trigger]").click(function() { window.onbeforeunload = UnPopIt; });

        $("a#trigger").fancybox({
            'hideOnContentClick': false,
            'showCloseButton': false
        });
      var name = $(".username")[0].textContent;
      $(".avatar").html(name.trim().substring(1, 0))
    });
  </script>
  <script type="text/javascript">
    $(document).ready(function () {
      // 清除火狐下的input缓存
      $("#hiddentitles").val("");
      var timeTemp = (new Date()).valueOf().toString();
      $.ajax({
        type: "get", data: timeTemp, url: "sr/left.ashx", success: function (data) {
          if (data == "" || data == null) {
            window.onbeforeunload = UnPopIt();
            window.location.href = 'Login.aspx'
          }
          var data2 = "<div>" + data + "</div>";
          let dom = $(data2);
          var domArr = [];
          var len = dom.find("h3 > a").length;
          // 获取一级菜单标题
          for (var i = 0; i < len; i++) {
            var title = dom.find(`h3 > a:eq(${i})`).text();
            domArr[i] = { title: title };
          }
          // 遍历二级菜单的内容
          dom.children("div").each(function (i, n) { // i序号， n节点类型
            var title2 = []; // 二级菜单容器
            $(n)
              .children() // 获取节点的类型
              .each(function (i, n) { // 遍历节点内容
                var title3 = [];
                // 获取该节点的类型，如果又是ul嵌套，则继续循环插入
                var tag = $(n)[0].tagName;
                if (tag === "UL") {
                  $(n)
                    .children()
                    .each(function (i1, n1) {
                      var text1 = $(n1).text();
                      var html1 = $(n1).html();
                      title3.push({ text: text1, el: $.trim(html1) });
                    });
                  title2.push({ text: "", el: title3 });
                } else {
                  // 获取a标签的文字内容
                  var text = $(n).children("a").text();
                  var html = $(n).html();
                  title2.push({ text: text, el: $.trim(html) });
                }
              });
            domArr[i].title2 = title2;
          });
          var navTitle = `<ul class="list-warpper">`;
          var icons = ["icongonggao", "iconziliao", "iconcangku", "iconjingxiaoshang", "iconqianduan", "icondinghuo", "iconfanli", "iconhuiyi", "icontubiao", "iconkuozhan", "iconlingshou", "iconhuiyuan", "iconyichang", "iconweixin", "iconxiaochengxu", "iconyichang", "icongeren", "iconshezhi"];
          // 根据一级菜单的数量添加icon
          for (var i = 0; i < domArr.length; i++) {
            var div = `<div class="menu-item flex align-center">
                  <span class="icon iconfont ${icons[i]}"></span>
                  <span class="name">${domArr[i].title}</span>
              </div>`;
            navTitle += `<li class="list-item">${div}</li>`;
          }
          // 添加一级菜单的缩放按钮
          navTitle += `</ul><p class="nav-controller"><img class="icon-bottom" src="/images/icon/shouqi_new.png"></p>`;
          $(".nav-bar").html(navTitle);
          change($(".nav-bar").width(), 0);
          // 二级菜单渲染
          $(`.list-warpper > .list-item`).click(function () {
            // 获取当前点击的一级菜单的序号，并动态增删样式
            var index = $(".list-warpper >.list-item").index(this);
            $(".list-warpper >.list-item").removeClass("list-act");
            $(`.list-warpper >.list-item:eq(${index})`).addClass("list-act");
            // 检查二级导航是否有展开，并动态对其进行样式的定义
            var bool = $(".menu")
              .attr("class")
              .match(/menu-closed/);
            var cla = bool === null ? "" : "menu-closed";
            var div = `<div class="menu-wrapper ${cla}">
                      <div class="wrapper-inner">
                      <h2 class="menu-title">${domArr[index].title}</h2>
                      <div class="menu-list">
                      `;
            // 获取二级菜单的标题
            var items = domArr[index].title2;
            for (var i = 0; i < items.length; i++) {
              // 判断当前节点是否是多级菜单
              if (typeof items[i].el === "object") {
                div += `<div class="list-item" data-title="${items[i-1].text}-c"><ul class="list-level3">`;
                for (var j = 0; j < items[i].el.length; j++) {
                  if(items[i].el[j].el.slice(0, 4) === "<li>") {
                    div += items[i].el[j].el;
                  } else {
                    div += `<li>${items[i].el[j].el}</li>`;
                  }
                }
                div += `</ul></div>`;
              } else {
                div += `<div class="list-item" data-title="${items[i].text}">${items[i].el}</div>`;
              }
            }
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            // **************测试王老吉后台****************
            div += `<div class='list-item'><a href='#' onclick='addTab("王老吉-活动列表", "/wanglaoji/W_ProductActivity.aspx")'>王老吉-活动列表</a></div>`
            div += `<div class='list-item'><a href='#' onclick='addTab("王老吉-拼团订单", "/wanglaoji/W_GroupOrderList.aspx")'>王老吉-拼团订单</a></div>`
            div += `<div class='list-item'><a href='#' onclick='addTab("申请审核情况", "/APITester/applicationReview.aspx")'>申请审核情况</a></div>`
            div += `<div class='list-item'><a href='#' onclick='addTab("所有列表", "/APITester/getApplyLog.aspx")'>所有列表</a></div>`
            div += `</div></div></div>`;
            // 当遍历完成后，添加按钮并渲染
            $(".open-btn").removeClass("hidden-side");

            if ($(".menu .menu-wrapper").html() === null) {
              $(".menu").prepend(div);
              $(".menu").removeClass("menu-closed");
              $(".menu-wrapper").removeClass("menu-closed");
              $(".open-btn").addClass("opened");
            } 
            else {
              $(".menu .menu-wrapper").remove();
              $(".menu").prepend(div);
              $(".menu").removeClass("menu-closed");
              $(".menu-wrapper").removeClass("menu-closed");
              $(".open-btn").addClass("opened");
            }
            
            // 对相应节点进行隐藏
            hideSecond([]);
            // 图片的扩展事件
            $("#imgData").toggle(
              function () {
                $(this).attr("src", "/images/open.gif");

                // $('#divApplyDetail').html('abcdddd');
                $.ajax({
                  type: "post",
                  url: "index.aspx/ApplyDetailWrite",
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (data) {
                    $("#divApplyDetail").html(data.d);
                    $("#divApplyDetail > ul > ul > li").click(function (event) {
                      stopP(event);
                      var index = $("#divApplyDetail > ul > ul > li").index(this);
                      var fn = $(`#divApplyDetail > ul > ul > li:eq(${index}) a`).attr("onclick").toString().trim()
                      if(fn.length > 48 && fn.slice(-5,-2) !== "'')") {
                        addToArr(`#divApplyDetail > ul > ul > li:eq(${index})`, fn);
                        try {
                          $(`#divApplyDetail > ul > ul > li:eq(${index}) a`).attr("onclick")();
                        } catch(error) {
                          console.error(error);
                        }
                      }
                    })
                  },
                  beforeSend: function () {
                    $("#divApplyDetail").html("加载中.....");
                  },
                });

                // var tr = $(this).parent().parent(); //获取所在的单行
                // var rowIndex = $('tr').index(tr);
                // var id = $(this).attr("alt");
                //  tr.after("<tr><td colspan='17'><div id='divData" + rowIndex + "'></div></td></tr>");
                //  $('#divData' + rowIndex).load("/sr/QueryMember.ashx?id=" + id + "&Roles=" + $("#HFRoles").val() + "&time=" + (new Date()).valueOf().toString());
              }, //展开事件
              function () {
                $(this).attr("src", "/images/closed.gif");
                $("#divApplyDetail").html("");
                // var tr = $(this).parent().parent(); //获取所在的单行
                // var rowIndex = $('tr').index(tr);
                // $('tr').eq(rowIndex + 1).remove();
              } //关闭事件
            );

            change($(".nav-bar").width(), 180);
            // 二级菜单切换事件
            $(".menu-list > .list-item").click(function () {
              var index = $(".menu-list > .list-item").index(this);
              try {
                var fn = $(`.menu-list > .list-item:eq(${index}) a`).attr("onclick").toString().trim()
              } catch(err) {
                console.error(err);
              }
              if(fn.length > 48 && fn.slice(-5,-2) !== "'')") {
                addToArr(`.menu-list > .list-item:eq(${index})`, fn)
                try {
                  $(`.menu-list > .list-item:eq(${index}) a`).attr("onclick")();
                } catch(error) {
                  console.error(error);
                }
              }
            });
            $(`.menu-list > .list-item > a`).click(function (event) {
              stopP(event);
              var index = $(`.menu-list > .list-item > a`).index(this);
              var fn = $(`.menu-list > .list-item > a:eq(${index})`).attr("onclick").toString().trim()
              if(fn.length > 48 && fn.slice(-5,-2) !== "'')") {
                addToArr(`.menu-list > .list-item > a:eq(${index})`, fn)
                try{
                  $(`.menu-list > .list-item > a:eq(${index})`).attr("onclick")();
                } catch(error) {
                  console.error(error);
                }
              }
            });
            $(`.list-level3 li`).click(function (event) {
              stopP(event);
              var index = $(".list-level3 li").index(this);
              try {
                var fn = $(`.list-level3 li:eq(${index}) a`).attr("onclick").toString().trim()
              } catch(err) {
                console.error(err)
              }
              if(fn.length > 48 && fn.slice(-5,-2) !== "'')") {
                addToArr(`.list-level3 li:eq(${index})`, fn);
                try{
                  $(`.list-level3 li:eq(${index}) a`).attr(
                    "onclick"
                  )();
                } catch(error) {
                  console.error(error);
                }
              }
            });
            $(`.list-level3 li > a`).click(function (event) {
              stopP(event);
              var index = $(".list-level3 li > a").index(this);
              try {
                var fn = $(`.list-level3 li > a:eq(${index})`).attr("onclick").toString().trim()
              } catch(err) {
                console.error(err)
              }
              if(fn.length > 48 && fn.slice(-5,-2) !== "'')") {
                addToArr(`.list-level3 li > a:eq(${index})`, fn);
                try{
                  $(`.list-level3 li > a:eq(${index})`).attr(
                    "onclick"
                  )();
                } catch(error) {
                  console.error(error);
                }
              }
            });
          });
          // 阻止冒泡事件
          $(".nav-bar > *:not(.nav-controller)").click(function (event) {
            stopP(event);
          });
          // 添加一级标题点击缩放事件
          $(".nav-bar").click(function () {
            $(".nav-bar").toggleClass("active");
            $(".iconfont").toggleClass("big");
            var width1 = $(this).width() === 50 ? 180 : 50;
            var width2 = $(".container > .menu").width();
            change(width1, width2);
          });

          // 增加删除的事件
          function hideSecond(arr) {
            if(arr.length > 0) {
              for(var i = 0; i < arr.length; i++) {
                $(`[data-title^='${arr[i]}']`).hide();
              }
            }
          }
        }
      });

      // 二级菜单缩放
      $(".open-btn").click(function () {
        $(".menu").toggleClass("menu-closed");
        $(".menu .menu-wrapper").toggleClass("menu-closed");
        $(this).toggleClass("opened");
        var width2 = $(".menu").width() === 0 ? 180 : 0;
        var width1 = $(".nav-bar").width();
        change(width1, width2);
      });
    });

    function change(nav, menu) {
      $("#tab_menu").css("width", `${document.body.clientWidth - nav - menu - 15}px`);
    }
    window.onresize = function () {
      change($(".nav-bar").width(), $(".menu").width());
    }

    // 阻止冒泡行为
    function stopP(e) {
      //如果提供了事件对象，则这是一个非IE浏览器 
      if ( e && e.stopPropagation ) 
        //因此它支持W3C的stopPropagation()方法 
        e.stopPropagation(); 
      else {
        //否则，我们需要使用IE的方式来取消事件冒泡 
        window.event.cancelBubble = true; 
      }
    }

    function jump() {
      var type = confirm('确定要退出吗？');
      type && (location.href = 'logout.aspx');
    }

    var tab = null;
    $(function () {
      tab = new TabView({
        containerId: 'tab_menu',
        pageid: 'page',
        cid: 'tab_po',
        position: 'top'
      });
      tab.add({
        id: 'tab1_id_index1',
        title: "欢迎页",
        url: "Main.aspx",
        isClosed: false
      });
    });

    var index = 1;

    function showToggle(type) {
      if (type === 'hidden') {
        $('.cpopover-ul, .cpopover-li .cor').removeClass('show');
      } else {
        $('.cpopover-ul, .cpopover-li .cor').toggleClass('show');
      }
    }

    var scrollLeftWidth = [82];
    var tabs = [{nav: "", menu: ""}];
    function addTab(tabtitle, taburl) {
      if (taburl == "") {
        return false;
      }
      var hiddentitles = document.getElementById("hiddentitles");
      var ishave = hiddentitles.value.indexOf("|" + tabtitle + ",");
      if (ishave == -1) {
        var id = "tab5_id_index" + (index + 12);
        var name = tabtitle;
        var url = taburl;
        var close = "1";
        tab.add({
          id: id,
          title: name == "" ? "标签页面" + (index + 1) : name,
          url: url == "" ? "tabs/tab" + ((index % 3) + 1) + ".html" : url,
          isClosed: close == "1" ? true : false,
        });
        index++;
        hiddentitles.value = hiddentitles.value + id + "|" + tabtitle + ",";
        scrollLeftWidth.push(scrollLeftWidth[index - 2] + $(`#${id}`).outerWidth() + 5)
        $(".benma_ui_tab").scrollLeft(($(".benma_ui_tab")[0].scrollWidth));
        if($(".benma_ui_tab")[0].scrollWidth > $(".benma_ui_tab").width()) {
          $(".benma_ui_tab").css("overflow-x", "scroll");
        }
        
        document.getElementById("page").style.visibility = "hidden";
        // 动态传递样式
        $(`#page_${id}`).load(function () {
          var cssLink = document.createElement("link");
          cssLink.href = "/css/iframe_new.css?v=4"; 
          cssLink.rel = "stylesheet";
          cssLink.type = "text/css";
          frames["page_" + id].contentWindow.document.getElementsByTagName("head")[0].append(cssLink);
          if (!frames["page_" + id].contentWindow.jQuery) {
            var jsLink0 = document.createElement("script");
            jsLink0.src = "/d/js/jquery/1.4.2/jquery.min.js";
            jsLink0.type = "text/javascript";
            frames["page_" + id].contentWindow.document.getElementsByTagName("head")[0].append(jsLink0);
          }
          var jsLink = document.createElement("script");
          jsLink.src = "/d/js/iframeJs_new.js?v=1";
          jsLink.type = "text/javascript";
          frames["page_" + id].contentWindow.document.getElementsByTagName("head")[0].append(jsLink);
          setTimeout(function () {
            document.getElementById("page").style.visibility = "visible";
          }, 500); 
        })
      } else {
        ishave++;
        var idstr = hiddentitles.value.substring(1, ishave - 1);
        var last = idstr.lastIndexOf(",");
        if (last == -1) {
          var idstr = hiddentitles.value.substring(last + 1, ishave - 1);
        } else {
          var idstr = hiddentitles.value.substring(last + 2, ishave - 1);
        }
        var index2 = idstr.substring(13);
        $(".benma_ui_tab").scrollLeft(scrollLeftWidth[index2 - 12] - $(".benma_ui_tab").outerWidth());
        tab.activate(idstr);
      }
    }

    function addToArr(menu, func) {
      var nav = `.list-item:eq(${$('.list-act').index()})`;
      var length = tabs.length;
      for(var i = 1; i < length; i++) {
        if (
          i < length && 
          tabs[i]["fn"] === func
        ) {
          return;
        }
      }
      tabs.push({nav: nav, menu: menu, fn: func});
    }
    
    function writeTime() {
      var d = new Date();
      $("#myTime").html(d.getHours() + '时' + d.getMinutes() + '分' + d.getSeconds() + '秒');
    }

    function getimg(url) {
      // 创建对象
      var img = new Image();
      // 改变图片的src
      img.src = url;

      // 加载完成执行
      img.onload = function () {
        $.fn.nyroModalManual({
          url: url,
          type: 'image',
          minWidth: img.width,
          minHeight: img.height,
        });
        return false;
      }
    }

    function getIframe(url) {
      $.fn.nyroModalManual({
        url: url,
        type: 'image',
        endShowContent: function (elts, settings) {
          $('#nyroModalIframe').load(function () {
            var el = document.getElementById('nyroModalIframe').contentWindow.document;
            $(el).find('img').each(function () {
              $(this).css({
                'max-width': '100%',
                height: 'auto'
              })
            })
          })

        },
      });
      return false;
    }

    function SMSiframe(url) {
      $.fn.nyroModalManual({
        url: url,
        type: 'iframe',
        width: 745,
        height: 560,
        minWidth: 745,
        minHeight: 560,
        resizable: true,
        autoSizable: true,
        titleFromIframe: true,
        modal: true
      });
      return false;
    }

    function GetQuery(mythis, oper, param1, param2, param3, param4, param5) {
      stopP(mythis);
      $(mythis).html('查询中..');
      setTimeout(function () {
        var timeTemp = (new Date()).valueOf().toString();
        $.ajax({
          type: "get",
          data: {
            oper: oper,
            param1: param1,
            param2: param2,
            param3: param3,
            param4: param4,
            param5: param5,
            timeTemp: timeTemp
          },
          url: "sr/GetQueryCount.ashx",
          beforeSend: function () {
          },
          success: function (data) {
            $(mythis).html(data);
          }
        });
      }, 500);
    }
  </script>
</head>
<body>
  <div class="head flex space-between">
    <div class="logo-wrapper">
      <img class="logo" src="/images/logo1_new.png?v=20" alt="" />
      <span class="logo-name">社交新零售系统</span>
    </div>
    <div class="info-wrapper">
      <asp:Label ID="Lblversion" runat="server" Text="" ForeColor="#99FF00"></asp:Label>
      <div class="" tabindex="1" style="outline: 0;" onblur="showToggle('hidden')" hidefocus="true">
        <ul class="cpopover">
          <li class="cpopover-li">
            <div class="cor"></div>
            <ul class="cpopover-ul">
              <li class="cpopover-li2">
                <div class="item popover-link" onclick="">
                  <div class="avatar"></div>
                  <span class="username">
                    <asp:Label ID="txtName" runat="server" Font-Bold="True"></asp:Label>
                  </span>
                </div>
              </li>
              <li class="cpopover-li2" onclick="jump()">
                <a class="popover-link" style="color: #4a4a4a;">安全退出</a>
              </li>
            </ul>
            <div class="avatar" onclick="showToggle()"></div>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div id="someContainer" class="container flex">
    <div id="accordion" class="nav-bar active">
      < <h3>加载中.....</h3>
    </div>
    <div class="menu menu-closed">
      <div class="open-btn  hidden-side">
        <img class="icon-side" src="/images/icon/shouqi-black_new.png" alt="" srcset="">
      </div>
    </div>
    <div class="ui-layout-center flex-item">
      <div id="tab_menu"></div>
      <div class="divider"></div>
      <div id="page"></div>
      <input type="hidden" id="hiddentitles" name="hiddentitles" value=""/>
    </div>
  </div>
  </div>
  <div class="ui-layout-south" style="display: none;">
    登录时间：<asp:Label ID="txtTime" runat="server" ></asp:Label>
  </div>
  <div class="ui-layout-center" style="display: none;">
    <asp:Panel ID="PanelPhone" runat="server">
      <asp:Label ID="LbluserID" runat="server"></asp:Label>
      <asp:Label ID="LblLine" runat="server"></asp:Label>
      <select id="SelLineNo" runat="server">
        <option></option>
      </select>
      <!-- ui-dialog -->
      坐席号：
      <select id="selInChn" runat="server">
        <option></option>
      </select>  
    </asp:Panel>
    <div runat="server" id="divNoReadQty" style="display: inline-block; cursor: pointer;"
      onclick="addTab('代理消息-未', 'CustomerMessage/CustomerMessageList.aspx?IsReadReceive=0')">
      <span class="ui-icon ui-icon-mail-closed" style="display: inline-block; line-height: 20px; height: 14px;"></span>
      <span style="font-size: 10px; line-height: 20px; height: 20px; color: red;">
        <asp:Label ID="LblNoReadQty" runat="server" Text="0"></asp:Label>
      </span>
    </div>
  </div>
</body>
</html> 
