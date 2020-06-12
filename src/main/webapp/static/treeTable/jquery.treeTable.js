/**
* �������
* @author benzhan (ղ����)
* @version 1.4.2
* @lastUpdateDate 2011-09-03
* @mail zhanchaojiang@qq.com
*/
(function ($) {
//	window.SITE_URL = window.SITE_URL || '';
//	if (document.location.href.indexOf('http://') != 0)	{
//		var path = '../themes/';
//	} else {
//		var path = SITE_URL + '/themes/';
//	}

    $.fn.treeTable = function (opts) {
        opts = $.extend({
        	path: '',
            theme: 'default',
            expandLevel: 1,
            column: 0,
            onSelect: function($treeTable, id){},
            beforeExpand: function($treeTable, id){}
        }, opts);

        var $treeTable = this;
        $treeTable.addClass('tree_table');

//        //�����Ҫ����ʽ
//        if ($('head').find('#tree_table_' + opts.theme).length == 0) {
//            $('head').append('<link id="tree_table_' + opts.theme + '" href="' + opts.path + 'themes/' + opts.theme + '/treeTable.css" rel="stylesheet" type="text/css" />');
//        }

        var css = {
            'N' : opts.theme + '_node',
            'AN' : opts.theme + '_active_node',
            'O' : opts.theme + '_open',
            'LO' : opts.theme + '_last_open',
            'S' : opts.theme + '_shut',
            'LS' : opts.theme + '_last_shut',
            'HO' : opts.theme + '_hover_open',
            'HS' : opts.theme + '_hover_shut',
            'HLO' : opts.theme + '_hover_last_open',
            'HLS' : opts.theme + '_hover_last_shut',
            'L' : opts.theme + '_leaf',
            'LL' : opts.theme + '_last_leaf',
            'B' : opts.theme + '_blank',
            'V' : opts.theme + '_vertline'
        };

        var pMap = {}, cMap = {};
        var $trs = $treeTable.find('tr');
        initRelation($trs, true);    

        $treeTable.click(function (event) {
            var $target = $(event.target);

            if ($target.attr('controller')) {
                $target = $target.parents('tr[haschild]').find('[arrow]');
                //�ж��Ƿ���Ҷ�ӽڵ�
				if ($target.attr('class').indexOf(css['AN']) == -1 && $target.attr('class').indexOf(css['N']) == -1) { return; }
                var id = $target.parents('tr[haschild]')[0].id;
                if (opts.onSelect && opts.onSelect($treeTable, id) === false) { return; }
            }

            if ($target.attr('arrow')) {
                var className = $target.attr('class');
                if (className == css['AN'] + ' ' + css['HLO'] || className == css['AN'] + ' ' + css['HO']) {
                    var id = $target.parents('tr[haschild]')[0].id;
                    $target.attr('class', css['AN'] + " " + (className.indexOf(css['HO']) != -1 ?  css['HS'] : css['HLS']));

                    //�ر����к��ӵ�tr
                    shut(id);
					return;
                } else if (className == css['AN'] + ' ' + css['HLS'] || className == css['AN'] + ' ' + css['HS']) {
                    var id = $target.parents('tr')[0].id;
                    $target.attr('class', css['AN'] + " " + (className.indexOf(css['HS']) != -1 ? css['HO'] : css['HLO']));
                    
                    opts.beforeExpand($treeTable, id);
                    //չ������ֱ���ڵ㣬����ͼ��չ������ڵ�
                    open(id);
					return;
                }
            }
        });
		
		$treeTable.mouseover(hoverActiveNode).mouseout(hoverActiveNode);

        function hoverActiveNode(event) {
            var $target = $(event.target);

            if ($target.attr('controller')) {
                $target = $target.parents('tr[haschild]').find('[arrow]');
            }

            if ($target.attr('arrow')) { 
                var className = $target.attr('class');
                if (className && !className.indexOf(css['AN'])) {
                    var len = opts.theme.length + 1;
                    className = className.split(' ')[1].substr(len);
                    if (className.indexOf('hover_') === 0) {
                        className = opts.theme + '_' + className.substr(6);
                    } else {
                        className = opts.theme + '_hover_' + className;
                    }
                    
                    $target.attr('class', css['AN'] + ' ' + className);
                    return;
                }
            } 
        }
        
        /** ��ʼ���ڵ��ϵ��*/
        function initRelation($trs, hideLevel) {
            //���츸�ӹ�ϵ
            $trs.each(function (i) {
                var pId = $(this).attr('pId') || 0;
                pMap[pId] || (pMap[pId] = []);
                pMap[pId].push(this.id);
                cMap[this.id] = pId;
                
                //�����tr������Ϊ�����ѡ������Ч��
                $(this).addClass(pId);
            }).find('[controller]').css('cursor', 'pointer');

            //��ʶ���ڵ��Ƿ��к��ӡ��Ƿ����һ���ڵ�
            $trs.each(function (i) {
                if (!this.id) { return; }
                var $tr = $(this);
                
                pMap[this.id] && $tr.attr('hasChild', true);
                var pArr = pMap[cMap[this.id]];
                if (pArr[0] == this.id) {
                    $tr.attr('isFirstOne', true);
                } else {
                    var prevId = 0;
                    for (var i = 0; i < pArr.length; i++) {
                        if (pArr[i] == this.id) { break; }
                        prevId = pArr[i];
                    }
                    $tr.attr('prevId', prevId);
                }

                pArr[pArr.length - 1] == this.id && $tr.attr('isLastOne', true);

                var depth = getDepth(this.id);
                $tr.attr('depth', depth);

                //��ʽ���ڵ�
				formatNode(this);

                //�ж��Ƿ�Ҫ�������ƵĲ��
                if (hideLevel) {
                    depth > opts.expandLevel && $tr.hide();
                    //�ж��Ƿ�С����ȣ����С�������Ҫ����չ����ͼ��
                    if ($tr.attr('hasChild') && $tr.attr('depth') < opts.expandLevel) {
                        var className = $tr.attr('isLastOne') ? css['LO'] : css['O'];
                        $tr.find('.' + css['AN']).attr('class', css['AN'] + ' ' + className);
                    }
                }               
            });
            
            //�ݹ��ȡ���
            function getDepth(id) {
                if (cMap[id] == 0) { return 1; } 
                var $parentDepth = getDepth(cMap[id]);
                return $parentDepth + 1; 
            }
        }

        //�ݹ�ر����еĺ���
        function shut(id) {
            if (!pMap[id]) { return false; }
            for (var i = 0; i < pMap[id].length; i++) {
                shut(pMap[id][i]);
            }
            $('tr.' + id, $treeTable).hide();
        }

        //������ʷ��¼��չ���ڵ�
        function open(id) {
            $('tr.' + id, $treeTable).show();
            if (!pMap[id]) { return false; }
            for (var i = 0; i < pMap[id].length; i++) {
                var cId = pMap[id][i];
                if (pMap[cId]) {
                    var className = $('#' + cId, $treeTable).find('.' + css['AN']).attr('class');
                    //����ӽڵ���չ��ͼ��ģ�����Ҫչ���˽ڵ�
                    (className == css['AN'] + ' ' + css['O'] || className == css['AN'] + ' ' + css['LO']) && open(cId);
                }
            }
        }

        function formatNode(tr) {
            var $cur = $(tr);
            var id = tr.id;

            //-------------����һ��ζ��ǻ�ȡ$preSpan---------
            if (cMap[id] == 0) {
                //����Ƕ����ڵ㣬��û��prev_sp
                var $preSpan = $('<span class="prev_sp"></span>');
            } else {
                //���ж��Ƿ�����һ���ֵܽڵ�
                if (!$cur.attr('isFirstOne')) {
                    var $preSpan = $('#' + $cur.attr('prevId'), $treeTable).children("td").eq(opts.column).find('.prev_sp').clone();
                } else {
                    var $parent = $('#' + cMap[id], $treeTable);
                    //û����һ���ֵܽڵ㣬��ʹ�ø��ڵ��prev_sp
                    var $preSpan = $parent.children("td").eq(opts.column).find('.prev_sp').clone();

                    //������׺���û���ֵܣ���ֱ�Ӽӿհף������������
                    if ($parent.attr('isLastOne')) {
                        $preSpan.append('<span class="' + css['N'] + ' ' + css['B'] + '"></span>');
                    } else {
                        $preSpan.append('<span class="' + css['N'] + ' ' + css['V'] + '"></span>');
                    }
                }
            }
            //------------------------------------------------

            if ($cur.attr('hasChild')) {
                //�������һ���ڵ㣬������һ���ڵ�ĸ����뵱ǰ�ڵ�ĸ�����ͬ����˵���ýڵ㲻�����һ���ڵ�
                var className = $cur.attr('isLastOne') ? css['LS'] : css['S'];
                className = css['AN'] + ' ' + className;
            } else {
                var className = css['N'] + ' ' + ($cur.attr('isLastOne') ? css['LL'] : css['L']);
            }
            
            var $td = $cur.children("td").eq(opts.column);
            $td.prepend('<span arrow="true" class="' + className + '"></span>').prepend($preSpan);
        };
        
        $treeTable.addChilds = function(trsHtml) {
            var $trs = $(trsHtml);
            if (!$trs.length) { return false; }
            
            var pId = $($trs[0]).attr('pId');
            if (!pId) { return false; }
            
            //���뵽���һ�����Ӻ��棬����ֱ�Ӳ��ڸ��ڵ����
            var insertId = pMap[pId] && pMap[pId][pMap[pId].length - 1] || pId;
            $('#' + insertId, $treeTable).after($trs);
            initRelation($trs);
        };

        return $treeTable;
    };
})(jQuery);

