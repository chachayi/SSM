<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>
<html>
<title>首页 | 驾考培训</title>
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/system.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/index.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/base.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/basemod.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/basemod_dynamic_layout_switching.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/basemod_drupal.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/content.css">
<link type="text/css" rel="stylesheet" media="all" href="static/bootstrap-3.3.7-dist/css/index_css/comm.css">

<body class="front not-logged-in page-index one-sidebar sidebar-left hidecol2">
<div id="topnav">
    <div class="page_margins">
        <ul class="right-link">
            <li><a href="#" title="登录">登录</a>
                &nbsp;|&nbsp;</li>
            <li><a title="控件下载" href="#">注册</a>&nbsp;|&nbsp;</li>
        </ul>
    </div>
</div>
<div id="header" class="clearfix">
    <div class="page_margins">
        <a href="#" title="首页"><img id="site-logo" class="_trans" src="static/bootstrap-3.3.7-dist/css/index_css/logo.jpg" alt="首页"></a>		<h1>驾考培训系统</h1>

    </div>
</div>
<div id="banner" class="slide-1">
    <div id="block-user-0" class="clearfix block block-user">
        <h3>用户登录</h3>  <div class="content">
        <form action="<%=basePath%>login" method="post" id="user-login-form">
        <div><div class="form-item" id="edit-name-wrapper">
            <label for="edit-name">用户名：<span class="form-required" title="此项必填。">*</span></label>
            <input type="text" maxlength="60" id="edit-name" size="15" value="" class="form-text required" name="username"/>
        </div>
            <div class="form-item" id="edit-pass-wrapper">
                <label for="edit-pass">密码：<span class="form-required" title="此项必填。" >*</span></label>
                <input type="password" name="pwd" id="edit-pass" maxlength="60" size="15" class="form-text required"/>
            </div>
            <input type="submit" name="op" value="登录" class="form-submit"/>

        </div>
        </form>
    </div>
    </div>

    <ul id="J-slide">


    </ul>

    <script type="text/javascript">
        Loader.use('alipay.alipayIndexSimple.main', function() {
            alipay.index.lazyloadBanner($$('.J_lazyloadBanner'));
        });
        if (arale.isIE()) {
            Loader.use('aralex.slider.FadeSlider', function() {
                var fs = new aralex.slider.FadeSlider( {
                    id : "J-slide",
                    triggerId : "J-slide-number",
                    triggerEvent : "click",
                    activeTriggerClass : 'slide-number-active',
                    delay : 8000000
                });
            });
        } else {
            (function() {
                var banner = document.getElementById('banner');
                var triggers = $$('#J-slide-number a');
                var index = 1;
                for (i = 0; i < triggers.length; i++) {
                    var item = triggers[i];
                    item.click(function(e) {
                        e.preventDefault();
                        slideTo(e.target.innerHTML);
                    });
                }
                function slideTo(number) {
                    index = parseInt(number);
                    banner.className = 'slide-' + number;
                    for (i = 0; i < triggers.length; i++) {
                        triggers[i].removeClass('slide-number-active');
                    }
                    triggers[index - 1].addClass('slide-number-active');
                }
                var SLIDE;
                SLIDE = setInterval(function() {
                    if (index >= 3)
                        index = 0;
                    index++;
                    slideTo(index);
                }, 8000000);
                E.on(banner, 'mouseover', function() {
                    clearInterval(SLIDE);
                });
                E.on(banner, 'mouseout', function() {
                    SLIDE = setInterval(function() {
                        if (index >= 3)
                            index = 0;
                        index++;
                        slideTo(index);
                    }, 8000000);
                });
            })();
        }
    </script></div>

<div class="page_margins">
    <div class="page">
        <div id="main">
            <!-- begin: #col1 - first float column -->
            <div id="col1" role="complementary">
                <div id="col1_content" class="clearfix">
                    <div id="col1_inside" class="floatbox">
                        <div id="block-admin-olineservice" class="clearfix block block-admin">

                            <h3>在线客服</h3>  <div class="content"><div class="service-list">
                            <dl>
                                <dt class="hotline"><i></i><strong>服务热线</strong></dt>
                                <dd>123-123-123</dd>
                                <dt class="service"><i></i><strong>在线客服</strong></dt>
                                <dd>
                                    <ul>
                                        <li class="first"><a target="_blank" href="#"><img border="0" src="static/bootstrap-3.3.7-dist/css/index_css/pa.jpg" alt="点击这里给我发消息" title="点击这里给我发消息"></a></li>
                                        <li class="last"><a target="_blank" href="#"><img border="0" src="static/bootstrap-3.3.7-dist/css/index_css/pa.jpg" alt="点击这里给我发消息" title="点击这里给我发消息"></a></li>
                                    </ul>
                                </dd>
                                <dt class="email"><i></i><strong>服务邮箱</strong></dt>
                                <dd>service@CCCC.com</dd>
                                <dt class="time"><i></i><strong>工作时间</strong></dt>
                                <dd>24小时服务</dd>
                            </dl>
                        </div></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end: #col1 -->


            <!-- begin: #col3 static column -->
            <div id="col3">
                <div id="col3_content" class="clearfix">
                    <div id="col3_inside" class="floatbox">
                        <div id="block-admin-advert" class="clearfix block block-admin">
                            <h3>首页宣传</h3>  <div class="content"><div class="advert">
                            <ul class="advert-list">
                                <li class="first">
                                    <a href="#" class="ico50 video" title="学车视频">
                                        <h4>学车视频</h4>
                                        <p>根据教学大纲编排视频内容，内容丰富。</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="ico50 cartoon" title="学车动画">
                                        <h4>学车动画</h4>
                                        <p>动画演示，模拟真实场景，真实体验。</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="ico50 exam" title="模拟考试">
                                        <h4>模拟考试</h4>
                                        <p>5000多道试题，模拟演练，助您在考场上游刃有余。</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="ico50 zexam" title="仿真考试">
                                        <h4>仿真考试</h4>
                                        <p>身临其境，体验正式理论考试场景。</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="ico50 outline" title="最新大纲">
                                        <h4>最新大纲</h4>
                                        <p>所有课程都是按照最新教学大纲编排。</p>
                                    </a>
                                </li>
                                <li class="last">
                                    <a href="#" class="ico50 time" title="真实学时">
                                        <h4>真实学时</h4>
                                        <p>学员所有学时都同系统同步，都可以查询。</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        </div>
                        </div>
                    </div>
                </div>
                <div id="ie_clearing">&nbsp;</div>
                <!-- end: IE Column Clearing -->
            </div>
            <!-- end: #col3 -->

        </div>
        <!-- end: #main -->
    </div>
</div>
<!-- begin: #footer -->
<div id="footer">
    <div class="page_margins">
        <p> <a href="#" target="_blank">驾考培训系统</a>版权所有</p>
    </div>
</div>
<!-- end: #footer -->

</body></html>