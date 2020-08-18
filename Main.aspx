<%@ Register TagPrefix="uc1" TagName="CopyRight" Src="Controls/copyright.ascx" %>

<%@ Page Language="c#" Codebehind="Main.aspx.cs" AutoEventWireup="True" Inherits="Maticsoft.Web.Admin.Main" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML><HEAD><TITLE>ϵͳ����</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META http-equiv="cache-control" content="no-store, must-revalidate"/>
<STYLE type=text/css>
BODY {
	MARGIN: 0px 0px; 
	BACKGROUND-COLOR: #ffffff;
}
	    table
        {
        	font-size:12px;
        }
        th,td
{
	white-space: nowrap;
}
#BodyBg{ 
    width: 100%;  
    height: 100%;  
    position: absolute;  
    left: 0px;  
    top: 0px;  
    z-index: 0; 
    background: url("Images/desk.jpg?v=2") no-repeat;
    background-size: cover;
} 
</STYLE>
</HEAD>
<BODY>
    <form id="form1" runat="server">
    <div id="BodyBg" style="overflow: hidden;"> 
        <img alt="" src="Images/desk.jpg?v=2" style="width:100%; display: none;"/>
    </div>
    </form>
</BODY></HTML>
