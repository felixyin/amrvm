$.post(ctx + '/iot/iotWatermeterReport/indexMap', function (d) {
    if (d) {
        //    ���������������к�Ĭ����ʾ����ˮ����������ȡͼ��


        setTimeout(function () {
            // ��ʾ ��ͼͼ��
            showEchartsMap(d);
        }, 0);
    }
});

// $('#map').empty();
// ����׼���õ�dom����ʼ��echartsͼ��
var myChart2 = echarts.init(document.getElementById('map'));


/**
 * ��ͼ ����¼� ����
 */
myChart2.on('click', function (params) {
    if (params.componentType === 'series' && (params.seriesType === 'bar' || params.seriesType === 'effectScatter')) {

        setTimeout(function () { // setTimeout �첽�����ӿ���ʾ
            // ��ʾ ��ˮ����ͼ��
            showEchartsArea({farmName: encodeURIComponent(params.name)})
        }, 0);

        setTimeout(function () {
            // ��ʾ ������ˮͼ��
            showEchartsBar({farmName: encodeURIComponent(params.name)})
        }, 0);
    }
});

function showEchartsMap(data) {

// TODO ���������λ�õ�������Ϣ��Ӧ���ǿ����ڹ����̨����
    var geoCoordMap = {
        "����һ��": [118.35, 35.05],
        "�������": [116.59, 35.38],
        "���ڹ�˾": [120.12, 36.86],
        "³��Ƭ��": [119.46, 35.38],
        "³����Ƭ��": [116.29, 37.45],
        "�ϳ��º�ũ�����޹�˾": [106.06, 30.80],
        "�ٲ���˾����������ϣ������Դ�������޹�˾��": [106.54, 29.59],
        "��̨�º���ũ�����޹�˾����Ȫ����": [105.06, 31.10],
        "��̨��ϣ��ũ���Ƽ����޹�˾": [105.16, 31.14],
        "ɽ������������ֳ���޹�˾": [116.76, 36.24],
        "�Ľ�һ��": [116.12, 36.96],
        "�Ľ����": [116.00, 36.95],
        "�Ľ�����": [116.00, 36.86],
        "�Ľ������": [116.22, 36.99],
        "���ع�˾": [116.93, 34.19],
        "�����³���ũ�����޹�˾": [104.44, 31.89],
        "����Ƭ��": [106.06, 30.80],
        "�����������������޹�˾": [119.75, 36.38],
        "��ˮ��ϣ������ũ�����޹�˾": [115.72, 37.72],
        "������ϣ��������������������": [104.70, 31.80],
        "����Ƭ��": [122.10, 37.50],
        "����������ֳ��˾-��ͷ��": [118.83, 35.17],
        "����������ֳ��˾-��Ȫ��": [118.73, 35.27],
        "����������ֳ��˾-������": [118.70, 35.20],
        "������˾": [91.11, 29.97],
        "��ɽ��ϣ��ũ�����޹�˾����ȫʤ����ֹ�˾": [102.15, 28.26]
    };


    var convertData = function (data) {
        var res = [];

        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name: data[i].name,
                    value: geoCoord.concat(data[i].value / 100)
                });
            }
        }
        return res;
    };

    var convertedData = [
        convertData(data),
        convertData(data.sort(function (a, b) {
            return b.value - a.value;
        }))
    ];


    var option = {
        backgroundColor: '#ffffff',
        animation: true,
        animationDuration: 1000,
        animationEasing: 'cubicInOut',
        animationDurationUpdate: 1000,
        animationEasingUpdate: 'cubicInOut',
        title: [
            /* {
                 text: '����ˮ���ܼ�',
                 // subtext: 'data from PM25.in',
                 // sublink: 'http://www.pm25.in',
                 left: 'center',
                 textStyle: {
                     color: '#fff'
                 }
             },*/
            {
                id: 'statistic',
                right: '7%',
                top: '12%',
                width: 100,
                textStyle: {
                    color: '#000000',
                    fontSize: 16
                }
            }/*,
            {
                text: '��ϣ������ȫ��������ͼ',
                left: 'center',
                right: '4%',
                top: '1%',
                textStyle: {
                    color: '#000000',
                    fontSize: 28
                }
            }*/


        ],

        toolbox: {
            left: 10,
            iconStyle: {
                normal: {
                    borderColor: '#000000'
                },
                emphasis: {
                    borderColor: '#ff3333'
                }
            }
        },
        visualMap: { //ͼ��ֵ����
            min: 0,
            max: 2,
            calculable: true,
            color: ['#00ff12', '#95fff2'],
            textStyle: {
                color: '#fff'
            },
            show: false
        },
        brush: {
            outOfBrush: {
                color: '#5581d7'
            },
            brushStyle: {
                borderWidth: 2,
                color: 'rgba(0,0,0,0.2)',
                borderColor: 'rgba(0,0,0,0.5)',
            },
            seriesIndex: [0, 1],
            throttleType: 'debounce',
            throttleDelay: 300,
            geoIndex: 0
        },

        geo: {
            map: 'china',
            top: '41%',
            // left: '10%',
            right: '29%',
            center: [118.98, 34.20],
            zoom: 3.1,
            label: {
                normal: {
                    show: true
                },
                emphasis: {
                    show: false
                }
            },
            roam: false,
            itemStyle: {
                normal: {
                    areaColor: '#e0ffff',
                    borderColor: '#111'
                },
                emphasis: {
                    show: true,
                    areaColor: '#006edd'
                }
            }
        },
        tooltip: {
            trigger: 'item'
        },
        grid: {
            top: 160,
            right: '1%',
            bottom: 40,
            width: '15%'
        },
        xAxis: {
            type: 'value',
            scale: true,
            position: 'top',
            boundaryGap: false,
            splitLine: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 2,
                textStyle: {
                    fontSize: 14,
                    color: '#000000'
                }
            },
        },
        yAxis: {
            type: 'category',
            name: '',
            nameGap: 16,
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#000000'
                }
            },
            axisTick: {
                show: false,
                lineStyle: {
                    color: '#000000'
                }
            },
            axisLabel: {
                interval: 0,
                textStyle: {
                    fontSize: 14,
                    color: '#000000'
                }
            },
            data: []
        },
        series: [{
            name: '��ϣ��',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            data: convertedData[0],
            markPoint: {
                symbol: 'pin',
                symbolSize: 50,
                label: {
                    normal: {
                        show: true,
                        formatter: function (d) {
                            return d.name
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#ff0000',
                        fontSize: 16,
                        shadowBlur: 10,
                        shadowColor: '#333'
                    }
                },
                data: [
                    {
                        name: '',
                        symbol: 'path://M100,0 L41.22,180.90 L195.10,69.09 L4.89,69.09 L158.77,180.90 z',
                        coord: [104.06, 30.67]
                    }
                ]
            },
            symbolSize: function (val) {
                // return Math.max(val[2] / 1000, 5);
                return 9;
            },
            showEffectOn: 'emphasis',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    fontSize: 16,
                    show: false
                }
            },
            itemStyle: {
                normal: {
                    color: '#00ff12',
                    fontSize: 16,
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            zlevel: 1
        }, {
            id: 'bar',
            zlevel: 2,
            barWidth:15,
            type: 'bar',
            symbol: 'none',
            itemStyle: {
                normal: {
                    color: '#1FBCD2'
                }
            },
            data: []
        }]
    };


    function renderBrushed(params) {
        var mainSeries = params.batch[0].selected[0];

        var selectedItems = [];
        var categoryData = [];
        var barData = [];
        var maxBar = 30;
        var sum = 0;
        var count = 0;

        for (var i = 0; i < mainSeries.dataIndex.length; i++) {
            var rawIndex = mainSeries.dataIndex[i];
            var dataItem = convertedData[0][rawIndex];
            var pmValue = dataItem.value[2];
            sum += pmValue;
            count++;

            selectedItems.push(dataItem);
        }

        // selectedItems.sort(function (a, b) {
        //     return a.name < b.name;
        // });
        var testValueRes = [];
        var testRes = [];
        for(var k=0;k<convertedData[0].length;k++){
            var tem = convertedData[0][k]
            for(var j=0;j<selectedItems.length;j++){
                var jj = selectedItems[j];
                if(tem.name === jj.name){
                    testRes.push(tem)
                }
                if(tem.value[2] >0){
                    testValueRes.push(tem)
                }
            }
        }
        selectedItems = testRes;

        //    ���������������к�Ĭ����ʾ����ˮ����������ȡͼ��
        setTimeout(function () { // setTimeout �첽�����ӿ���ʾ
            // ��ʾ ��ˮ����ͼ��
            $('#areaName').text(testValueRes[0].name+' - �������ۼ���ˮ��');
            showEchartsArea({farmName: encodeURIComponent(testValueRes[0].name)})
        }, 0);

        setTimeout(function () {
            // ��ʾ ������ˮͼ��
            $('#barName').text(testValueRes[0].name+' - �������ۼ���ˮ��');
            showEchartsBar({farmName: encodeURIComponent(testValueRes[0].name)})
        }, 0);

        for (var i = 0; i < Math.min(selectedItems.length, maxBar); i++) {
            categoryData.push(selectedItems[i].name);
            barData.push(selectedItems[i].value[2]);
        }

        this.setOption({
            yAxis: {

                data: categoryData
            },
            xAxis: {
                axisLabel: {
                    show: !!count
                }
            },
            /*title: {
                id: 'statistic',
                text: count ? 'ƽ��: ' + (sum / count).toFixed(4) : ''
            },*/
            title: {
                id: 'statistic',
                text: '2018�������ˮ��(��λ:������)'
            },
            series: {
                color: ['#db927c'],
                id: 'bar',
                data: barData
            }
        });
    }

    myChart2.on('brushselected', renderBrushed);

    setTimeout(function () {
        myChart2.dispatchAction({
            type: 'brush',
            areas: [{
                geoIndex: 0,
                brushType: 'polygon',
                coordRange: [
                    [115.00, 38.00],
                    [123.00, 38.00],
                    [123.00, 34.00],
                    [115.00, 34.00],
                ]
            }]
        });
    }, 1000);


    myChart2.setOption(option, true);

}
