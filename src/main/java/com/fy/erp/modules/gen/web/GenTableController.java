/**
 *
 */
package com.fy.erp.modules.gen.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fy.erp.common.persistence.Page;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.common.web.BaseController;
import com.fy.erp.modules.gen.service.GenTableService;
import com.fy.erp.modules.sys.entity.User;
import com.fy.erp.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fy.erp.modules.gen.entity.GenTable;
import com.fy.erp.modules.gen.util.GenUtils;

/**
 * ҵ���Controller
 * @author ThinkGem
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genTable")
public class GenTableController extends BaseController {

	@Autowired
	private GenTableService genTableService;
	
	@ModelAttribute
	public GenTable get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genTableService.get(id);
		}else{
			return new GenTable();
		}
	}
	
	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = {"list", ""})
	public String list(GenTable genTable, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			genTable.setCreateBy(user);
		}
        Page<GenTable> page = genTableService.find(new Page<GenTable>(request, response), genTable);
        model.addAttribute("page", page);
		return "modules/gen/genTableList";
	}

	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = "form")
	public String form(GenTable genTable, Model model) {
		// ��ȡ������б�
		List<GenTable> tableList = genTableService.findTableListFormDb(new GenTable());
		model.addAttribute("tableList", tableList);
		// ��֤���Ƿ����
		if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())){
			addMessage(model, "��һ��ʧ�ܣ�" + genTable.getName() + " ���Ѿ���ӣ�");
			genTable.setName("");
		}
		// ��ȡ������ֶ�
		else{
			genTable = genTableService.getTableFormDb(genTable);
		}
		model.addAttribute("genTable", genTable);
		model.addAttribute("config", GenUtils.getConfig());
		return "modules/gen/genTableForm";
	}

	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "save")
	public String save(GenTable genTable, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, genTable)){
			return form(genTable, model);
		}
		// ��֤���Ƿ��Ѿ�����
		if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())){
			addMessage(model, "����ʧ�ܣ�" + genTable.getName() + " ���Ѿ����ڣ�");
			genTable.setName("");
			return form(genTable, model);
		}
		genTableService.save(genTable);
		addMessage(redirectAttributes, "����ҵ���'" + genTable.getName() + "'�ɹ�");
		return "redirect:" + adminPath + "/gen/genTable/?repage";
	}
	
	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "delete")
	public String delete(GenTable genTable, RedirectAttributes redirectAttributes) {
		genTableService.delete(genTable);
		addMessage(redirectAttributes, "ɾ��ҵ���ɹ�");
		return "redirect:" + adminPath + "/gen/genTable/?repage";
	}

}
