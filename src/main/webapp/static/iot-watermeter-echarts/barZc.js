// $('#bar1').empty();
// ����׼���õ�dom����ʼ��echartsͼ��
var myChart6 = echarts.init(document.getElementById('barZc'));

function showEchartsbarZc(param) {
    // $.post(ctx + '/iot/iotWatermeterReport/indexBar', param, function (data) {
    //     if (data) {

    var option = {
        color: [ '#62A11E' ],
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
                data : ['����һ��', '�������', '������'],
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
                data:[78300, 237502, 4500]
            }
        ]
    };


    myChart6.setOption(option, true);
        // }
    // });
}

showEchartsbarZc();



