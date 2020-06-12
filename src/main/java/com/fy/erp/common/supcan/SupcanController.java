/**
 *
 */
package com.fy.erp.common.supcan;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.fy.erp.common.config.Global;
import com.fy.erp.common.supcan.annotation.treelist.SupTreeList;
import com.fy.erp.common.supcan.treelist.TreeList;
import com.fy.erp.common.utils.SpringContextHolder;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.fy.erp.common.supcan.annotation.treelist.cols.SupCol;
import com.fy.erp.common.supcan.annotation.treelist.cols.SupGroup;
import com.fy.erp.common.supcan.treelist.cols.Col;
import com.fy.erp.common.supcan.treelist.cols.Group;
import com.fy.erp.common.utils.CacheUtils;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.common.web.BaseController;

/**
 * ˶��Controller
 * @author ThinkGem
 * @version 2013-11-13
 */
@Controller
@RequestMapping(value = "${adminPath}/supcan")
public class SupcanController extends BaseController {

	private static final String SUPCAN_CACHE = "supcanCache";
	
	/**
	 * ��ȡ˶�����б�����������ע���ȡXML��
	 * @return
	 */
	@RequestMapping(value = "treeList/{typeAlias}.xml")
	@ResponseBody
	public TreeList treeList(@PathVariable("typeAlias") String typeAlias) {
		
		// ���ʹ��Cache��������Cache����ڣ���ֱ�ӷ��ء�
		boolean useCache = Global.getConfig("supcan.useCache") == "true";
		if (useCache){
			Object object = CacheUtils.get(SUPCAN_CACHE, typeAlias);
			if (object != null){
				return (TreeList)object;
			}
		}
		
		// ʵ������
		Class<?> clazz;
		
		try{
			// ���ݱ�����ȡMyBaitsע�����͡�
			SqlSessionFactory sqlSessionFactory = SpringContextHolder.getBean(SqlSessionFactory.class);
			clazz = sqlSessionFactory.getConfiguration().getTypeAliasRegistry().resolveAlias(typeAlias);
		}catch (Exception e) {
			// ȡ�������ͣ����ؿա�
			return null;
		}
		
		// ��ȡ˶��ע������
		SupTreeList supTreeList = clazz.getAnnotation(SupTreeList.class);

		// û��˶��ע�����ã��򷵻ؿ�
		if (supTreeList == null){
			return null;
		}
		
		// ʵ����˶�����б����
		TreeList treeList = new TreeList(supTreeList);
		
		// ��ȡ��ͷ����
		Map<String, Group> groupMap = Maps.newHashMap();
		if (supTreeList !=null && supTreeList.groups() != null){
			for (SupGroup supGroup : supTreeList.groups()){
				groupMap.put(supGroup.id(), new Group(supGroup));
			}
		}
		
		// ��ȡ��ͷ��
		List<Object> cols = treeList.getCols();
		for (Method m : clazz.getMethods()){
			SupCol supCol = m.getAnnotation(SupCol.class);
			if (supCol != null){
				
				// תΪΪCol����
				Col col = new Col(supCol);
				if (StringUtils.isBlank(col.getName())){
					col.setName(StringUtils.uncapitalize(StringUtils.substring(m.getName(), 3)));
				}
				
				// �޷���
				if (StringUtils.isBlank(supCol.groupId())){
					cols.add(col);
				}
				// �з���
				else{
					Group group = groupMap.get(supCol.groupId());
					if (group != null){
						group.getCols().add(col);
					}
				}
			}
		}
		
		// �����ֶ�������
		Comparator<Object> comparator = new Comparator<Object>() {
			@Override
			public int compare(Object o1, Object o2) {
				int sort1 = 0, sort2 = 0;
				if (o1 instanceof Group){
					sort1 = ((Group)o1).getSort();
				}else if (o1 instanceof Col){
					sort1 = ((Col)o1).getSort();
				}
				if (o2 instanceof Group){
					sort2 = ((Group)o2).getSort();
				}else if (o2 instanceof Col){
					sort2 = ((Col)o2).getSort();
				}
				return new Integer(sort1).compareTo(new Integer(sort2));
			}
		};

		// ���б�ת��Ϊ���ṹ������
		listToTree(cols, groupMap, null, comparator);
		
		// ��������
		Collections.sort(cols, comparator);

		// ���ʹ��Cache���򱣴浽Cache
		if (useCache){
			CacheUtils.put(SUPCAN_CACHE, typeAlias, treeList);
		}
		
		return treeList;
	}
	
	/**
	 * ������ת��Ϊ���ṹ
	 * @param list
	 * @param groupMap
	 * @param parentId
	 */
	private void listToTree(List<Object> colList, Map<String, Group> groupMap, String parentId, Comparator<Object> comparator){
		for (Map.Entry<String, Group> e : groupMap.entrySet()){
			Group g = e.getValue();
			if (StringUtils.equals(parentId, g.getParentId())){
				colList.add(g);
				// �ж��Ƿ����ӽڵ㣬�еĻ���ӽ�ȥ
				for (Map.Entry<String, Group> ec : groupMap.entrySet()){
					Group gc = ec.getValue();
					if (g.getId() != null && g.getId().equals(gc.getParentId())){
						List<Object> childrenList = Lists.newArrayList();
						listToTree(childrenList, groupMap, gc.getParentId(), comparator);
						g.getCols().addAll(childrenList);
						break;
					}
				}
				// ����
				Collections.sort(g.getCols(), comparator);
			}
		}
	}
	
	/**
	 * ��ȡ˶�����б�������ע����󷽷���ȡXML��  ����ʵ��
	 * @return
	 */
	@RequestMapping(value = "treeList/test/test.xml")
	@ResponseBody
	public TreeList treeListTest() {

		// �������б���������
		TreeList treeList = new TreeList();
		
		// �������б���ͷ
		List<Object> cols = treeList.getCols();
		cols.add(new Col("id", "���"));
		cols.add(new Col("office", "��������"));
		cols.add(new Col("loginName", "��¼��"));
		cols.add(new Col("name", "����"));
		cols.add(new Col("remarks", "��ע"));
		
		// �������б�����ͷ
		
		// ����1
		Group group = new Group("ʱ��");
		List<Object> groupCol = group.getCols();
		groupCol.add(new Col("createDate", "����ʱ��"));
		groupCol.add(new Col("updateDate", "����ʱ��"));
		
		// ����2
		Group group2 = new Group("ʱ��2");
		List<Object> group2Col = group2.getCols();
		group2Col.add(new Col("createDate2", "����ʱ��2"));
		group2Col.add(new Col("updateDate2", "����ʱ��2"));
		
		// ������2��ӵ�������1�ı�ͷ
		groupCol.add(group2);

		// ������1��ӵ�������ͷ
		cols.add(group);
		
		// ����TreeList��������
		return treeList;
	}
}
