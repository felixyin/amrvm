/*!
 * 
 * 
 * ˶�������װ
 * @author ThinkGem
 * @version 2013-11-09
 */

/**
 * ˶��ʵ����������
 */
var supcans = [];

/**
 * ʵ����һ��˶���ؼ����ѷ�������ɾ����
 * @param AF ˶������
 * @param url ˶�������ļ�URL���������һ��URL������дʵ������
 * @param options ����ѡ��
 * @returns {Supcan} ˶����װ����ʵ��
 */
function supcan(AF, url, options){
	var su = new Supcan(AF, url, options);
	supcans.push(su);
	return su;
}

/**
 * ˶���ؼ����أ�id����˵�������ҳ�����ж�����/�������ôOnReady�¼��ᱻ������Σ�id���ǲ��/�������id
 */
function OnReady(id){
	for (i=0; i<supcans.length; i++){
		if (supcans[i].AF.id == id){
			supcans[i].init(supcans[i].url);
			supcans[i].options.ready();
		}
	}
}

/**
 * ˶���ؼ��¼�������˵��: ��Event��Ϊ�¼�����p1,p2,p3,p4�������ض��ĺ��壬�ɾ���Ĺ�������涨.
 */
function OnEvent(id, Event, p1, p2, p3, p4){
	for (i=0; i<supcans.length; i++){
		if (supcans[i].AF.id == id){
			supcans[i].options.event(Event, p1, p2, p3, p4);
		}
	}
}

/**
 * ˶�������װ��
 * @param AF ˶������
 * @param url ˶�������ļ�URL
 * @param options ѡ��
 */
function Supcan(AF, url, options){
	
	var $this = this;
	
	/**
	 * ˶��ԭʼ����
	 */
	$this.AF = AF;
	
	/**
	 * ˶�������ļ�URL���������һ��URL������дʵ������
	 */
	if (url.indexOf('/') == -1){
		$this.url = ctx + '/supcan/treeList/' + url + '.xml';
	}else{
		$this.url = url;
	}
	
	/**
	 * ˶���������ѡ��
	 */
	$this.options = $.extend({
		su: $this,			// ��ǰ˶������
		checked: true,		// �Ƿ���븴ѡ��
		curSelMode: "rows",	// ��ѡ��ģʽ��row����ѡ��rows����ѡ��excel��Excelѡ��ģʽ��
		dataType: "json",	// �������ͣ�����������Ͳ���json����This.data���Զ�ת��Ϊ���󣬷�ҳ����Ҳ���Զ���ֵ
		height: "auto",			// �ؼ��߶ȣ�Ĭ������Ӧ��
		body: "body",			// �ؼ��߶�����Ӧ����ض���
		ready: function(){},	// Ĭ�ϵĿؼ����ص��÷���
		event: function(){}		// Ĭ�ϵĿؼ��¼����÷���
    }, options);
	
	/**
	 * ˶�����ݶ������dataTypeΪjson����ΪJSON���󣬷���Ϊ�����ַ���
	 */
	$this.data = "";

	/**
	 * ����˶�����ú���
	 */
	$this.func = function(name, param){
		return $this.AF.func(name, param);
	}
	
	/**
	 * ˶���ؼ��Զ��߶�
	 */
	$this.autoHeight = function(){
		var supcanDiv = $($this.AF).parent(), height = 0;
		$($this.options.body).each(function(){
			height += $(this).height();
		});
		$(supcanDiv).height($(window).height() + $(supcanDiv).height() - height - 10);
	}
	
	/**
	 * ��ʼ������
	 * @param url �����ļ�URL
	 */
	$this.init = function(url){
		// ����ؼ�
		$this.func("Build", url);
		// �ڵ�һ��λ�ò��븴ѡ����
		if ($this.options.checked){
			$this.func("InsertCol", "0\r\nname=checked;isCheckboxOnly=true");
		}
		// ����ѡ��(curselmode="rows")״̬�µı�����ʽ
		if ($this.options.curSelMode){
			$this.func("SetProp", "curSelMode \r\n " + $this.options.curSelMode);
		}
		// ����Ӧ�и�
		if ($this.options.height == "auto"){
			$(window).resize(function(){
				$this.autoHeight();
			});
			$this.autoHeight();
		}else{
			$($this.AF).parent().height($this.options.height);
		}
	}
	
	/**
	 * ��������
	 * @param dataUrl ���ݵ���URL
	 * @param paramString �����ַ���
	 * @param pareDiv ��ҳDIV��ID��������ݸ�ʽΪJSON�����Զ����÷�ҳ�����롣
	 */
	$this.load = function(dataUrl, paramString, callback){
		$.post(dataUrl, paramString, function(data){
			$this.func("Load", data);
			if ($this.options.dataType == "json"){
				// ת��ΪJSON���󣬱��浽data����
				$this.data = eval("("+data+")");
			}else{
				$this.data = data;
			}
			if (typeof callback == 'function'){
				callback($this.data);
			}
		}, "text");
    }
	
	/**
	 * ��������
	 * @param form ���������Զ����л����ֶΣ���������URL��
	 * @param page ��ҳDIV��������ݸ�ʽΪJSON�����Զ����÷�ҳ�����롣
	 */
	$this.loadByForm = function(form, page){
		$this.load($(form).attr('action'), $(form).serialize(), function(data){
			// ���÷�ҳ����
			if ($this.options.dataType == "json" && data != ''){
				$(form+"[name=pageNo]").val(data.pageNo);
				$(form+"[name=pageSize]").val(data.pageSize);
				$(page).html(data.html);
				// ����ȥ�����
				$(page).find("a").bind("focus",function() {
					if(this.blur) {this.blur()};
				});
			}
		});
		
    }

	/**
	 * ��ȡ��Ԫ������
	 * @param columnName �б�����
	 * @param isMany �Ƿ�֧�ֶ�ѡ����ȡ���ֵ
	 */
	$this.getCellText = function(columnName, isMany){
		var rowIdxs = $this.func("GetCurrentRow", "");
		if(rowIdxs != ''){
			rowIdxs = rowIdxs.split(',');
			if (isMany){
				var vals = [];
				for (i=0; i<rowIdxs.length; i++){
					vals.push($this.func("GetCellText", rowIdxs[i] + " \r\n " + columnName));
				}
				return vals.join(',');
			}else{
				if (rowIdxs.length == 1){
					return $this.func("GetCellText", rowIdxs[0] + " \r\n " + columnName);
				}
			}
		}
		return "";
	}
	
	/**
	 * �л���������ʾ�����ù�ѡ�к͵�һ��(����������)�ϲ���ʾ
	 */
	$this.setTree = function(flag){
		$this.func("SetProp", "curSelMode \r\n row"+(flag?"":"s"));
		$this.func("SetColProp", "checked \r\n TreeCombine \r\n "+(flag?"auto,node":"")); // �ϲ���Ԫ��
		$this.func("SetProp", "isTree \r\n "+(flag?"true":"false"));
	}
	
	/**
	 * ʹ˶���ؼ���Ϊ��ɫ
	 */
	$this.setGrayWindow = function(trueOrFalse){
		$this.func("GrayWindow", trueOrFalse ? "1" : "0");
	}

	return $this;
}