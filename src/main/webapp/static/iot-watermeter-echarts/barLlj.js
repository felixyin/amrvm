// $('#bar1').empty();
// 基于准备好的dom，初始化echarts图表
var myChart5 = echarts.init(document.getElementById('barLlj'));

function showEchartsBarLlj(param) {
    $.post(ctx + '/iot/iotWatermeterReport/indexBarLlj', param, function (data) {
        if (data) {

        var option = {
            color: [ '#00c0ef' ],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                top:'0%',
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            yAxis : [
                {
                    type : 'category',
                    data : data.yAxis,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            xAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'直接访问',
                    type:'bar',
                    barWidth: '60%',
                    data:data.series
                }
            ]
        };


        myChart5.setOption(option, true);
         }
    });
}

showEchartsBarLlj();



