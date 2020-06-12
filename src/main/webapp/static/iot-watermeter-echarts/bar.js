// $('#bar1').empty();
// 基于准备好的dom，初始化echarts图表
var myChart4 = echarts.init(document.getElementById('bar1'));

function showEchartsBar(param) {
    $.post(ctx + '/iot/iotWatermeterReport/indexBar', param, function (data) {
        if (data) {

            var option = {
                // title: {
                //     text: '猪舍用水量',
                //     x:'center'
                //     // subtext: '市中心一室月租费（数据来源：https://www.numbeo.com）'
                // },
                color: [
                    '#009933'
                ],

                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                toolbox: { //可视化的工具箱
                    show: false,
                    feature: {
                        dataView: { //数据视图
                            show: true
                        },
                        restore: { //重置
                            show: true
                        },
                        saveAsImage: {//保存图片
                            show: true
                        },
                        magicType: {//动态类型切换
                            type: ['bar', 'area']
                        }
                    }
                },
                grid: {
                    top: '2%',
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        data: data.xAxis,
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '用水量',
                        type: 'bar',
                        // barWidth: '60%',
                        barMaxWidth : 15,
                        data: data.series,
                    }
                ]
            };

            myChart4.setOption(option, true);
        }
    });
}

// showEchartsBar();



