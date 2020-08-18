<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaobaoFake.aspx.cs" Inherits="Web.TaobaoFake" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>淘宝黑名单管理</title>
    <style type="text/css">
        input.text
        {
            margin-bottom: 12px;
            width: 95%;
            padding: .4em;
        }

        fieldset
        {
            padding: 0;
            border: 0;
            margin-top: 25px;
            height: 200px;
        }

        h1
        {
            font-size: 1.2em;
            margin: .6em 0;
        }

        .ui-button
        {
            outline: 0;
            margin: 0;
            padding: .4em 1em .5em;
            text-decoration: none;
            !important;
            cursor: pointer;
            position: relative;
            text-align: center;
        }

        .ui-dialog .ui-state-highlight, .ui-dialog .ui-state-error
        {
            padding: .3em;
        }
    </style>
    <link type="text/css" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqueryui/1.8.12/themes/redmond/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="screen" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqgrid/3.8/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" href="/css/my.css" />
    <link rel="stylesheet" type="text/css" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqgrid/3.8/ui.multiselect.css" />
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqueryui/1.8.12/jquery-ui.min.js"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/i18n/grid.locale-cn.js"" type="text/javascript"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/i18n/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqgrid/3.8/ui.multiselect.js" type="text/javascript"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery-layout/1.2.0/jquery.layout.min.js" type="text/javascript"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/MTImgLib.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            compressImg('upHeadData', 'showHeadData', 720, function (src) {
                var id = jQuery("#navgrid").getGridParam('selrow');
                $.ajax(
                {
                    data: '{ "ID":' + id + ',"ImageData":"' + src + '" }',
                    type: "post",
                    url: "TaobaoFake.aspx/SetImage",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d.Success) {
                            jQuery("#navgrid").jqGrid('setRowData', id, { ImageUrl: data.d.Message });
                        }
                        else {
                            alert(data.d.Message);
                        }

                    }
                    , error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("出错，请联系管理员");
                        alert(XMLHttpRequest.status);
                    }
                });
            });
        });
    </script>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5">
    <div class="fg-toolbar ui-widget-header">
        <div class="fg-buttonset">
            <button id="reload" class="fg-button ui-state-default fg-button-icon-left ui-priority-primary ui-corner-right"><span class="ui-icon ui-icon-refresh"></span>重载</button>
            <button runat="server" id="add" class="fg-button ui-state-default fg-button-icon-left ui-priority-primary ui-corner-right"><span class="ui-icon ui-icon-plus"></span>新增</button>
            <button runat="server" id="edit" class="fg-button ui-state-default fg-button-icon-left ui-priority-primary ui-corner-right"><span class="ui-icon ui-icon-pencil"></span>修改</button>
            <button runat="server" id="del" class="fg-button ui-state-default fg-button-icon-left ui-priority-primary ui-corner-right"><span class="ui-icon ui-icon-trash"></span>删除</button>
            <button id="find" class="fg-button ui-state-default fg-button-icon-left ui-priority-primary ui-corner-right"><span class="ui-icon ui-icon-search"></span>查找</button>
            <button runat="server" id="update" class="fg-button ui-state-default fg-button-icon-left ui-priority-primary ui-corner-right"><span class="ui-icon ui-icon-arrowstop-1-n"></span>图片上传</button><span>不能大于200K</span>
            <div class="mt-flex-row " id="uploaderInput">
                <div class="templeinput">
                    <label for="temple">
                        <input name="upHeadData" id="upHeadData" type="file" accept="image/*" capture="camera" style="display: none">
                        <img id="showHeadData" style="display: none" />
                    </label>
                </div>
            </div>
            </div>
        </div>
        <div id="fileQueue"></div>
        <table id="navgrid" class="scroll" cellpadding="0" cellspacing="0"></table>
        <div id="pagernav" class="scroll" style="text-align: center;"></div>
        <script type="text/javascript">
            $(function () {

                $(".fg-button:not(.ui-state-disabled)")
                .hover(
                    function () {
                        $(this).addClass("ui-state-hover");
                    },
                    function () {
                        $(this).removeClass("ui-state-hover");
                    }
                )
                .mousedown(function () {
                    $(this).parents('.fg-buttonset-single:first').find(".fg-button.ui-state-active").removeClass("ui-state-active");
                    if ($(this).is('.ui-state-active.fg-button-toggleable, .fg-buttonset-multi .ui-state-active')) { $(this).removeClass("ui-state-active"); }
                    else { $(this).addClass("ui-state-active"); }
                })
                .mouseup(function () {
                    if (!$(this).is('.fg-button-toggleable, .fg-buttonset-single .fg-button,  .fg-buttonset-multi .fg-button')) {
                        $(this).removeClass("ui-state-active");
                    }
                });
            });

            jQuery("#navgrid").jqGrid({
                url: '/sr/TaobaoFake.ashx',
                datatype: "xml",
                colNames: ['id', '淘宝店名称', '淘宝掌柜名称', '淘宝地址', '图片', '微信账号', '微信名称', '录入时间', '最后修改时间'],
                colModel: [
                { name: 'id', index: 'id', width: 1, hidden: true, key: true, search: false },
                { name: 'Name', index: 'Name', align: 'center', width: 90, editable: true, editoptions: { size: 20, maxlength: 100 }, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] }, formoptions: { elmprefix: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" } },
                { name: 'Manager', index: 'Manager', align: 'center', width: 100, editable: true, editoptions: { size: 20, maxlength: 100 }, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] }, formoptions: { elmprefix: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" } },
                { name: 'Url', index: 'Url', align: 'left', width: 200, editable: true, editoptions: { size: 50, maxlength: 500 }, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] }, formoptions: { elmprefix: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" } },
                { name: 'ImageUrl', index: 'ImageUrl', width: 100, align: 'left', formatter: checkboxFormatter },

                { name: 'WechatUserName', index: 'WechatUserName', align: 'center', width: 90, editable: true, editoptions: { size: 20, maxlength: 100 }, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] }, formoptions: { elmprefix: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", elmsuffix: "（代理申请如在黑名单中不能这申请）" } },
                { name: 'WechatName', index: 'WechatName', align: 'center', width: 90, editable: true, editoptions: { size: 20, maxlength: 100 }, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] }, formoptions: { elmprefix: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" } },
                { name: 'CreateTime', index: 'CreateTime', align: 'center', width: 150, editable: false, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] } },
                { name: 'UpdateTime', index: 'UpdateTime', align: 'center', width: 150, editable: false, searchoptions: { sopt: ['eq', 'ne', 'lt', 'le', 'gt', 'bw', 'ew', 'cn'] } }
                ],
                rowNum: 15,
                rowList: [15, 30, 50],
                rownumbers: true,
                imgpath: 'themes/basic/images',
                pager: '#pagernav',
                viewrecords: true,
                caption: "淘宝黑名单管理",
                hidegrid: false,
                editurl: "/sr/TaobaoFake.ashx",
                height: $(window).height() - 150,
                view: true,
                sortname: 'id',
                sortorder: 'asc',
                ondblClickRow: function (id) { jQuery("#navgrid").viewGridRow(id, { reloadAfterSubmit: false }); }
            });

            jQuery("#navgrid").jqGrid('navGrid', '#pagernav', { add: false, edit: false, del: false, search: false, refresh: false });
            jQuery("#navgrid").jqGrid('navButtonAdd', '#pagernav', {
                caption: "列重新排序",
                title: "列重新排序",
                onClickButton: function () {
                    jQuery("#navgrid").jqGrid('columnChooser');
                }
            });

            $("#reload").click(function () {
                jQuery("#navgrid").setGridParam(
                        {
                            search: false,
                            page: 1
                        }
                        ).trigger("reloadGrid");
                return false;
            });
            $("#add").click(function () {
                jQuery("#navgrid").editGridRow("new", { modal: true, height: 250, width: 520, errorTextFormat: errorTextFormat });
            });
            $("#edit").click(function () {
                var gr = jQuery("#navgrid").getGridParam('selrow');
                if (gr != null) jQuery("#navgrid").editGridRow(gr, { modal: true, height: 250, width: 520, reloadAfterSubmit: false, errorTextFormat: errorTextFormat, afterShowForm: function (eparams) { $("tr[id='tr_UserName']").hide(); }, onClose: function () { $("tr[id='tr_UserName']").show(); } });
                else alert("请选择行!");
            });
            $("#del").click(function () {
                var gr = jQuery("#navgrid").getGridParam('selrow');
                rowdata = jQuery("#navgrid").getRowData(gr);
                if (gr != null) jQuery("#navgrid").delGridRow(rowdata.id, { delData: { name: rowdata.name } });
                else alert("请选择要删除的行!");
            });
            $("#find").click(function () {
                jQuery("#navgrid").searchGrid({ multipleSearch: true });
            });
            $("#update").click(function () {
                var gr = jQuery("#navgrid").getGridParam('selrow');
                if (gr != null) {
                    upHeadData.click();
                }
                else alert("请选择行!");

            });
            var errorTextFormat = function (data) {
                var str = data.responseText.substr(0, 10);
                if (str === '{"Detail":') {
                    var errorDetail = jQuery.parseJSON(data.responseText);
                    var s = "Error: '";
                    s += data.statusText;
                    s += "'. Details: ";
                    s += errorDetail.Detail;
                    return s;
                } else {
                    var res = "Status: '";
                    res += data.statusText;
                    res += "'. Error code: ";
                    res += data.status;
                    $("tr[id='FormError']").hide();
                    if (data.responseText.substr(0, 4) == "操作成功") {
                        alert(data.responseText);
                        //$("input:not(:last):not(:last)").val('');
                        jQuery("#navgrid").setGridParam().trigger("reloadGrid");
                        return data.responseText;
                    }
                    else {
                        return data.responseText;
                    }
                }
            };

            function checkboxFormatter(el, cval, opts) {
                if (typeof el == "undefined") {
                    return "";
                }
                else {
                    return "<center><img src='" + el + "' width='80px' height='80px' style='cursor:pointer' onclick=parent.getimg('" + el + "') /></center>";
                }

                // debugger;
            }
        </script>
</body>
</html>
