// $('#bar1').empty();
// ����׼���õ�dom����ʼ��echartsͼ��
var myChart5 = echarts.init(document.getElementById('barLlj'));

function showEchartsBarLlj(param) {
    $.post(ctx + '/iot/iotWatermeterReport/indexBarLlj', param, function (data) {
        if (data) {

        var option = {
            color: [ '#00c0ef' ],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // ������ָʾ���������ᴥ����Ч
                    type : 'shadow'        // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
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
                    name:'ֱ�ӷ���',
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



