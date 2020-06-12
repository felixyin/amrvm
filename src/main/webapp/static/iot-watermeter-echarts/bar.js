// $('#bar1').empty();
// ����׼���õ�dom����ʼ��echartsͼ��
var myChart4 = echarts.init(document.getElementById('bar1'));

function showEchartsBar(param) {
    $.post(ctx + '/iot/iotWatermeterReport/indexBar', param, function (data) {
        if (data) {

            var option = {
                // title: {
                //     text: '������ˮ��',
                //     x:'center'
                //     // subtext: '������һ������ѣ�������Դ��https://www.numbeo.com��'
                // },
                color: [
                    '#009933'
                ],

                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // ������ָʾ���������ᴥ����Ч
                        type: 'shadow'        // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
                    }
                },
                toolbox: { //���ӻ��Ĺ�����
                    show: false,
                    feature: {
                        dataView: { //������ͼ
                            show: true
                        },
                        restore: { //����
                            show: true
                        },
                        saveAsImage: {//����ͼƬ
                            show: true
                        },
                        magicType: {//��̬�����л�
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
                        name: '��ˮ��',
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



