$(document).ready(function () {
  // 替换title 和 nav的位置
  var title = $(".ui-jqgrid-titlebar");
  if (title.length) {
    $(".ui-jqgrid-titlebar").remove();
    $("body").prepend(title);
  }

  // 将按钮切换成点击显示更多的模式
  var btns = $(".fg-buttonset").children();
  function btnShow() {
    if (btns.length > 3) {
      $(".fg-buttonset > *").addClass("btnsHidden");
      for (var i = 0; i < 3; i++) {
        $(".fg-buttonset > *:eq(" + i + ")").removeClass("btnsHidden");
      }
      if ($("#showMore").index() === -1) {
        $(".fg-buttonset").append(
          '<button id="showMore">点击查看更多</button>'
        );
      } else {
        $("#showMore").removeClass("btnsHidden");
      }
    }
  }

  function btnHidden() {
    if (btns.length > 3) {
      $(".fg-buttonset > *").removeClass("btnsHidden");
      $("#showMore").addClass("btnsHidden");
      if ($("#showLess").index() === -1) {
        $(".fg-buttonset").append('<button id="showLess">点击收起</button>');
      } else {
        $("#showLess").removeClass("btnsHidden");
      }
    }
  }

  btnHidden();

  if ($.fn.live) {
    $("#showMore").live("click", function () {
      btnHidden();
    });
    $("#showLess").live("click", function () {
      $("#showMore").removeClass("btnsHidden");
      $("#showLess").addClass("btnsHidden");
      btnShow();
    });
  } else {
    $("#showMore").on("click", function () {
      btnHidden();
    });
    $("#showLess").on("click", function () {
      $("#showMore").removeClass("btnsHidden");
      $("#showLess").addClass("btnsHidden");
      btnShow();
    });
  }

  if ($(".templeinput img").length > 0) {
    $(".templeinput > label > img").attr("src", "/icons/input-img_new.png");
  }
});
