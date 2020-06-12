$.post(ctx + '/iot/iotWatermeterReport/indexMap', function (d) {
    if (d) {
        //    根据用量倒叙排列后默认显示第用水量的猪场的钻取图表


        setTimeout(function () {
            // 显示 地图图表
            showEchartsMap(d);
        }, 0);
    }
});

// $('#map').empty();
// 基于准备好的dom，初始化echarts图表
var myChart2 = echarts.init(document.getElementById('map'));


/**
 * 地图 点击事件 处理
 */
myChart2.on('click', function (params) {
    if (params.componentType === 'series' && (params.seriesType === 'bar' || params.seriesType === 'effectScatter')) {

        setTimeout(function () { // setTimeout 异步处理，加快显示
            // 显示 用水类型图表
            showEchartsArea({farmName: encodeURIComponent(params.name)})
        }, 0);

        setTimeout(function () {
            // 显示 猪舍用水图表
            showEchartsBar({farmName: encodeURIComponent(params.name)})
        }, 0);
    }
});

function showEchartsMap(data) {

// TODO 这个猪场地理位置的坐标信息，应该是可以在管理后台配置
    var geoCoordMap = {
        "临沭一场": [118.35, 35.05],
        "临沭二场": [116.59, 35.38],
        "龙口公司": [120.12, 36.86],
        "鲁南片区": [119.46, 35.38],
        "鲁西北片区": [116.29, 37.45],
        "南充新好农牧有限公司": [106.06, 30.80],
        "荣昌公司（重庆市新希望猪资源开发有限公司）": [106.54, 29.59],
        "三台新海鑫农牧有限公司（清泉猪场）": [105.06, 31.10],
        "三台新希望农牧科技有限公司": [105.16, 31.14],
        "山东六和银宝养殖有限公司": [116.76, 36.24],
        "夏津一场": [116.12, 36.96],
        "夏津二场": [116.00, 36.95],
        "夏津三场": [116.00, 36.86],
        "夏津祖代场": [116.22, 36.99],
        "萧县公司": [116.93, 34.19],
        "北川新常乐农牧有限公司": [104.44, 31.89],
        "川北片区": [106.06, 30.80],
        "高密市六和养猪有限公司": [119.75, 36.38],
        "衡水新希望六和农牧有限公司": [115.72, 37.72],
        "江油新希望海波尔种猪东兴培育场": [104.70, 31.80],
        "胶东片区": [122.10, 37.50],
        "莒南六和养殖公司-店头猪场": [118.83, 35.17],
        "莒南六和养殖公司-岭泉猪场": [118.73, 35.27],
        "莒南六和养殖公司-演马猪场": [118.70, 35.20],
        "拉萨公司": [91.11, 29.97],
        "乐山新希望农牧有限公司井研全胜种猪分公司": [102.15, 28.26]
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
                 text: '猪场用水量总计',
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
                text: '新希望六和全国猪场布局图',
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
        visualMap: { //图例值控制
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
            name: '新希望',
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

        //    根据用量倒叙排列后默认显示第用水量的猪场的钻取图表
        setTimeout(function () { // setTimeout 异步处理，加快显示
            // 显示 用水类型图表
            $('#areaName').text(testValueRes[0].name+' - 各猪舍累计用水量');
            showEchartsArea({farmName: encodeURIComponent(testValueRes[0].name)})
        }, 0);

        setTimeout(function () {
            // 显示 猪舍用水图表
            $('#barName').text(testValueRes[0].name+' - 各猪舍累计用水量');
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
                text: count ? '平均: ' + (sum / count).toFixed(4) : ''
            },*/
            title: {
                id: 'statistic',
                text: '2018年度总用水量(单位:百立方)'
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
