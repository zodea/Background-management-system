<%@ Page language="c#" Codebehind="Login.aspx.cs" AutoEventWireup="True" Inherits="Maticsoft.Web.Admin.Login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

<HEAD>
  <title>系统登录</title>
  <LINK href="Images/login_new.css?v=1" type="text/css" rel="stylesheet" />
  <script type="text/javascript"
    src="<%=LTP.Common.ConfigHelper.GetConfigString("jsurl")%>/d/js/jquery/1.4.2/jquery.min.js"></script>
  <script language="javascript" type="text/javascript">
		var eye = false;
    function toggleEye() {
      eye = !eye;
      var img = eye
        ? "/icons/eye_show_new.png"
        : "/icons/eye_hide_new.png";
      var type = eye ? "text" : "password";
      $(".eye").attr("src", img);
      $("#txtPass").attr("Type", type);
    }

    function ChangeCode() {
      var date = new Date();
      var myImg = document.getElementById("ImageCheck");
      myImg.src = "ValidateCode.aspx?flag=" + date.getMilliseconds();
      return false;
    }
  </script>
</HEAD>
<% LTP.Common.LogManager.WriteLog(LTP.Common.LogFile.Trace,Context.Request.UserAgent);%>
<body MS_POSITIONING="GridLayout" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
  <form id="Form1" method="post" runat="server" autocomplete="off">
		<div class="container flex a-c">
      <header class="flex j-c a-c">
        <img class="logo" src="images/member_t05.gif" alt="logo" srcset="" />
      </header>
			<main class="flex a-c">
				<div class="form">
					<div class="login-head flex a-c">密码登录</div>
					<div class="form-item">
						<div class="row username">
							用户名： <INPUT class="checked" tabIndex="1" maxLength="22" size="22" name="user" id="txtUsername" runat="server" placeholder="用户名">
						</div>
						<div class="row password">
							密&nbsp;&nbsp; 码： <INPUT name="user" type="password" class="checked" tabIndex="1" size="22" maxLength="22" id="txtPass" runat="server" placeholder="密码">
							<img
								class="eye"
								src="/icons/eye_hide_new.png"
								onclick="toggleEye()"
							/>
						</div>
						<div class="row yzm">
							验证码：
							<input class="checked" id="CheckCode" tabindex="3" maxlength="22" size="11" name="user" runat="server" placeholder="验证码" />
							<a id="A2" class="code" href="" onclick="ChangeCode();return false;">
								<asp:Image ID="ImageCheck" runat="server" ImageUrl="ValidateCode.aspx?GUID=GUID"  ImageAlign="AbsMiddle" ToolTip="看不清，换一个"></asp:Image>
							</a>
						</div>
						<asp:ImageButton id="btnLogin" runat="server" ImageUrl="icons/login_btn_new.png"></asp:ImageButton>
						<br />
						<asp:Label id="lblMsg" runat="server" BackColor="Transparent" ForeColor="Red"></asp:Label>
					</div>
				</div>
			</main>
      <footer class="flex j-c a-c" style="visibility: hidden;">
        <p>Copyright (c) 2015 <% =LTP.Common.ConfigHelper.GetConfigString("Copyright")%> All Rights
          Reserved.</p>
      </footer>
		</div>
  </form>
</body>

</HTML>