/**
 * TabView 配置参数
 *
 * @return
 */
var TabOption = function () {};
/**
 * TabView 配置参数
 */
TabOption.prototype = {
  containerId: "", // 容器ID,
  pageid: "", // pageId 页面 pageID
  cid: "", // 指定tab的id
  position: top,
  // tab位置，可为top和bottom，默认为top
  action: function (e, p) {},
};
/**
 * Tab Item 配置参数
 *
 * @return
 */
var TabItemOption = function () {};
/**
 * Tab Item 配置参数
 */
TabItemOption.prototype = {
  id: "tab_", // tabId
  title: "", // tab标题
  url: "", // 该tab链接的URL
  isClosed: true,
  // 该tab是否可以关闭
};
function showItem(arg) {
  alert($(arg).html());
}
/**
 * @param {}
 *            option option 可选参数 containerId tab 容器ID pageid pageId 页面 pageID
 *            cid cid tab ID
 */
function TabView(option) {
  var tab_context = {
    current: null,
    current_index: 0,
    current_page: null,
  };
  var op = new TabOption();
  $.extend(op, option);
  var bottom = op.position == "bottom" ? "_bottom" : "";
  this.id = op.cid;
  this.pid = op.pageid;
  this.tabs = null;
  this.tabContainer = null;
  var tabTemplate =
    '<table class="tab_item"  id="{0}" border="0" cellpadding="0" cellspacing="0"><tr>' +
    '<td class="tab_item1"></td>' +
    '<td class="tab_item2 tab_title">{1}</td>' +
    '<td class="tab_item2"><div class="tab_close"></div></td>' +
    '<td class="tab_item3"></td>' +
    "</tr></table>";

  var tabContainerTemplate =
    '<div class="benma_ui_tab" id="{0}"><div class="tab_hr"></div></div>';
  var page =
    '<iframe id="{0}" frameborder="0" width="100%" height="100%" src="{1}"></iframe>';
  if (op.position == "bottom") {
    tabTemplate =
      '<table class="tab_item_bottom"  id="{0}" border="0" cellpadding="0" cellspacing="0"><tr>' +
      '<td class="tab_item1_bottom"></td>' +
      '<td class="tab_item2_bottom tab_title">{1}</td>' +
      '<td class="tab_item2_bottom"><div class="tab_close tab_close_bottom"></div></td>' +
      '<td class="tab_item3_bottom"></td>' +
      "</tr></table>";
    tabContainerTemplate =
      '<div class="benma_ui_tab benma_ui_tab_bottom" id="{0}"><div class="tab_hr tab_hr_bottom"></div></div>';
  }
  $("#" + op.containerId).append(tabContainerTemplate.replace("{0}", this.id));
  function initTab(el) {
    var theTab = $(el);
    var tab_item1 = $(theTab).find(".tab_item1" + bottom);
    var tab_item2 = $(theTab).find(".tab_item2" + bottom);
    var tab_item3 = $(theTab).find(".tab_item3" + bottom);
    if (tab_context.current == null || tab_context.current != this) {
      $(theTab)
        .mouseover(function () {
          tab_item1.addClass("tab_item1_mouseover" + bottom);
          tab_item2.addClass("tab_item2_mouseover" + bottom);
          tab_item3.addClass("tab_item3_mouseover" + bottom);
        })
        .mouseout(function () {
          tab_item1.removeClass("tab_item1_mouseover" + bottom);
          tab_item2.removeClass("tab_item2_mouseover" + bottom);
          tab_item3.removeClass("tab_item3_mouseover" + bottom);
        })
        .click(function () {
          if (tab_context.current != null) {
            $(tab_context.current)
              .find(".tab_item1" + bottom)
              .removeClass("tab_item1_selected" + bottom);
            $(tab_context.current)
              .find(".tab_item2" + bottom)
              .removeClass("tab_item2_selected" + bottom);
            $(tab_context.current)
              .find(".tab_item3" + bottom)
              .removeClass("tab_item3_selected" + bottom);
            $(tab_context.current)
              .find(".tab_close")
              .addClass("tab_close_noselected");
          }
          tab_item1.addClass("tab_item1_selected" + bottom);
          tab_item2.addClass("tab_item2_selected" + bottom);
          tab_item3.addClass("tab_item3_selected" + bottom);
          tab_context.current = this;
          // 获取当前点击的是第几个
          var tabIndex = $(tab_context.current).attr("id").slice(13) - 12;
          // 当不是欢迎页时执行
          if (tabIndex > 0) {
            if (tabs[tabIndex] !== undefined) {
              // 清楚掉其他的样式，给当前标签栏添加样式并触发一次点击事件
              if ($(".list-act").index() !== +tabs[tabIndex].nav.slice(14, -1)) {
                $(".list-warpper >.list-item").removeClass("list-act");
                $(tabs[tabIndex].nav).addClass("list-act");
                $(tabs[tabIndex].nav).click();
              }
              // 刷新二级导航
              $(`.menu-list *`).removeClass("two-active two-active-a");
              if (tabs[tabIndex].menu.indexOf("a:eq") !== -1) {
                $(tabs[tabIndex].menu).parent().addClass("two-active");
                $(tabs[tabIndex].menu).addClass("two-active-a");
              } else {
                if (tabs[tabIndex].menu.indexOf("#divApplyDetail") !== -1 && $("#imgData").attr("src") === "/images/closed.gif") {
                  $("#imgData").click();
                }
                $(tabs[tabIndex].menu).addClass("two-active");
                $(tabs[tabIndex].menu).children("a:eq(0)").addClass("two-active-a");
              }
            }
          } else {
            $(`.menu-list *`).removeClass("two-active two-active-a");
          }

          $(tab_context.current)
            .find(".tab_close")
            .removeClass("tab_close_noselected");
          activate($(this).attr("id"), false);
        });
      var tab_close = $(theTab)
        .find(".tab_close")
        .mouseover(function () {
          $(this).addClass("tab_close_mouseover");
        })
        .mouseout(function () {
          $(this).removeClass("tab_close_mouseover");
        })
        .click(function () {
          // 关闭并清除此处的数据
          var index = theTab.attr("id").slice(13) - 12;
          tabs[index] = { nav: "", menu: "" };
          close(theTab.attr("id"));
        });
    }
  }

  function activate(id, isAdd) {
    if (isAdd) {
      $("#" + id).trigger("click");
    }
    if (tab_context.current_page) {
      tab_context.current_page.hide();
    }
    tab_context.current_page = $("#page_" + id);
    tab_context.current_page.show();
    op.action($("#" + id), tab_context.current_page);
  }
  function close(id) {
    var close_page = $("#page_" + id);
    var close_tab = $("#" + id);
    if ($(tab_context.current).attr("id") == close_tab.attr("id")) {
      var next = close_tab.next();
      if (next.attr("id")) {
        activate(next.attr("id"), true);
      } else {
        var pre = close_tab.prev();
        if (pre.attr("id")) {
          activate(pre.attr("id"), true);
        }
      }
    } else {
    }
    //-------------------------------------------
    var isexistval = $("#hiddentitles").val();
    var newisexitval = "";
    var tempthis = "";
    isexistval = isexistval.split(",");
    $(isexistval).each(function () {
      tempthis = this;
      //alert(tempthis);
      if (tempthis != "") {
        var tempindex = tempthis.indexOf(id);
        if (tempindex == -1) {
          newisexitval = newisexitval + tempthis + ",";
        }
      }
    });
    $("#hiddentitles").val(newisexitval);
    //-----------------------------------------
    close_page.find("iframe").remove();
    close_page.remove();
    close_tab.remove();
    if ($(".benma_ui_tab")[0].scrollWidth <= $(".benma_ui_tab").width()) {
      $(".benma_ui_tab").css("overflow-x", "hidden");
    }
  }
  //增加鼠标右键功能

  this.init = function () {
    this.tabContainer = $("#" + this.id);
    //alert(this.id);
    this.tabs = this.tabContainer.find(".tab_item" + bottom);
    this.tabs.each(function () {
      initTab(this);
      console.log("each");
    });
  };
  this.add = function (option) {
    var op1 = new TabItemOption();
    $.extend(op1, option);

    if (op1.title.length < 4) {
      op1.title = "&nbsp;&nbsp;" + op1.title + "&nbsp;";
    }
    var pageHtml = page
      .replace("{0}", "page_" + op1.id)
      .replace("{1}", op1.url);
    $("#" + this.pid).append(pageHtml);
    var html = tabTemplate.replace("{0}", op1.id).replace("{1}", op1.title);
    //alert(html);
    this.tabContainer.append(html);
    //alert($("#" + this.id).html());
    initTab($("#" + op1.id));
    if (!op1.isClosed) {
      $($("#" + op1.id))
        .find(".tab_close")
        .hide();
    }
    // this.init();
    this.activate(op1.id);
  };
  this.update = function (option) {
    var id = option.id;
    // alert(option.url);
    $("#" + id)
      .find(".tab_title")
      .html(option.title);
    $("#" + id).trigger("click");
    // $("#page_" + id).find("iframe").attr("src", option.url);
    $("#page_" + id).attr("src", option.url);
    // document.getElementById()
  };
  this.activate = function (id) {
    //$("#" + id).trigger("click");
    // activate(id, true);
    $("#" + id).trigger("click");
  };
  this.close = function (id) {
    close(id);
  };
  this.init();
}
