<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>水表统计报表管理</title>
    <meta name="decorator" content="default"/>
    <meta name="content-type" content="text/html; charset=UTF-8">

    <link href="${ctxStatic}/index_files/bootstrap.min.css" rel="stylesheet">
    <%--<link href="${ctxStatic}/index_files/font-awesome.css" rel="stylesheet">--%>
    <link href="${ctxStatic}/index_files/style.min.css" rel="stylesheet">
    <link href="${ctxStatic}/index_files/AdminLTE.css" rel="stylesheet">

    <%--<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>--%>

    <!--引入百度地图的jssdk，这里需要使用你在百度地图开发者平台申请的 ak-->
    <%--<script src="https://cdn.bootcss.com/echarts/3.8.5/echarts.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>--%>
    <%--<script type="text/javascript"--%>
    <%--src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>--%>
    <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>--%>
    <%--<script type="text/javascript"--%>
    <%--src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>--%>

    <style rel="stylesheet" type="text/css">
        .bg-orange{
            background-color: #996699!important;
        }
        .bg-yellow{
            background-color: #FF801B!important;
        }
    </style>
</head>

<body class="gray-bg">
                <div class="wrapper wrapper-content" style="background-color: #ecf0f5;">

                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-aqua"><i class="icon iconfont2 icon-zhuchangtianchong"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">猪场数量</span>
                                    <span class="info-box-number"><span id="farmCount">0</span>座</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange"><i class="icon iconfont2 icon-new_shuibiao"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">水表个数</span>
                                    <span class="info-box-number"><span id="watermeterCount">0</span>个</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->


                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                <span class="info-box-icon bg-green"><i
                        class="icon iconfont2 icon-xiangmugailan-yongshuiliang"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">累计总计用水量</span>
                                    <span class="info-box-number"><span id="totalFlow">0</span>立方</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow"><i class="icon iconfont2 icon-yongshuiliang"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">今日用水总量</span>
                    <span class="info-box-number"><span id="todayTotalFlow">0</span>立方</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>

    <div class="row">
        <%--<div class="col-sm-7" style="padding-right:0px;">--%>
            <%--<div class="ibox float-e-margins">--%>
                <%--<div class="ibox-title">--%>
                    <%--<h5>猪场分布和昨日用水量</h5>--%>
                    <%--<div class="ibox-tools">--%>
                        <%--<a class="collapse-link">--%>
                            <%--<i class="fa fa-chevron-up"></i>--%>
                        <%--</a>--%>
                        <%--<a class="close-link">--%>
                            <%--<i class="fa fa-times"></i>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="ibox-content" style="display: block;">--%>
                    <%--<div id="map" style="width:100%;height:550px;"></div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title hide">
                    <h5>猪场分布和昨日用水量</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" style="display: block;">
                    <div id="province" style="width:100%;height:650px;"></div>
                    <script>
                        $('#province').height( window.document.body.clientWidth/1700*650);
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用水类型和昨日用水量</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" style="display: block;">
                    <div id="barZc" style="width:100%;height:350px;"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用水类型和昨日用水量</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" style="display: block;">
                    <div id="area1" style="width:100%;height:350px;"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>流量计和昨日用水量</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" style="display: block;">
                    <div id="barLlj" style="width:100%;height:350px;"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>猪舍和昨日用水量</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" style="display: block;">
                    <div id="bar1" style="width:100%;height:250px;"></div>
                </div>
            </div>
        </div>

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

    </div>


</div>


<div class="jvectormap-label"></div>

<%--<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/china.js"></script>--%>
<%--
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/jquery/jquery.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
<script type="text/javascript"
        src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=nfeXoUbpxqp5FTKyxtcLkEiKNaAGpa8H"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>--%>

<%--<script type="text/javascript" src="${ctxStatic}/echarts/jquery.js"></script>--%>
<script type="text/javascript" src="${ctxStatic}/echarts/echarts-all-3.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts/dataTool.min.js"></script>
<%--<script type="text/javascript" src="${ctxStatic}/echarts/map/js/china.js"></script>--%>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<%--<script type="text/javascript" src="${ctxStatic}/echarts/china.js"></script>--%>
<%--<script type="text/javascript" src="${ctxStatic}/echarts/world.js"></script>--%>
<%--<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=nfeXoUbpxqp5FTKyxtcLkEiKNaAGpa8H"></script>--%>
<%--<script type="text/javascript" src="${ctxStatic}/echarts/bmap.min.js"></script>--%>


<script type="text/javascript">
    // 读取和设置头部 色块数据
    $.post(ctx + '/iot/iotWatermeterReport/indexTopAnalyze', function (data) {
        if (data) {
            for (var key in data)
                $('#' + key).text(data[key]);
        }
    });
</script>
<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/area.js"></script>
<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/bar.js"></script>
-<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/barLlj.js"></script>
<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/barZc.js"></script>
<%--<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/map.js"></script>--%>
<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/province.js"></script>

</body>
</html>
