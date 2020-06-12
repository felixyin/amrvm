var myChart8 = echarts.init(document.getElementById('province'));

var provinces = {
    '�Ϻ�': ctxStatic + '/echarts/map/json/province/shanghai.json',
    '�ӱ�': ctxStatic + '/echarts/map/json/province/hebei.json',
    'ɽ��': ctxStatic + '/echarts/map/json/province/shanxi.json',
    '���ɹ�': ctxStatic + '/echarts/map/json/province/neimenggu.json',
    '����': ctxStatic + '/echarts/map/json/province/liaoning.json',
    '����': ctxStatic + '/echarts/map/json/province/jilin.json',
    '������': ctxStatic + '/echarts/map/json/province/heilongjiang.json',
    '����': ctxStatic + '/echarts/map/json/province/jiangsu.json',
    '�㽭': ctxStatic + '/echarts/map/json/province/zhejiang.json',
    '����': ctxStatic + '/echarts/map/json/province/anhui.json',
    '����': ctxStatic + '/echarts/map/json/province/fujian.json',
    '����': ctxStatic + '/echarts/map/json/province/jiangxi.json',
    'ɽ��': ctxStatic + '/echarts/map/json/province/shandong.json',
    '����': ctxStatic + '/echarts/map/json/province/henan.json',
    '����': ctxStatic + '/echarts/map/json/province/hubei.json',
    '����': ctxStatic + '/echarts/map/json/province/hunan.json',
    '�㶫': ctxStatic + '/echarts/map/json/province/guangdong.json',
    '����': ctxStatic + '/echarts/map/json/province/guangxi.json',
    '����': ctxStatic + '/echarts/map/json/province/henan.json',
    '�Ĵ�': ctxStatic + '/echarts/map/json/province/sichuan.json',
    '����': ctxStatic + '/echarts/map/json/province/guizhou.json',
    '����': ctxStatic + '/echarts/map/json/province/yunnan.json',
    '����': ctxStatic + '/echarts/map/json/province/xizang.json',
    '����': ctxStatic + '/echarts/map/json/province/shanxi1.json',
    '����': ctxStatic + '/echarts/map/json/province/gansu.json',
    '�ຣ': ctxStatic + '/echarts/map/json/province/qinghai.json',
    '����': ctxStatic + '/echarts/map/json/province/ningxia.json',
    '�½�': ctxStatic + '/echarts/map/json/province/xinjiang.json',
    '����': ctxStatic + '/echarts/map/json/province/beijing.json',
    '���': ctxStatic + '/echarts/map/json/province/tianjin.json',
    '����': ctxStatic + '/echarts/map/json/province/chongqing.json',
    '���': ctxStatic + '/echarts/map/json/province/xianggang.json',
    '����': ctxStatic + '/echarts/map/json/province/aomen.json'
};

var data1 = [{ name: '����' }, { name: '���' }, { name: '�Ϻ�' }, { name: '����' }, { name: '�ӱ�' }, { name: '����' }, { name: '����' }, { name: '����' }, { name: '������' }, { name: '����' }, { name: '����' }, {
    name: 'ɽ��' }, { name: '�½�' }, { name: '����' }, { name: '�㽭' }, { name: '����' }, { name: '����' }, { name: '����' }, { name: '����' }, { name: 'ɽ��' }, { name: '���ɹ�' }, { name: '����' }, { name: '����' }, { name: '����'
}, { name: '����' }, { name: '�㶫' }, { name: '�ຣ' }, { name: '����' }, { name: '�Ĵ�' }, { name: '����' }, { name: '����' }, { name: '̨��' }, { name: '���' }, { name: '����' }];


for (var i = 0; i < data1.length; i++) {
    //data1[i].value = Math.round(Math.random() * 10000);
    data1[i].itemStyle = {
        normal: {
            areaColor: '#302b63'
        }
    }
}

var option = {
    title: {
        text: 'ȫ�����ֲ�                                   ɽ�����ֲ�',
        top: '0%',
        left: 'center'
    },
    tooltip: {
        //trigger: 'item'
        show: false
    },
    // toolbox: {
    //     show: true,
    //     orient: 'vertical',
    //     x: 'right',
    //     y: 'center',
    //     feature: {
    //         mark: {
    //             show: true
    //         },
    //         dataView: {
    //             show: true,
    //             readOnly: false
    //         }
    //     }
    // },
    // TODO 111111111111111111111111111111
    series: [{
        name: '����',
        type: 'map',
        mapType: 'china',
        left: 'left',
        top: '5%',
        width: '60%',
        height: '98%',
        roam: false,
        selectedMode: 'single',
        showLegendSymbol: false,
        itemStyle: {
            normal: {
                label: {
                    show: false
                }
            },
            emphasis: {
                label: {
                    show: false
                }
            }
        },
        data: data1
    }],
    animation: false
};

