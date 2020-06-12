// $('#bar1').empty();
// 基于准备好的dom，初始化echarts图表
var myChart6 = echarts.init(document.getElementById('barZc'));

function showEchartsbarZc(param) {
    // $.post(ctx + '/iot/iotWatermeterReport/indexBar', param, function (data) {
    //     if (data) {

    var option = {
        color: [ '#62A11E' ],
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
                data : ['临沭一场', '临沭二厂', '城阳猪场'],
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
                data:[78300, 237502, 4500]
            }
        ]
    };


    myChart6.setOption(option, true);
        // }
    // });
}

showEchartsbarZc();



