// ���ؼ���ֵ�ı���Զ�����ͼ��
// $('#searchForm').find('select,input').change(function () {
//     // $('#searchForm').submit();
//     $('#btnSubmit').click();
// }).focus(function(){
//     $('#btnSubmit').click();
// });

// ͳ�Ʒ�����ť�Ĵ���
$('#btnSubmit').click(function () {
    var formData = $('#searchForm').serialize();
    $.get(ctx + '/iot/iotWatermeterReport/listTrendJson?' + formData, function (data) {
        showEcharts(data);
    });
});

var h = document.body.clientHeight - 90;
$('#echartDiv').css('height', h + 'px');

var myChart = echarts.init(document.getElementById('echartDiv'));

/**
 * ʹͼ������
 * @type {number}
 * @private
 */
var __e_start = 0;
var __e_end = 20;
var my_itrl = setInterval(function () {
    if(__e_end >= 100){
        clearInterval(my_itrl);
        return ;
    }
    __e_start += 1;
    __e_end += 1;
    myChart.dispatchAction({
        type: 'dataZoom',
        // ��ѡ��dataZoom ����� index����� dataZoom ���ʱ���ã�Ĭ��Ϊ 0
        dataZoomIndex: 0,
        // ��ʼλ�õİٷֱȣ�0 - 100
        start: __e_start,
        // ����λ�õİٷֱȣ�0 - 100
        end: __e_end
    });
}, 150);

// myChart.hideLoading();
function showEcharts(iotWatermeterReport) {
    var myOption = {
        title: {
            text: '����ˮ���ͷ���',
        },
        color: [
            '#006699',
            '#996600',
            '#009933',
            '#CC6600',
            '#669966',
            '#6699FF',
            '#CCFF00',
            '#663300',
            '#66CC00',
            '#999999',
            '#000066',
            '#547758',
            '#0033CC',
            '#51bfe3',
            '#BDB121',
            '#33CC99',
            '#CC6699',
            '#99CCCC',
            '#FF9900',
            '#990066',
            '#CC6666',
        ],
        legend: {
            x: 'center',
            type: 'scroll',
            // orient: 'vertical',
            right: 10,
            top: 25,
            // bottom: 20,
            data: [],
            itemGap: 5,
            tooltip: {
                show: true
            }
        },
        tooltip: {
            // trigger: 'axis'
        },
        toolbox: {
            show: true,
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                dataView: {readOnly: false},
                magicType: {type: ['line', 'bar']},
                restore: {},
                saveAsImage: {}
            }
        },

        grid: {
            top: '12%',
            left: '1%',
            right: '10%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: iotWatermeterReport.dateNames
            }
        ],
        yAxis: [
            {
                type: 'value',
                // name: '��ˮ��',
                axisLabel: {
                    formatter: function (a) {
                        a = +a;
                        return isFinite(a)
                            ? echarts.format.addCommas(+a)
                            : '';
                    }
                }
            }
        ],
        dataZoom: [
            {
                type: 'slider',
                show: true,
                start: 0,
                end: 7,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    color: '#fff',
                    shadowBlur: 3,
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            },
            {
                type: 'inside',
                start: 0,
                end: 7
            },
            {
                type: 'slider',
                show: true,
                yAxisIndex: 0,
                filterMode: 'empty',
                width: 22,
                height: '50%',
                handleSize: 8,
                showDataShadow: false,
                left: '97%'
            }
        ],
        series: []
    };

// �����̨����Ϊecharts��Ҫ������
    for (var name  in  iotWatermeterReport.legends) {
        var datas = iotWatermeterReport.legends[name];

        myOption.legend.data.push(name);

        myOption.series.push({
            name: name,
            type: 'line',
            data: datas,
            markPoint: {
                data: [
                    {type: 'max', name: '����'},
                    {type: 'min', name: '����'}
                ]
            },
            /*markLine: {
                data: [
                    {type: 'average', name: 'ƽ��ֵ'},
                    [{
                        symbol: 'none',
                        x: '90%',
                        yAxis: 'max'
                    }, {
                        symbol: 'circle',
                        label: {
                            normal: {
                                position: 'start',
                                formatter: '���ֵ'
                            }
                        },
                        type: 'max',
                        name: '��ߵ�'
                    }]
                ]
            }*/
        });
    }

    myChart.setOption(myOption, true);

    // myChart.on('click', function (params) {
    //     console.log(params)
    // });
}

showEcharts(iotWatermeterReport);