myChart8.setOption(option, true);

var data2 = [{ name: '������' }, { name: '������' }, { name: '�����' }, { name: '�Ϻ���' }, { name: '���' }, { name: '����' }, { name: '���������ɹ�������' }, { name: '�������' }, { name: '���ܵ���' }, { name: '�����յ���' }, { name: '����̩����' }, { name: '��ʲ����' }, { name: '���ǵ���' }, { name: '��������������' }, { name: '�������տ¶�����������' }, { name: '��³������' }, { name: '���������������' }, { name: '���������ɹ�������' }, { name: '��³ľ����' }, { name: '����������' }, { name: '��������' }, { name: 'ͼľ�����' }, { name: '�������' }, { name: 'ʯ������' }, { name: '��������' }, { name: '�������' }, { name: '�տ������' }, { name: '��֥����' }, { name: '��������' }, { name: 'ɽ�ϵ���' }, { name: '������' }, { name: '���ױ�����' }, { name: '��������' }, { name: '���ֹ�����' }, { name: '������˹��' }, { name: '�����' }, { name: '�����׶���' }, { name: 'ͨ����' }, { name: '�����첼��' }, { name: '�˰���' }, { name: '��ͷ��' }, { name: '���ͺ�����' }, { name: '�ں���' }, {
    name: '�����ɹ������������' }, { name: '��������������' }, { name: '�������������' }, { name: '���ϲ���������' }, { name: '��������������' }, { name: '���ϲ���������' }, { name: '��������' }, { name: '������' }, { name: '���β���������' }, { name: '���Ӳ���Ǽ��������' }, { name: '��ɽ����������' }, { name: '������' }, { name: '������' }, { name: '��Ԫ��' }, { name: '�Ű���' }, { name: '�˱���' }, { name: '��ɽ��' }, { name: '�ϳ���' }, { name: '������' }, { name: '������' }, { name: '�ɶ���' }, { name: '������' }, { name: '��֦����' }, { name: 'üɽ��' }, { name: '�㰲��' }, { name: '������' }, { name: '�ڽ���' }, { name: '������' }, { name: '�Թ���' }, { name: '�ں���' }, { name: '���˰������' }, { name: '��������' }, { name: '���������' }, { name: 'ĵ������' }, { name: '�绯��' }, { name: '������' }, { name: '��ľ˹��' }, { name: '������' }, { name: '˫Ѽɽ��' }, { name: '������' }, { name: '�׸���' }, { name: '��̨����' }, { name: '��Ȫ��' }, { name: '��Ҵ��' }, { name: '���ϲ���������' }, { name: '������' }, { name: '¤����' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��ˮ��' }, { name: '������' }, { name: 'ƽ����' }, { name: '���Ļ���������' }, { name: '�����' }, { name: '��������' }, { name: '�ն���' }, { name: '��ӹ���������������' }, {
    name: '��ɽ׳������������' }, { name: '������' }, { name: '��������������' }, { name: '�������������' }, { name: '�ٲ���' }, { name: '�������������' }, { name: '��ͨ��' }, { name: '������' }, { name: '������' }, { name: '��˫���ɴ���������' }, { name: '��ɽ��' }, { name: '��Ϫ��' }, { name: 'ŭ��������������' }, { name: '�º���徰����������' }, { name: '��ɫ��' }, { name: '�ӳ���' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '�����' }, { name: '���Ǹ���' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��������������������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��ɳ��' }, { name: '������' }, { name: '�żҽ���' }, { name: '¦����' }, { name: '��̶��' }, { name: '������' }, { name: '�Ӱ���' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: 'μ����' }, { name: '������' }, { name: '������' }, { name: 'ͭ����' }, { name: '��Զ��' }, { name: '�ع���' }, { name: 'տ����' }, { name: '÷����' }, { name: '��Դ��' }, { name: '������' }, { name: '������' }, { name: 'ï����' }, { name: '������' }, { name: '������' }, { name: '�Ƹ���' }, {
    name: '������' }, { name: '��β��' }, { name: '������' }, { name: '�麣��' }, { name: '��ɽ��' }, { name: '������' }, { name: '��ͷ��' }, { name: '������' }, { name: '��ݸ��' }, { name: '��ɽ��' }, { name: '�ӱ߳�����������' }, { name: '������' }, { name: '�׳���' }, { name: '��ԭ��' }, { name: '������' }, { name: '��ɽ��' }, { name: 'ͨ����' }, { name: '��ƽ��' }, { name: '��Դ��' }, { name: '�е���' }, { name: '�żҿ���' }, { name: '������' }, { name: '��ɽ��' }, { name: '������' }, { name: 'ʯ��ׯ��' }, { name: '��̨��' }, { name: '������' }, { name: '�ػʵ���' }, { name: '��ˮ��' }, { name: '�ȷ���' }, { name: '��ʩ����������������' }, { name: 'ʮ����' }, { name: '�˲���' }, { name: '�差��' }, { name: '�Ƹ���' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: 'Т����' }, { name: '�人��' }, { name: '��ʯ��' }, { name: '��ũ������' }, { name: '������' }, { name: '������' }, { name: 'Ǳ����' }, { name: '������' }, { name: '������' }, { name: 'ǭ�������嶱��������' }, { name: '�Ͻڵ���' }, { name: 'ǭ�ϲ���������������' }, { name: 'ͭ�ʵ���' }, { name: 'ǭ���ϲ���������������' }, { name: '����ˮ��' }, { name: '��˳��' }, { name: '������' }, {
    name: '��̨��' }, { name: '������' }, { name: 'Ϋ����' }, { name: '�ൺ��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '�ĳ���' }, { name: '��Ӫ��' }, { name: '������' }, { name: '̩����' }, { name: '������' }, { name: '������' }, { name: '�Ͳ���' }, { name: '��ׯ��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '�Ž���' }, { name: '������' }, { name: '�˴���' }, { name: '�ϲ���' }, { name: '��������' }, { name: 'Ƽ����' }, { name: 'ӥ̶��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: 'פ�����' }, { name: '�ܿ���' }, { name: '������' }, { name: '����Ͽ��' }, { name: '������' }, { name: 'ƽ��ɽ��' }, { name: '֣����' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '�����' }, { name: '�����' }, { name: '�����' }, { name: '�ױ���' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��˳��' }, { name: '��«����' }, { name: '������' }, { name: '������' }, { name: '��ɽ��' }, { name: '��Ϫ��' }, { name: 'Ӫ����' }, {
    name: '������' }, { name: '�̽���' }, { name: '������' }, { name: '������' }, { name: '�ٷ���' }, { name: '������' }, { name: '�˳���' }, { name: '��ͬ��' }, { name: '������' }, { name: '˷����' }, { name: '������' }, { name: '̫ԭ��' }, { name: '��Ȫ��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��ɽ��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '�Ϸ���' }, { name: '������' }, { name: '�ߺ���' }, { name: '������' }, { name: '������' }, { name: '��ɽ��' }, { name: 'ͭ����' }, { name: '��ƽ��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: 'Ȫ����' }, { name: '������' }, { name: '������' }, { name: '��ˮ��' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��ɽ��' }, { name: '̨����' }, { name: '����' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, {
    name: '�γ���' }, { name: '������' }, { name: '��ͨ��' }, { name: '������' }, { name: '������' }, { name: '��Ǩ��' }, { name: '���Ƹ���' }, { name: '������' }, { name: '�Ͼ���' }, { name: '̩����' }, { name: '������' }, { name: '������' }, { name: '����' }, { name: '������' }, { name: '������' }, { name: '��ԭ��' }, { name: '������' }, { name: 'ʯ��ɽ��' }, { name: '������' }, { name: '�Ĳ���' }, { name: '�ֶ�����������' }, { name: '������' }, { name: '������������������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '������' }, { name: '��ɳ����������' }, { name: '����' }, { name: '��������������' }, { name: '�ٸ���' }, { name: '��ˮ����������' }, { name: '�Ͳ���' }, { name: '������' }, { name: '��ͤ��������������' }, { name: '��ָɽ��' }];

// for (var i = 0; i < data2.length; i++) {
//     data2[i].value = Math.round(Math.random() * 1000);
// }
setTimeout(delay, 500);

function sdfsdfsfdsdfsdf(param) {
    var selectedProvince = param.name;
    var data = option.series[0].data;
    for (var key in data) {
        if (data[key].name === param.name) {
            data[key].itemStyle.normal.areaColor = 'green'
        } else {
            data[key].itemStyle.normal.areaColor = '#302b63'
        }
    }
    if (!provinces[selectedProvince]) {

        return;
    }

    $.ajax({
        url: provinces[selectedProvince],
        type: "get",
        dataType: "json",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (geoJson) {
            //echarts.registerMap(selectedProvince, geoJson);
            echarts.registerMap('province', geoJson);
            // TODO ���������λ�õ�������Ϣ��Ӧ���ǿ����ڹ����̨����
            var geoCoordMap = {"�������": [118.35, 35.05]};
            var max = 480,
                min = 9; // todo
            var maxSize4Pin = 100,
                minSize4Pin = 20;

            var convertData = function (data) {
                var res = [];
                for (var i = 0; i < data.length; i++) {
                    var geoCoord = geoCoordMap[data[i].name];
                    if (geoCoord) {
                        res.push({
                            name: data[i].name,
                            value: geoCoord.concat(data[i].value)
                        });
                    }
                }
                return res;
            };

            option.geo = {
                show: true,
                map: 'province',
                left: '60%',
                top: '30%',
                width: '35%',
                height: '50%',
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false,
                    }
                },
                roam: false,
                itemStyle: {
                    normal: {
                        areaColor: '#031525',
                        borderColor: '#3B5077',
                    },
                    emphasis: {
                        areaColor: '#2B91B7',
                    }
                }
            };

            option.series[2] = {
                name: 'credit',
                type: 'scatter',
                coordinateSystem: 'geo',
                data: convertData(data),
                symbolSize: function (val) {
                    return 10;
                },
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: false
                    },
                    emphasis: {
                        show: false
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#05C3F9'
                    }
                }
            };

            option.series[3] = {
                type: 'map',
                map: 'province',
                geoIndex: 0,
                aspectScale: 0.15, //�����
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false,
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                roam: false,
                itemStyle: {
                    normal: {
                        areaColor: '#031525',
                        borderColor: '#3B5077',
                    },
                    emphasis: {
                        areaColor: '#2B91B7'
                    }
                },
                animation: false,
                // data: d
            };
            // TODO 111111111111111111111111111111
            if (selectedProvince == 'ɽ��') {
                $.post(ctx + '/iot/iotWatermeterReport/indexMap', function (d) {
                    option.series[4] = {
                        name: '��',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbol: 'pin',
                        symbolSize: function (val) {
                            var a = (maxSize4Pin - minSize4Pin) / (max - min);
                            var b = minSize4Pin - a * min;
                            b = maxSize4Pin - a * max;
                            return 79;
                        },
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 16,
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#9900FF', //��־��ɫ
                            }
                        },
                        zlevel: 6,
                        data: convertData(d)
                    };
                    option.series[5] = {
                        name: '��',
                        type: 'effectScatter',
                        coordinateSystem: 'geo',
                        data: convertData(d.sort(function (a, b) {
                            return b.value - a.value;
                        }).slice(0, 5)),
                        symbolSize: function (val) {
                            return 10;
                        },
                        showEffectOn: 'render',
                        rippleEffect: {
                            brushType: 'stroke'
                        },
                        hoverAnimation: true,
                        label: {
                            normal: {
                                formatter: '{b}',
                                position: 'right',
                                show: true
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#05C3F9',
                                shadowBlur: 10,
                                shadowColor: '#05C3F9'
                            }
                        },
                        zlevel: 1
                    };
                    myChart8.setOption(option, true);
                })
            } else {
                option.series[4] = null
                option.series[5] = null
                myChart8.setOption(option, true);
            }


            /*option.visualMap = {
                seriesIndex: 1,
                orient: 'horizontal',
                left: 'right',
                min: 0,
                max: 1000,
                color: ['blue', 'green'],
                text: ['��', '��'], // �ı���Ĭ��Ϊ��ֵ�ı�
                splitNumber: 0
            };*/


        }
    });
}

function delay() {
    //myChart.on("mapselectchanged", function (param)
    myChart8.on("click", sdfsdfsfdsdfsdf);
}

sdfsdfsfdsdfsdf({name: 'ɽ��'});