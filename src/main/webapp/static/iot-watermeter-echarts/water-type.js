var myChart = echarts.init(document.getElementById('main2'));
myChart.hideLoading();

var obama_budget_2012 = {
    "budget2012List": [
        961,
        1502,
        1110,
        1849,
        848,
        1136,
        683,
        781,
        1299,
        1370,
        1171,
        1252,
        1465,
        1761,
        1204,
        708,
        491,
        889,
        1701,
        1362,
        1916,
        602,
        1221,
        1034,
        620,
        1697,
        1342,
        1804,
        1065,
        1058,
        1453,
        1292,
        1176,
        451,
        1875,
        1001,
        746,
        1982,
        360,
        714,
        419,
        1721,
        1428,
        1037,
        516,
        1527,
        478,
        522,
        1993,
        1094,
        1299,
        360,
        746,
        1232,
        817,
        847
    ],
    "budget2011List": [
        1423,
        1705,
        638,
        1727,
        925,
        667,
        1471,
        463,
        464,
        379,
        546,
        440,
        1337,
        1642,
        303,
        1625,
        971,
        1215,
        721,
        1307,
        398,
        1277,
        405,
        962,
        1231,
        334,
        776,
        796,
        421,
        1500,
        1272,
        972,
        645,
        1816,
        1615,
        430,
        1716,
        1573,
        1872,
        1668,
        503,
        1446,
        1748,
        913,
        1380,
        550,
        568,
        774,
        784,
        1511,
        1485,
        1699,
        609,
        421,
        1536,
        1523
    ],
    "names": [
        "��1��",
        "��2��",
        "��3��",
        "��4��",
        "��5��",
        "��6��",
        "��7��",
        "��8��",
        "��9��",
        "��10��",
        "��11��",
        "��12��",
        "��13��",
        "��14��",
        "��15��",
        "��16��",
        "��17��",
        "��18��",
        "��19��",
        "��20��",
        "��21��",
        "��22��",
        "��23��",
        "��24��",
        "��25��",
        "��26��",
        "��27��",
        "��28��",
        "��29��",
        "��30��",
        "��31��",
        "��32��",
        "��33��",
        "��34��",
        "��35��",
        "��36��",
        "��37��",
        "��38��",
        "��39��",
        "��40��",
        "��41��",
        "��42��",
        "��43��",
        "��44��",
        "��45��",
        "��46��",
        "��47��",
        "��48��",
        "��49��",
        "��50��",
        "��51��",
        "��52��",
        "��53��",
        "��54��",
        "��55��",
        "��56��"
    ]
};

option = {
    title: {
        text: '��ˮ����'
    },
    legend: {
        data: ['Growth', '����', '����'],
        itemGap: 5,
        tooltip: {
            show: true
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
            data: obama_budget_2012.names
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
            start: 94,
            end: 100,
            handleSize: 8
        },
        {
            type: 'inside',
            start: 94,
            end: 100
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
            left: '93%'
        }
    ],
    series: [
        {
            name: '����',
            type: 'line',
            data: obama_budget_2012.budget2011List
        },
        {
            name: '����',
            type: 'bar',
            data: obama_budget_2012.budget2012List
        }
    ]
};

myChart.setOption(option);

var KEY_CODE = -1;
$(document).on('keydown', function (evt) {
    KEY_CODE = evt.keyCode;
}).on('keyup', function () {
    KEY_CODE = -1;
});

/*
// -------ȫ��ͨ��
REFRESH: 'refresh',
RESTORE: 'restore',
RESIZE: 'resize',
CLICK: 'click',
DBLCLICK: 'dblclick',
HOVER: 'hover',
MOUSEOUT: 'mouseout',
// -------ҵ�񽻻��߼�
DATA_CHANGED: 'dataChanged',
DATA_ZOOM: 'dataZoom',
DATA_RANGE: 'dataRange',
DATA_RANGE_HOVERLINK: 'dataRangeHoverLink',
LEGEND_SELECTED: 'legendSelected',
LEGEND_HOVERLINK: 'legendHoverLink',
MAP_SELECTED: 'mapSelected',
PIE_SELECTED: 'pieSelected',
MAGIC_TYPE_CHANGED: 'magicTypeChanged',
DATA_VIEW_CHANGED: 'dataViewChanged',
TIMELINE_CHANGED: 'timelineChanged',
MAP_ROAM: 'mapRoam',
*/
myChart.on('legendselectchanged', function (param) {
    // console.log(param);
    if (param.selected[param.name]) {
        if (KEY_CODE === 18) {
            console.log('��ȡͼ��');
            return;
        }
    }
});

