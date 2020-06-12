// $('#area1').empty();
var myChart3 = echarts.init(document.getElementById('area1'));
/**
 * ��ˮ����ͼ�� ����¼� ����
 */
myChart3.on('click', function (params2) {
    if (params2.componentType === 'series' && params2.seriesType === 'pie') {
        setTimeout(function () {
            // ��ʾ ������ˮͼ��
            showEchartsBar({farmName: window.__farmName, watermeterType: encodeURIComponent(params2.name)})
        }, 0);
    }
});


// ����׼���õ�dom����ʼ��echartsͼ��
function showEchartsArea(param) {
    window.__farmName = param.farmName;
    $.post(ctx + '/iot/iotWatermeterReport/indexArea', param, function (data) {
        console.log(data)
        if (data) {

            var option = {
                color: [
                    '#006699',
                    '#996600',
                    '#009933',
                    '#CC6699',
                    '#0033CC',
                    '#999999',
                    '#CCFF00',
                    '#663300',
                    '#CC6666',
                    '#66CC00',
                    '#000066',
                    '#547758',
                    '#51bfe3',
                    '#BDB121',
                    '#33CC99',
                    '#CC6600',
                    '#99CCCC',
                    '#FF9900',
                    '#669966',
                    '#990066',
                    '#6699FF'
                ],
                // title : {
                //     text: 'ĳվ���û�������Դ',
                //     subtext: '�����鹹',
                //     x:'center'
                // },

                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    // orient: 'vertical',
                    // top: 'center',
                    left: 'center',
                    // x:'center',
                    data: data.legend
                },
                series: [
                    {
                        name: '��ˮ��',
                        type: 'pie',
                        radius: '66%',
                        center: ['50%', '60%'],
                        data: data.data,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            myChart3.setOption(option, true);


        }
    });
}

// showEchartsArea();

