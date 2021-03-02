<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="CustomerOrderList.aspx.cs" Inherits="Web.CustomerOrderList" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link type="text/css" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqueryui/1.8.12/themes/redmond/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jqueryui/1.8.12/jquery-ui.min.js"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.form.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/css/nyroModal.css" type="text/css" media="screen" />
	<script type="text/javascript" src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.nyroModal-1.5.5.pack.js"></script>
    <script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.cookie.js" type="text/javascript"></script>
	<script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery.blockUI.js" type="text/javascript"></script>

	<script src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/vue/2.1.8/vue.min.js"  type="text/javascript"></script>


    <script type="text/javascript">
        function checkFormAll(chk) {
            form = document.getElementById("select_all");
            for (var i = 0; i < form1.elements.length; i++) {
                if (form1.elements[i].type == "checkbox") {
                    form1.elements[i].checked = chk;
                }
            }
        }


        $(function () {
            $("#GridView1").addClass("ui-widget-content");
            $("#GridView1 th").addClass("ui-state-default  ui-th-column");
            $("#GridView1 tr").mouseover(function () { $(this).addClass("ui-state-hover"); }).mouseout(function () { $(this).removeClass("ui-state-hover"); })

           // alert();
            $(".EMSStyle").css('word-break','break-all').css('white-space','normal').css('width','250px');

            function checkFormAll(chk) {
                form = document.getElementById("select_all");
                for (var i = 0; i < form1.elements.length; i++) {
                    if (form1.elements[i].type == "checkbox") {
                        form1.elements[i].checked = chk;
                    }
                }
            }


            $('#BtnRefresh').click(function() {
                $.blockUI({
                    message: '加载中...</BR> <img src="/img/ajaxLoader.gif" border="0"/>',
                    opacity: .2
                });
            });
            $("#DDLOperate").change(function () {
                //alert($("#DDLOperate").val());
                switch ($("#DDLOperate").val()) {
                    case '1':
                        $("#DivFailure").show();
                        $("#DivSuccess").hide();
                        break;
                    case '2':
                        $("#DivFailure").hide();
                        $("#DivSuccess").show();
                        break;
                }
            });

            $("#DDLOperate").val(2);
            $("#DDLOperate").change();

            //$("#txtFailureReason").val('');

            $("#dialogOrderData").dialog({
                bgiframe: true,
                autoOpen: false,
                resizable: true,
                height: 550,
                width: 700,
                modal: true,
                overlay: {
                    backgroundColor: '#000',
                    opacity: 0.5
                },
                buttons: {
                    '关闭': function () {


                        $(this).dialog('close');
                    }
                }
            });

            $("#dialogEMS").dialog({
                bgiframe: true,
                autoOpen: false,
                resizable: true,
                height: 355,
                width: 340,
                modal: true,
                overlay: {
                    backgroundColor: '#000',
                    opacity: 0.5
                },
                buttons: {
                    '提交': function () {


                        $.ajax(
                           {
                               data: '{ "ID": ' + $('#dialogEMSID').val() + ', "EMSCompany":"' +  $("#DDLEMSCompany").val() + '", "EMSCode":"' +$('#dialogEMSCode').val() + '" }',
                               type: "post",
                               url: "CustomerOrderList.aspx/EditEMS",
                               async: false,
                               contentType: "application/json; charset=utf-8",
                               dataType: "json",
                               success: function(data) {
                                   alert(data.d);

                                   if (data.d.indexOf("操作成功") >= 0) {
                                       $("#dialogEMS").dialog('close');
                                       $('#CustomerOrderEditReload').click();
                                   }
                               }
                               ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                                   alert("出错，请联系管理员");
                               }
                           });


                        //$(this).dialog('close');
                    },
                    '关闭': function () {
                        $(this).dialog('close');
                    }

                }
            });



            $("#dialogTargetRemark").dialog({
                bgiframe: true,
                autoOpen: false,
                resizable: true,
                height: 300,
                width: 400,
                modal: true,
                overlay: {
                    backgroundColor: '#000',
                    opacity: 0.5
                },
                buttons: {
                    '提交': function () {

                       // alert( $("#dialogTargetID").val());

                        $.ajax(
                           {
                               data: '{ "ID":' + $("#dialogTargetID").val() + ',"TargetRemark":"'+  $("#dialogtxtTargetRemark").val() +'" }',
                               type: "post",
                               url: "CustomerOrderList.aspx/SetTargetRemark",
                               async: false,
                               contentType: "application/json; charset=utf-8",
                               dataType: "json",
                               success: function(data) {
                                  // alert(data.d);

                                   if (data.d.Success) {
                                       alert("操作成功");
                                       $("#dialogTargetRemark").dialog('close');
                                       $('#CustomerOrderEditReload').click();
                                   }
                                   else {
                                       alert(data.d.Message);
                                   }


                               }
                               ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                                   alert("出错，请联系管理员");
                               }
                           });







                        //$(this).dialog('close');
                    },
                    '关闭': function () {
                        $(this).dialog('close');
                    }

                }
            });

            $("#DivDel").dialog({
                bgiframe: true,
                autoOpen: false,
                resizable: true,
                height: 300,
                width: 400,
                modal: true,
                overlay: {
                    backgroundColor: '#000',
                    opacity: 0.5
                },
                buttons: {
                    '提交': function () {

                        var DelIsAddStock;
                        if ($("#DelIsAddStock").val()=="1") {
                            DelIsAddStock =true;
                        }
                        else
                        {
                            DelIsAddStock =false;
                        }

                        $.ajax(
                           {
                               data: '{ "ID":' + $("#dialogDelID").val() + ',"IsAddStock":'+  DelIsAddStock +',"UserName":"<%=ViewState["UserName"].ToString()%>" ,"TrueName":"<%=ViewState["TrueName"].ToString()%>"}',
                                type: "post",
                                url: "CustomerOrderList.aspx/Del2",
                                async: false,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function(data) {
                                    alert(data.d);
                                    if (data.d.indexOf("操作成功") >= 0) {
                                        $("#DivDel").dialog('close');
                                        $('#CustomerOrderEditReload').click();
                                    }
                                }
                                ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                                    alert("出错，请联系管理员");
                                }
                           });

                    },
                    '关闭': function () {
                        $(this).dialog('close');
                    }

                }
            });



            $("input[name$='txtEMSCode']").keypress(function(event){
                console.log(this.name);
                if(event.keyCode == 13)
                {
                    __doPostBack(this.name.replace("txtEMSCode","Button1"),'');
                    //$("input[name='" +this.name.replace("txtEMSCode","Button1")+"']").click();
                    //  return false;
                }


            });

			            // Bin
            $('.BtnReview').click(function () {
                var id = $(this).attr('data-id')
                console.log(id)
                if (!id) {
                    alert('id不存在，请联系稍后操作或联系管理员')
                }
                $('#ReviewWarehouseDialogIframe').attr('src', '/NewCustomerOrder/ReviewWarehouse/index.aspx?id=' + id)
                $('#ReviewWarehouseDialog').dialog('open');
            })

            $("#ReviewWarehouseDialog").dialog({
                bgiframe: true,
                autoOpen: false,
                resizable: true,
                height: 660,
                width: 920,
                modal: true,
                overlay: {
                    backgroundColor: '#000',
                    opacity: 0.5
                }
            });

            window.addEventListener('message', function (ev) {
                console.log('message', ev)
                if (ev.data == 'close') {
                    console.log('close', ev.data)
                    $('#ReviewWarehouseDialog').dialog('close');
                    $('#BtnRefresh').trigger('click')
                }
            })


            // Bin


        });






        function del(ID) {
            if (confirm('确认要删除,此订货单吗？\n有调货的不能删除\n返利也会自动删除')) {
                $.ajax(
                    {
                        data: '{ "ID":' + ID +',"UserName":"<%=ViewState["UserName"].ToString()%>" ,"TrueName":"<%=ViewState["TrueName"].ToString()%>"}',
                        type: "post",
                        url: "CustomerOrderList.aspx/Del",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            alert(data.d);
                            if (data.d.indexOf("操作成功") >= 0) {
                                $('#CustomerOrderEditReload').click();
                            }
                        }
                        ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错，请联系管理员");
                        }
                    });
            }
        }

        function del2(ID) {
            $("#dialogDelID").val(ID);
            $('#DivDel').dialog('open');
        }

        function Anti(ID) {
            if (confirm('确认要反审核(回滚至未审核),此订货单吗？\n有分批后的不能反审核\n返利也会自动删除(除了拿货返利)')) {
                $.ajax(
                    {
                        data: '{ "ID": ' + ID + ', "OperateUserName":"<%=User.Identity.Name%>" }',
                        type: "post",
                        url: "CustomerOrderList.aspx/Anti",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            alert(data.d);
                            if (data.d.indexOf("操作成功") >= 0) {
                                $('#CustomerOrderEditReload').click();
                            }
                        }
                        ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错，请联系管理员");
                        }
                    });
            }
        }

        function EditEMS(ID,EMSCompany,EMSCode) {

            //alert(ID);

            $('#dialogEMSID').val(ID);
            $('#dialogEMSCode').val(EMSCode);


            $("#DDLEMSCompany").val(EMSCompany);


            $('#dialogEMS').dialog('open');

        }

        function EditTargetRemark(ID) {
            //console.log(ID);
            $('#dialogTargetID').val(ID);




            $.ajax(
            {
                data: '{ "ID":' + ID + ' }',
                type: "post",
                url: "CustomerOrderList.aspx/GetTargetRemark",
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //console.log(data);
                    if (data.d.Success) {
                        $('#dialogTargetRemark').dialog('open');
                        $('#dialogtxtTargetRemark').val(data.d.Message);
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





        }



    </script>

    <script type="text/javascript">
        function Openiframe(url) {
            $.fn.nyroModalManual({
                url: url,
                type: 'iframe',
                width: 800,
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

        function Closeiframe(IsRefresh) {
            $.nyroModalRemove();
            if (IsRefresh)
            {
                $.blockUI({
                    message: '加载中...</BR> <img src="/img/ajaxLoader.gif" border="0"/>',
                    opacity: .2
                });
                $('#CustomerOrderEditReload').click();
            }
            return false;
        }

        function RebateSubmit() {



            var tb = document.getElementById("<%=GridView1.ClientID %>");
    	    var sLine = "";
    	    var sCodes="";
    	    var sCode="";
    	    if (tb) {
    	        var rows = tb.rows;
    	        for (var i = 1; i < rows.length; i++) {

    	            if (rows[i].cells[0].childNodes[0]) {
    	                var cbx = rows[i].cells[0].childNodes[0].nextElementSibling||rows[i].cells[0].childNodes[0].nextSibling;
    	                if (cbx) {
    	                    var list=tb.rows[i].cells[0].getElementsByTagName('input');
    	                    if (list[0].type == 'checkbox' && list[0].checked == true) {
    	                        sCodes +=$(rows[i].cells[1].innerHTML).html()  + ",";
    	                    }
    	                }
    	            }


    	        }
    	    }

    	    if (sCodes=='')
    	    {
    	        alert("操作失败！先选择单再操作");
    	        return false;
    	    }

    	    var SelectedValue =$('#DDLOperate').val();



    	    $('#BtnRebateSubmit').val("提交处理中...");
    	    $('#BtnRebateSubmit').attr("disabled","disabled");



    	    $.ajax(
                   {
                       data: '{ "Codes": "' + sCodes + '", "SelectedValue":' + SelectedValue + ', "UserName":"' + '<%=Context.User.Identity.Name%>'+ '", "FailureReason":"' +$('#txtTargetRemark').val()+'" }',
                       type: "post",
                       url: "CustomerOrderList.aspx/Operate0",
                       async: false,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function(data) {
                           alert(data.d);
                           $('#dialogOrderData').dialog('close');
                           $('#CustomerOrderEditReload').click();
                       }
                        ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错，请联系管理员");
                        }
                   });



        }

        function RebateCalc() {

            var tb = document.getElementById("<%=GridView1.ClientID %>");
    	    var sLine = "";
    	    var sCodes="";
    	    var sCode="";
    	    if (tb) {
    	        var rows = tb.rows;
    	        for (var i = 1; i < rows.length; i++) {
    	            //console.log(rows[i].cells[0]);
    	            if (rows[i].cells[0].childNodes[0]) {
    	                var cbx = rows[i].cells[0].childNodes[0].nextElementSibling||rows[i].cells[0].childNodes[0].nextSibling;
    	                //console.log(cbx);
    	                // console.log('a');
    	                if (cbx) {
    	                    var list=tb.rows[i].cells[0].getElementsByTagName('input');
    	                    if (list[0].type == 'checkbox' && list[0].checked == true) {
    	                        sCodes +=$(rows[i].cells[1].innerHTML).html()  + ",";
    	                    }
    	                }
    	            }
    	        }
    	    }


    	    if (sCodes=='')
    	    {
    	        alert("操作失败！先选择单再操作");
    	        return false;
    	    }

    	    var SelectedValue =$('#DDLOperate').val();
    	    var FailureReason=$('#txtFailureReason').val();


    	    if (SelectedValue==1) {



    	        if (!confirm('确认就否要审核失败？')) {
    	            return false;
    	        }



    	        //异步提交
    	        //提交
    	        $.ajax(
                    {
                        data: '{ "Codes": "' + sCodes + '", "SelectedValue":' + SelectedValue + ', "UserName":"' + '<%=Context.User.Identity.Name%>'+ '", "FailureReason":"' + FailureReason+ '" }',
                        type: "post",
                        url: "CustomerOrderList.aspx/Operate0",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            alert(data.d);
                            $('#CustomerOrderEditReload').click();
                        }
                        ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错，请联系管理员");
                        }
                    });

            }
            else
            {
    	        // $('#BtnRebateSubmit').addClass('ui-state-disabled');
                $('#BtnRebateSubmit').val("计算中不能提交");
                $('#BtnRebateSubmit').attr("disabled","disabled");

                $('#OrderResult').html('');
                var sTmp="";

                var strs= new Array(); //定义一数组
                strs=sCodes.split(","); //字符分割
                var iCount=sCodes.split(",").length-1;
                var iCountTotal=iCount;
                var timer1 =setInterval(function(){
                    if (strs.length>0) {
                        sCode=strs.shift();
                        if (sCode!='') {
                            sTmp +="(" + (iCountTotal-iCount+1) + "/" +iCountTotal+ ")[" + sCode + "]" + "计算中";
                            $('#OrderResult').html(sTmp);
                            //提交
                            $.ajax(
                                    {
                                        data: '{ "Code":"' + sCode + '" }',
                                        type: "post",
                                        url: "CustomerOrderList.aspx/RebateCalc",
                                        async: false,
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function(data) {
                                            sTmp += data.d;
                                            iCount--;

                                            if(data.d.indexOf("错误") > 0 )
                                            {
                                                $('#OrderResult').html(data.d);
                                                alert('有错误请检查后，再操作！');
                                                clearInterval(timer1);
                                                clearInterval(timer2);
                                            }

                                            //alert(sTmp);
                                        }
                                        ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                                            alert("出错，请联系管理员");
                                            alert(XMLHttpRequest.status);
                                            clearInterval(timer1);
                                            clearInterval(timer2);
                                        }
                                    });
                        };
                    }
                    else
                    {
                        clearInterval(timer1);
                    }
                }, 500);


                var timer2 =setInterval(function(){
                    $('#OrderResult').html(sTmp);
                    if (iCount==0) {


                        $('#BtnRebateSubmit').val("提交");
                        $('#BtnRebateSubmit').removeAttr("disabled");
                        clearInterval(timer2);
                    }
                }, 100);


                $('#dialogOrderData').dialog('open');

            }


            return false;
        }


   </script>
   <script>
        function submitform() {
            const word = $("#txtQueryCode").val();
            let isChange = true;
            const arr = word.split("\n");
            const noEmptyArr = arr.filter((item) => item !== '');

            let obj = {};
            for (const item of noEmptyArr) {
                const i = item.split(/\s+/);
                if (i.length < 3) {
                    isChange = false;
                    break;
                }
                if (obj.hasOwnProperty(i[0])) {
                    obj[i[0]].code += ',' + i[2];
                } else {
                    obj[i[0]] = { compeny: i[1] || '', code: i[2] || '' };
                }
            }

            if (isChange) {
                let res = '';
                for (const key in obj) {
                    if (obj.hasOwnProperty(key)) {
                        const val = obj[key];
                        res += `${key}\t${val.compeny}\t${val.code}\n`;
                    }
                }
                console.log(res);
                $("#txtQueryCode").val(res);
            }
            $('#BrnOperate2').val('处理中..').addClass('ui-state-disabled');
        }
    </script>

    <link href="~/CSS/Gridview.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body
        {
            font-family: Arial, sans-serif;
            font-size: 12px;
            margin: 0;
            padding: 0;
        }

        table
        {
            font-size: 12px;
        }

        .style1
        {
            width: 697px;
        }

        .style3
        {
            width: 100%;
        }
        .GridTDStyle
        {
           white-space: normal;
           width: 250px ;
        }

        th,td
        {
            border: 1px solid #dde8f1;
        }

    </style>
        <%
            this.BtnExportEXCEL2.Visible = true;
        %>
</head>
<body>
    <form id="form1" runat="server">
<%--        <input id="CustomerOrderEditReload" type="button" value="button" onclick="alert(11133)" />--%>

        <div>

            <fieldset class="ui-widget ui-widget-content" style="margin: 0px;padding: 0px;width: 1200px">
                <legend>查询条件</legend>
                <table class="style3">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DDLDate" runat="server" ToolTip="注意:调货产生的子单没有审核日期,调货产生首次日期跟下单日期才会不一样">
                                <asp:ListItem>下单日期区间</asp:ListItem>
                                <asp:ListItem>审核日期区间</asp:ListItem>
                                <asp:ListItem>发货日期区间</asp:ListItem>
                                <asp:ListItem>处理日期区间</asp:ListItem>
                                <asp:ListItem>首次日期区间</asp:ListItem>
                            </asp:DropDownList>->从：<asp:TextBox ID="txtfromDate" runat="server" CssClass="Wdate"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd H:mm:ss',isShowWeek:true})" Width="140px"></asp:TextBox>
                            &nbsp;至：<asp:TextBox ID="txttoDate" runat="server" CssClass="Wdate"
                                onfocus="WdatePicker({dateFmt:'yyyy-MM-dd H:mm:ss',isShowWeek:true})" Width="140px"></asp:TextBox>

                            <asp:DropDownList ID="DDLCode" runat="server" >
                                <asp:ListItem>订单号</asp:ListItem>
                                <asp:ListItem>快递号</asp:ListItem>
                            </asp:DropDownList>：
                            <asp:TextBox ID="txtCode" runat="server" Width="180px"></asp:TextBox>
                            授权品牌：<asp:DropDownList ID="DDLBrand" runat="server" ></asp:DropDownList>

                            &nbsp;
                            调货：
                            <asp:DropDownList ID="DDLIsOrderCount" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>是</asp:ListItem>
                                <asp:ListItem>否</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            <div style="display:<%=Getdisplay()%>">
                            仓库：
                            <asp:DropDownList ID="DDLWarehouse" runat="server" title="开启总部多地仓库时，才用上" Enabled="false"></asp:DropDownList>
                             <a id="aOrderTransfer" Visible="false" runat="server" href="#" onclick="parent.addTab('批量转仓', 'NewCustomerOrder/CustomerOrderTransfer.aspx');">进入批量转仓</a>
                            </div>


                        </td>
                    </tr>
                    <tr>
                        <td>
                            收货人：<asp:TextBox ID="txtAddrName" runat="server" Width="60px" ></asp:TextBox>
                            收货手机号：<asp:TextBox ID="txtAddrPhone" runat="server" Width="100px"></asp:TextBox>
                            收货地址：<asp:TextBox ID="txtAddr" runat="server" Width="150px" ></asp:TextBox>
                            &nbsp;授权名：<asp:TextBox ID="txtSourceCustomField1" runat="server" Width="60px"></asp:TextBox>
                            手机号：<asp:TextBox ID="txtSourceCustomField2" runat="server" Width="100px"></asp:TextBox>
                           <%=LTP.Common.ConfigHelper.GetConfigString("CustomerOrderRemark") %>：<asp:TextBox ID="txtRemark" runat="server" Width="150px"></asp:TextBox>



                             <asp:Button ID="CustomerOrderEditReload" runat="server"  Text="重载" OnClick="CustomerOrderEditReload_Click"  style="display:none"  />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Panel Id="PAccountMethod" runat="server" style="display:inline" Visible="false">
                                      结算方式:<asp:DropDownList ID="DDLAccountMethod" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="1" Enabled="false">线下</asp:ListItem>
                                <asp:ListItem Value="3" Enabled="false">扣预存</asp:ListItem>
                                <asp:ListItem Value="5" Enabled="false">扣存货</asp:ListItem>
                                <asp:ListItem Value="7" Enabled="false">扣代理记账</asp:ListItem>
                            </asp:DropDownList>
                             &nbsp;
                            </asp:Panel>

                            <asp:Panel Id="PCurrency" runat="server" style="display:inline" Visible="false">
                                  货币:<asp:DropDownList ID="DDLCurrency" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
                                </asp:DropDownList>
                                 &nbsp;

                            </asp:Panel>

                            产品名称: <asp:TextBox ID="txtProductName" runat="server" Width="100px"></asp:TextBox>
                             &nbsp;
                             收货授权代码: <asp:TextBox ID="txtTopAuthorizationCode" runat="server" Width="80px"></asp:TextBox>
                             &nbsp;
                             订货授权代码: <asp:TextBox ID="txtAuthorizationCode" runat="server" Width="80px"></asp:TextBox>
                             &nbsp;
                            排序：<asp:DropDownList ID="DDLOrder" runat="server">
                                <asp:ListItem>下单日期(降)</asp:ListItem>
                                <asp:ListItem>下单日期(升)</asp:ListItem>
                                <asp:ListItem>处理日期(降)</asp:ListItem>
                                <asp:ListItem>处理日期(升)</asp:ListItem>
                                <asp:ListItem>首次日期(降)</asp:ListItem>
                                <asp:ListItem>首次日期(升)</asp:ListItem>
                            </asp:DropDownList>

                        <asp:Button ID="BtnRefresh" runat="server" OnClick="BtnRefresh_Click" Text="刷新" class="ui-state-default  ui-priority-primary " />
                            <asp:Button ID="BtnExportEXCEL" runat="server" Text="导出EXCEL" class="ui-state-default  ui-priority-primary " OnClick="BtnExportEXCEL_Click" />
                             <asp:Button ID="BtnExportEXCEL2" runat="server" Text="导出2" class="ui-state-default  ui-priority-primary " OnClick="BtnExportEXCEL2_Click" />

                            总行数：<asp:Label ID="LblQty" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>

        </div>




        <table class="style1">
            <tr>
                <td>
                    <div id="container">
                        <div id="divprint">
                            <asp:GridView ID="GridView1" runat="server" Font-Size="12px"
                                Width="697px" AllowPaging="True"
                                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
                                AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                OnRowDataBound="GridView1_RowDataBound">
                                <RowStyle HorizontalAlign="Center" />
                                <PagerStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>
                                    <asp:TemplateField Visible="False">
                                          <HeaderTemplate>
                                            <input id="select_all" onclick="checkFormAll(this.checked)" type="checkbox">
                                          </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField>
                                           <HeaderTemplate>订单号</HeaderTemplate>
                                           <ItemTemplate>
                                               <div><%# Eval("Code")%></div>
                                               <%# Eval("SubOrderCount").ToString()=="0"?"":"<span  title='调货操作生产的标记符' style='color: red;font-size: 16px;cursor:pointer'>调<span style='font-size: 14px;'><sup>"+ Eval("SubOrderCount")+"</sup></span></span>"%>
                                               <%# GetAccountMethod(Convert.ToInt32(Eval("AccountMethod")),""+Eval("CurrencyName"))%>

                                               <%# LTP.Common.ConfigHelper.GetConfigBool("IsMultiWarehouse") & ViewState["Customer_ID"].ToString()=="1" ?"<br />配送仓库[" +GetWarehouse(Eval("Warehouse_ID").ToString())+ "]":""%>

                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="left" />
                                     </asp:TemplateField>
                                     <asp:TemplateField>
                                           <HeaderTemplate>日期</HeaderTemplate>
                                           <ItemTemplate>

                                                <%# Eval("TopWorkDate").ToString()==""?"":"首次:"+ Eval("TopWorkDate") + "<br />"%>
                                               下单:<%# Eval("WorkDate")%><%# Eval("ReviewWorkDate").ToString()==""?"":"<br />审核:"+ Eval("ReviewWorkDate")%><%# Eval("SendWorkDate").ToString()==""?"":"<br />发货:"+ Eval("SendWorkDate")%><%# Eval("HandleWorkDate").ToString()==""?"":"<br />处理:"+ Eval("HandleWorkDate")%>
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="left" />
                                     </asp:TemplateField>


                     <%--               <asp:BoundField DataField="AddrName" HeaderText="收货人" />
                                    <asp:BoundField DataField="AddrPhone" HeaderText="收货手机号" />
                                    <asp:BoundField DataField="Addr" HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" ItemStyle-CssClass="GridTDStyle"/>--%>
                                    <asp:TemplateField>
                                           <HeaderTemplate>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货人信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</HeaderTemplate>
                                           <ItemTemplate>
                                                <%# Eval("AddrName")%>&nbsp;<%# Eval("AddrPhone")%><br /><%# Eval("Addr")%><br /><asp:Label ID="LblSourceBrandsTop" runat="server"  CssClass="GridTDStyle" ></asp:Label>
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="left" CssClass="GridTDStyle" />
                                     </asp:TemplateField>
                                    <asp:BoundField HeaderText=""  Visible="false"/>
                                    <asp:BoundField HeaderText=""  Visible="false"/>

                                    <asp:BoundField DataField="TotalQty" HeaderText="总数量" />
                                    <asp:BoundField DataField="TotalCash" HeaderText="总金额" />
                                    <asp:TemplateField HeaderText="产品明细">
                                        <ItemTemplate>
                                            <asp:GridView ID="ChildGridView" runat="server" AutoGenerateColumns="False" BorderColor="Black" Width="241px">
                                                <Columns>
                                                    <asp:BoundField DataField="ProductName" HeaderText="产品名称" />
                                                    <asp:BoundField DataField="ProductType" HeaderText="规格" />
                                                    <asp:BoundField DataField="OrderUnitvalue" HeaderText="包装合计" />
                                                    <asp:BoundField DataField="ProductUnit" HeaderText="单位" />
                                                    <asp:BoundField DataField="Price" HeaderText="单价" />
                                                    <asp:BoundField DataField="Qty" HeaderText="数量" />
                                                </Columns>
                                                <HeaderStyle BackColor="Azure" Font-Size="12px" HorizontalAlign="Center" />
                                                <RowStyle HorizontalAlign="Left" />
                                                <PagerStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <asp:Panel ID="ChildGridPanel" runat="server"  style="text-align: left;">
                                            </asp:Panel>

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                           <HeaderTemplate><% =LTP.Common.ConfigHelper.GetConfigString("CustomerOrderRemark")%></HeaderTemplate>
                                           <ItemTemplate>
                                               <%# Eval("Remark")%>
                                               <%# Eval("RemarkImageUrl").ToString()==""?"":"<br /><img onclick='parent.getimg(\""+ Eval("RemarkImageUrl")+"\")' style='cursor:pointer' src='"+ Eval("RemarkImageUrl")+"' width='50px' height='50px'/>"%>
                                               <%# Eval("RemarkImageUrl2").ToString()==""?"":"<br /><img onclick='parent.getimg(\""+ Eval("RemarkImageUrl2")+"\")' style='cursor:pointer' src='"+ Eval("RemarkImageUrl2")+"' width='50px' height='50px'/>"%>
                                               <%# Eval("RemarkImageUrl3").ToString()==""?"":"<br /><img onclick='parent.getimg(\""+ Eval("RemarkImageUrl3")+"\")' style='cursor:pointer' src='"+ Eval("RemarkImageUrl3")+"' width='50px' height='50px'/>"%>
                                               <%# Eval("RemarkImageUrl4").ToString()==""?"":"<br /><img onclick='parent.getimg(\""+ Eval("RemarkImageUrl4")+"\")' style='cursor:pointer' src='"+ Eval("RemarkImageUrl4")+"' width='50px' height='50px'/>"%>
                                               <%# Eval("RemarkImageUrl5").ToString()==""?"":"<br /><img onclick='parent.getimg(\""+ Eval("RemarkImageUrl5")+"\")' style='cursor:pointer' src='"+ Eval("RemarkImageUrl5")+"' width='50px' height='50px'/>"%>

                                               <%# Eval("TargetRemark").ToString()==""?"":"<br />---留言分隔线---<br />"+ Eval("TargetRemark")%>


                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="left" CssClass="GridTDStyle" />

                                     </asp:TemplateField>


                                      <asp:TemplateField>
                                           <HeaderTemplate>代理信息</HeaderTemplate>
                                           <ItemTemplate>
                                                <%# Eval("SourceCustomField1")%>&nbsp;<%# Eval("SourceCustomField2")%><br /><%# Eval("SourceCustomField3")%><br /><asp:Label ID="LblSourceBrands" runat="server" ></asp:Label>
                                                <asp:Label ID="LblCustom" runat="server"  CssClass="GridTDStyle" ></asp:Label>
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="left" />
                                     </asp:TemplateField>
                                    <asp:BoundField HeaderText=""  Visible="false"/>
                                    <asp:BoundField HeaderText=""  Visible="false"/>
                                    <asp:BoundField DataField="EMSCompany" Visible="False" HeaderText="快递公司" />
                                    <asp:BoundField DataField="EMSCode" Visible="False" HeaderText="快递单号"   />



                                    <asp:TemplateField HeaderText="订单操作" >
                                        <ItemTemplate>
                                            <input id="BtnPrint" type="button" value="打印" onclick="window.open('/NewCustomerOrder/CustomerOrderPrintTemplate.aspx?id=<%# Eval("id") %>')" />

											<input class="BtnReview" type="button"  data-id='<%# Eval("ID")%>' value="审核并分批"  style="display:<%# (Request.QueryString["StateID"].ToString() != "0")?"none":"block"%>" />

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="GridTDStyle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="发货操作" Visible="False" >
                                        <ItemTemplate>
                                                 <asp:TextBox ID="txtEMSCode" runat="server"  Width="160px" onclick="javascript:if(this.value=='请填写快递单号') this.value=''">请填写快递单号</asp:TextBox><br />
                                                 <asp:DropDownList ID="DDLEMSCompany" runat="server"></asp:DropDownList>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1"  runat="server" Text="提交"  CommandArgument='<%#DataBinder.Eval(Container, "RowIndex")%>' CommandName="BtnSubmit"  OnClientClick="return confirm('确认此操作吗？');"/>

                                            <asp:Panel ID="PanelWarehouse" runat="server" Visible="false">
                                                 <hr />
                                                 <asp:DropDownList ID="newWarehouse_ID" runat="server"></asp:DropDownList><asp:Button ID="Button2"  runat="server" Text="转仓"  CommandArgument='<%#DataBinder.Eval(Container, "RowIndex")%>' CommandName="BtnTransferWarehouse"  OnClientClick="return confirm('确认要改配送仓库操作吗？');"/>

                                            </asp:Panel>

                                        </ItemTemplate>
                                         <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                     <asp:BoundField DataField="FailureReason" Visible="False" HeaderText="审核失败原因" />
                                     <asp:BoundField DataField="IsPackages"   HeaderText="" />





                        <asp:TemplateField>
                        <ItemTemplate>
                        </ItemTemplate>
                        </asp:TemplateField>



                                    <asp:TemplateField>
                                    <ItemTemplate>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                  <PagerTemplate>
                                    <asp:Label ID="lblPage" runat="server" Text='<%# "第" + (int.Parse(ViewState["PageIndex"].ToString()) + 1)  + "页/共" + (int.Parse(ViewState["PageCount"].ToString())) + "页" %> '></asp:Label>
                                    <asp:LinkButton ID="lbnFirst" runat="Server" Text="首页"  Enabled='<%# int.Parse(ViewState["PageIndex"].ToString()) != 0 %>' CommandName="Page" CommandArgument="First" ></asp:LinkButton>
                                    <asp:LinkButton ID="lbnPrev" runat="server" Text="上一页" Enabled='<%# int.Parse(ViewState["PageIndex"].ToString()) != 0 %>' CommandName="Page" CommandArgument="Prev"  ></asp:LinkButton>
                                    <asp:LinkButton ID="lbnNext" runat="Server" Text="下一页" Enabled='<%# int.Parse(ViewState["PageIndex"].ToString()) != (int.Parse(ViewState["PageCount"].ToString()) - 1) %>' CommandName="Page" CommandArgument="Next" ></asp:LinkButton>
                                    <asp:LinkButton ID="lbnLast" runat="Server" Text="尾页"   Enabled='<%# int.Parse(ViewState["PageIndex"].ToString()) != (int.Parse(ViewState["PageCount"].ToString()) - 1) %>' CommandName="Page" CommandArgument="Last" ></asp:LinkButton>
                                    到第<asp:TextBox runat="server" Width="50px"  ID="inPageNum" MaxLength="5"></asp:TextBox>页 <asp:Button ID="Button1" CommandArgument="go" runat="server" Text="GO" />
                                 每页<asp:DropDownList ID="ddlpg" runat="server" autopostback="true" onselectedindexchanged="ddlpg_SelectedIndexChanged" >
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                    </asp:DropDownList>

                                       </PagerTemplate>
                            </asp:GridView>
                        </div>

                    </div>
                </td>
            </tr>
        </table>

        <asp:Panel ID="Panel0" runat="server" Visible="False">

            <fieldset class="ui-widget ui-widget-content" style="width: 700px">
                <legend>审核操作</legend>

                <div style="display:inline">
                     <div id="div2" style="float:left">
                            <asp:DropDownList ID="DDLOperate" runat="server">
                                <asp:ListItem Value="2">审核成功</asp:ListItem>
                                <asp:ListItem Value="1">审核失败</asp:ListItem>
                            </asp:DropDownList>
                     </div>


                    <div id="DivFailure" style="float:left">
                        失败原因：
                        <asp:TextBox ID="txtFailureReason" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                    </div>
                    <div id="DivSuccess" style="float:left">
                        发货人留言：
                        <asp:TextBox ID="txtTargetRemark" runat="server" Width="200px" MaxLength="500"  TextMode="MultiLine"></asp:TextBox>
                    </div>


                     <div id="div3" style="float:left">
                        <asp:Button ID="BrnOperate0" runat="server" Text="批量处理"
                                class="ui-state-default  ui-priority-primary " OnClick="BrnOperate0_Click" OnClientClick="


                            if ($('#DDLOperate').val()==1)
                            {
                                if (!confirm('确认就否要审核失败？')) {
    	                            return false;
    	                        }
                            }

                            $('#BrnOperate0').val('处理中..').addClass('ui-state-disabled');" />

                        <input id="BtnRebateCalc" runat="server" visible="false" type="button" value="批量处理" onclick="RebateCalc()" class="ui-state-highlight  ui-priority-primary "/>
                      </div>

                </div>

            </fieldset>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Visible="False">
            <fieldset class="ui-widget ui-widget-content" style="width: 500px">
                <legend>快递单操作</legend>
                &nbsp;
    第一步：Excel内容复制输入(复制内容格式为：<span style="color: #FF0000">订单号 快递公司 快递单号</span>)<br />
                每次操作上限是<%= LTP.Common.ConfigHelper.GetConfigInt("CustomerOrderEMSImportRow") %>行<br />
                <asp:TextBox ID="txtQueryCode" runat="server" Height="200px" TextMode="MultiLine" Width="450px"></asp:TextBox>
            </fieldset>
            <fieldset class="ui-widget ui-widget-content" style="width: 500px">
                <legend>第二步：提交操作</legend>
                <asp:Button ID="BrnOperate2" runat="server" Text="提交操作"
                    class="ui-state-default  ui-priority-primary " OnClick="BrnOperate2_Click" OnClientClick="return submitform()" />
                <br />
                <asp:Label ID="LblResult" runat="server" Text="提交结果："></asp:Label>
            </fieldset>
        </asp:Panel>


        <asp:Panel ID="PanelDel" runat="server" Visible="False">

            <fieldset class="ui-widget ui-widget-content" style="width: 500px">
                <legend>删除操作</legend>
                       <asp:Button ID="BrnDel" runat="server" Text="批量删除"
                                class="ui-state-default  ui-priority-primary "  OnClientClick="$('#BrnDel').val('处理中..').addClass('ui-state-disabled');" OnClick="BrnDel_Click" />

            </fieldset>
        </asp:Panel>
    </form>

          <div id="dialogOrderData" title="订单确认(确认没问题后请点击提交操作)" style="width: 600px; height: 440px" >
              <div id="OrderResult" style="font-size:12px;font-family:Arial;"></div>
              <input id="BtnRebateSubmit" type="button" value="提交" onclick="RebateSubmit()"/>
         </div>


              <div id="dialogEMS" title="订单快递单修改" style="width: 600px; height: 440px" >

              <input id="dialogEMSID"  name="dialogEMSID" type="text"  style="display:none" />
              <select id="DDLEMSCompany" name="dialogEMSCompany" runat="server">
              </select>
              <%--<input type="text" style="width:120px;" onclick="javascript:if(this.value=='请填写快递单号') this.value=''" id="dialogEMSCode" value="请填写快递单号" name="dialogEMSCode" />--%>

               <textarea id="dialogEMSCode" style="width: 297px; height: 204px;" size="50" maxlength="4000" name="remark" cols="20" rows="2" role="textbox" multiline="true"></textarea>
         </div>

      <div id="dialogTargetRemark" title="订单发货留言修改" style="width: 600px; height: 600px" >
          <input id="dialogTargetID"  name="dialogTargetID" type="text"  style="display:none" />
          <textarea name="dialogtxtTargetRemark" rows="6" cols="20" id="dialogtxtTargetRemark" style="width: 369px; height: 188px;"></textarea>
     </div>


     <!-- Bin -->
     <div id="ReviewWarehouseDialog">
         <iframe id="ReviewWarehouseDialogIframe" src="" frameborder="0" width="100%" height="100%"></iframe>
     </div>
     <!-- Bin -->





     <div id="DivDel" title="删除确认" style="width: 600px; height: 600px" >
         我的库存->可下单数量
         <select id="DelIsAddStock" name="DelIsAddStock">
             <option value="1">增加</option>
             <option value="0">不增加</option>
         </select>
         <br />
         <br />
         <b>确认要删除,此订货单吗？</b><br /><br />
         备注
          <ul>
	        <li>有调货的不能删除</li>
	        <li>返利也会自动删除</li>
         </ul>

          <input id="dialogDelID"  name="dialogDelID" type="text"  style="display:none" />
     </div>

</body>
</html>
