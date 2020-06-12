/**
 *
 */
package com.fy.erp.modules.gen.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

import com.fy.erp.common.config.Global;
import com.fy.erp.common.utils.DateUtils;
import com.fy.erp.common.utils.FreeMarkers;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.modules.sys.entity.Area;
import com.fy.erp.modules.sys.entity.Office;
import com.fy.erp.modules.sys.entity.User;
import com.fy.erp.modules.sys.utils.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.fy.erp.common.mapper.JaxbMapper;
import com.fy.erp.common.utils.FileUtils;
import com.fy.erp.modules.gen.entity.GenCategory;
import com.fy.erp.modules.gen.entity.GenConfig;
import com.fy.erp.modules.gen.entity.GenScheme;
import com.fy.erp.modules.gen.entity.GenTable;
import com.fy.erp.modules.gen.entity.GenTableColumn;
import com.fy.erp.modules.gen.entity.GenTemplate;

/**
 * �������ɹ�����
 *
 * @author ThinkGem
 * @version 2013-11-16
 */
public class GenUtils {

    private static Logger logger = LoggerFactory.getLogger(GenUtils.class);

    /**
     * ��ʼ���������ֶ�
     *
     * @param genTable
     */
    public static void initColumnField(GenTable genTable) {
        for (GenTableColumn column : genTable.getColumnList()) {

            // ����ǲ��������У���������
            if (StringUtils.isNotBlank(column.getId())) {
                continue;
            }

            // �����ֶ�˵��
            if (StringUtils.isBlank(column.getComments())) {
                column.setComments(column.getName());
            }

            // ����java����
            if (StringUtils.startsWithIgnoreCase(column.getJdbcType(), "CHAR")
                    || StringUtils.startsWithIgnoreCase(column.getJdbcType(), "VARCHAR")
                    || StringUtils.startsWithIgnoreCase(column.getJdbcType(), "NARCHAR")) {
                column.setJavaType("String");
            } else if (StringUtils.startsWithIgnoreCase(column.getJdbcType(), "DATETIME")
                    || StringUtils.startsWithIgnoreCase(column.getJdbcType(), "DATE")
                    || StringUtils.startsWithIgnoreCase(column.getJdbcType(), "TIMESTAMP")) {
                column.setJavaType("java.util.Date");
                column.setShowType("dateselect");
            } else if (StringUtils.startsWithIgnoreCase(column.getJdbcType(), "BIGINT")
                    || StringUtils.startsWithIgnoreCase(column.getJdbcType(), "NUMBER")) {
                // ����Ǹ�����
                String[] ss = StringUtils.split(StringUtils.substringBetween(column.getJdbcType(), "(", ")"), ",");
                if (ss != null && ss.length == 2 && Integer.parseInt(ss[1]) > 0) {
                    column.setJavaType("Double");
                }
                // ���������
                else if (ss != null && ss.length == 1 && Integer.parseInt(ss[0]) <= 10) {
                    column.setJavaType("Integer");
                }
                // ������
                else {
                    column.setJavaType("Long");
                }
            }

            // ����java�ֶ���
            column.setJavaField(StringUtils.toCamelCase(column.getName()));

            // �Ƿ�������
            column.setIsPk(genTable.getPkList().contains(column.getName()) ? "1" : "0");

            // �����ֶ�
            column.setIsInsert("1");

            // �༭�ֶ�
            if (!StringUtils.equalsIgnoreCase(column.getName(), "id")
                    && !StringUtils.equalsIgnoreCase(column.getName(), "create_by")
                    && !StringUtils.equalsIgnoreCase(column.getName(), "create_date")
                    && !StringUtils.equalsIgnoreCase(column.getName(), "del_flag")) {
                column.setIsEdit("1");
            }

            // �б��ֶ�
            if (StringUtils.equalsIgnoreCase(column.getName(), "name")
                    || StringUtils.equalsIgnoreCase(column.getName(), "title")
                    || StringUtils.equalsIgnoreCase(column.getName(), "remarks")
                    || StringUtils.equalsIgnoreCase(column.getName(), "update_date")) {
                column.setIsList("1");
            }

            // ��ѯ�ֶ�
            if (StringUtils.equalsIgnoreCase(column.getName(), "name")
                    || StringUtils.equalsIgnoreCase(column.getName(), "title")) {
                column.setIsQuery("1");
            }

            // ��ѯ�ֶ�����
            if (StringUtils.equalsIgnoreCase(column.getName(), "name")
                    || StringUtils.equalsIgnoreCase(column.getName(), "title")) {
                column.setQueryType("like");
            }

            // �����ض����ͺ��ֶ���

            // �û�
            if (StringUtils.startsWithIgnoreCase(column.getName(), "user_id")) {
                column.setJavaType(User.class.getName());
                column.setJavaField(column.getJavaField().replaceAll("Id", ".id|name"));
                column.setShowType("userselect");
            }
            // ����
            else if (StringUtils.startsWithIgnoreCase(column.getName(), "office_id")) {
                column.setJavaType(Office.class.getName());
                column.setJavaField(column.getJavaField().replaceAll("Id", ".id|name"));
                column.setShowType("officeselect");
            }
            // ����
            else if (StringUtils.startsWithIgnoreCase(column.getName(), "area_id")) {
                column.setJavaType(Area.class.getName());
                column.setJavaField(column.getJavaField().replaceAll("Id", ".id|name"));
                column.setShowType("areaselect");
            }
            // �����ߡ�������
            else if (StringUtils.startsWithIgnoreCase(column.getName(), "create_by")
                    || StringUtils.startsWithIgnoreCase(column.getName(), "update_by")) {
                column.setJavaType(User.class.getName());
                column.setJavaField(column.getJavaField() + ".id");
            }
            // ����ʱ�䡢����ʱ��
            else if (StringUtils.startsWithIgnoreCase(column.getName(), "create_date")
                    || StringUtils.startsWithIgnoreCase(column.getName(), "update_date")) {
                column.setShowType("dateselect");
            }
            // ��ע������
            else if (StringUtils.equalsIgnoreCase(column.getName(), "remarks")
                    || StringUtils.equalsIgnoreCase(column.getName(), "content")) {
                column.setShowType("textarea");
            }
            // ����ID
            else if (StringUtils.equalsIgnoreCase(column.getName(), "parent_id")) {
                column.setJavaType("This");
                column.setJavaField("parent.id|name");
                column.setShowType("treeselect");
            }
            // ���и���ID
            else if (StringUtils.equalsIgnoreCase(column.getName(), "parent_ids")) {
                column.setQueryType("like");
            }
            // ɾ�����
            else if (StringUtils.equalsIgnoreCase(column.getName(), "del_flag")) {
                column.setShowType("radiobox");
                column.setDictType("del_flag");
            }
        }
    }

    /**
     * ��ȡģ��·��
     *
     * @return
     */
    public static String getTemplatePath() {
        try {
            File file = new DefaultResourceLoader().getResource("").getFile();
            if (file != null) {
                return file.getAbsolutePath() + File.separator + StringUtils.replaceEach(GenUtils.class.getName(),
                        new String[]{"util." + GenUtils.class.getSimpleName(), "."}, new String[]{"template", File.separator});
            }
        } catch (Exception e) {
            logger.error("{}", e);
        }

        return "";
    }

    /**
     * XML�ļ�ת��Ϊ����
     *
     * @param fileName
     * @param clazz
     * @return
     */
    @SuppressWarnings("unchecked")
    public static <T> T fileToObject(String fileName, Class<?> clazz) {
        try {
            String pathName = "/templates/modules/gen/" + fileName;
//			logger.debug("File to object: {}", pathName);
            Resource resource = new ClassPathResource(pathName);
            InputStream is = resource.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = br.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line).append("\r\n");
            }
            if (is != null) {
                is.close();
            }
            if (br != null) {
                br.close();
            }
//			logger.debug("Read file content: {}", sb.toString());
            return (T) JaxbMapper.fromXml(sb.toString(), clazz);
        } catch (IOException e) {
            logger.warn("Error file convert: {}", e.getMessage());
        }
//		String pathName = StringUtils.replace(getTemplatePath() + "/" + fileName, "/", File.separator);
//		logger.debug("file to object: {}", pathName);
//		String content = "";
//		try {
//			content = FileUtils.readFileToString(new File(pathName), "utf-8");
////			logger.debug("read config content: {}", content);
//			return (T) JaxbMapper.fromXml(content, clazz);
//		} catch (IOException e) {
//			logger.warn("error convert: {}", e.getMessage());
//		}
        return null;
    }

    /**
     * ��ȡ�����������ö���
     *
     * @return
     */
    public static GenConfig getConfig() {
        return fileToObject("config.xml", GenConfig.class);
    }

    /**
     * ���ݷ����ȡģ���б�
     *
     * @param config
     * @param isChildTable �Ƿ����ӱ�
     * @return
     */
    public static List<GenTemplate> getTemplateList(GenConfig config, String category, boolean isChildTable) {
        List<GenTemplate> templateList = Lists.newArrayList();
        if (config != null && config.getCategoryList() != null && category != null) {
            for (GenCategory e : config.getCategoryList()) {
                if (category.equals(e.getValue())) {
                    List<String> list = null;
                    if (!isChildTable) {
                        list = e.getTemplate();
                    } else {
                        list = e.getChildTableTemplate();
                    }
                    if (list != null) {
                        for (String s : list) {
                            if (StringUtils.startsWith(s, GenCategory.CATEGORY_REF)) {
                                templateList.addAll(getTemplateList(config, StringUtils.replace(s, GenCategory.CATEGORY_REF, ""), false));
                            } else {
                                GenTemplate template = fileToObject(s, GenTemplate.class);
                                if (template != null) {
                                    templateList.add(template);
                                }
                            }
                        }
                    }
                    break;
                }
            }
        }
        return templateList;
    }

    /**
     * ��ȡ����ģ��
     *
     * @param genScheme
     * @return
     */
    public static Map<String, Object> getDataModel(GenScheme genScheme) {
        Map<String, Object> model = Maps.newHashMap();

        model.put("packageName", StringUtils.lowerCase(genScheme.getPackageName()));
        model.put("lastPackageName", StringUtils.substringAfterLast((String) model.get("packageName"), "."));
        model.put("moduleName", StringUtils.lowerCase(genScheme.getModuleName()));
        model.put("subModuleName", StringUtils.lowerCase(genScheme.getSubModuleName()));
        model.put("className", StringUtils.uncapitalize(genScheme.getGenTable().getClassName()));
        model.put("ClassName", StringUtils.capitalize(genScheme.getGenTable().getClassName()));

        model.put("functionName", genScheme.getFunctionName());
        model.put("functionNameSimple", genScheme.getFunctionNameSimple());
        model.put("functionAuthor", StringUtils.isNotBlank(genScheme.getFunctionAuthor()) ? genScheme.getFunctionAuthor() : UserUtils.getUser().getName());
        model.put("functionVersion", DateUtils.getDate());

        model.put("urlPrefix", model.get("moduleName") + (StringUtils.isNotBlank(genScheme.getSubModuleName())
                ? "/" + StringUtils.lowerCase(genScheme.getSubModuleName()) : "") + "/" + model.get("className"));
        model.put("viewPrefix", //StringUtils.substringAfterLast(model.get("packageName"),".")+"/"+
                model.get("urlPrefix"));
        model.put("permissionPrefix", model.get("moduleName") + (StringUtils.isNotBlank(genScheme.getSubModuleName())
                ? ":" + StringUtils.lowerCase(genScheme.getSubModuleName()) : "") + ":" + model.get("className"));

        model.put("dbType", Global.getConfig("jdbc.type"));

        model.put("table", genScheme.getGenTable());

        return model;
    }

    /**
     * ���ɵ��ļ�
     *
     * @param tpl
     * @param model
     * @return
     */
    public static String generateToFile(GenTemplate tpl, Map<String, Object> model, boolean isReplaceFile) {
        // ��ȡ�����ļ�
        String fileName = Global.getProjectPath() + File.separator
                + StringUtils.replaceEach(FreeMarkers.renderString(tpl.getFilePath() + "/", model),
                new String[]{"//", "/", "."}, new String[]{File.separator, File.separator, File.separator})
                + FreeMarkers.renderString(tpl.getFileName(), model);
        logger.debug(" fileName === " + fileName);

        // ��ȡ�����ļ�����
        String content = FreeMarkers.renderString(StringUtils.trimToEmpty(tpl.getContent()), model);

        // ���ѡ���滻�ļ�����ɾ��ԭ�ļ�
        if (isReplaceFile) {
            File file = new File(fileName);
            if (file.exists()) {
                try {
                    String code = org.apache.commons.io.FileUtils.readFileToString(file, "GBK");
                    String customCode = "";
                    String genCode = "";
                    customCode = code.substring(code.indexOf("========================================================================================"));
                    genCode = content.substring(0, content.indexOf("========================================================================================"));
//                    if (fileName.contains(".Dao.xml")) { // ע����䲻̫һ��
//                        customCode = code.substring(code.indexOf("<!--========================================================================================-->"));
//                        genCode = content.substring(0, content.indexOf("<!--========================================================================================-->"));
//                    }else{
//                        customCode = code.substring(code.indexOf("========================================================================================"));
//                        genCode = content.substring(0, content.indexOf("========================================================================================"));
//                    }
                    String newCode = genCode + customCode;
                    logger.debug(" content === \r\n" + newCode);
                    FileUtils.deleteFile(fileName);
                    // ������д���ļ�
                    if (FileUtils.createFile(fileName)) {
                        org.apache.commons.io.FileUtils.writeStringToFile(file, newCode, "GBK", true);
                        logger.debug(" file create === " + fileName);
                        return "���ɳɹ���" + fileName + "<br/>";
                    } else {
                        logger.debug(" file extents === " + fileName);
                        return "�ļ��Ѵ��ڣ�" + fileName + "<br/>";
                    }

                } catch (Exception e) {
                    FileUtils.deleteFile(fileName);
                    // ������д���ļ�
                    if (FileUtils.createFile(fileName)) {
                        FileUtils.writeToFile(fileName, content, true);
                        logger.debug(" file create === " + fileName);
                        return "���ɳɹ���" + fileName + "<br/>";
                    } else {
                        logger.debug(" file extents === " + fileName);
                        return "�ļ��Ѵ��ڣ�" + fileName + "<br/>";
                    }
                }
            } else {
                FileUtils.deleteFile(fileName);
                // ������д���ļ�
                if (FileUtils.createFile(fileName)) {
                    FileUtils.writeToFile(fileName, content, true);
                    logger.debug(" file create === " + fileName);
                    return "���ɳɹ���" + fileName + "<br/>";
                } else {
                    logger.debug(" file extents === " + fileName);
                    return "�ļ��Ѵ��ڣ�" + fileName + "<br/>";
                }
            }

        } else {

            // ������д���ļ�
            if (FileUtils.createFile(fileName)) {
                FileUtils.writeToFile(fileName, content, true);
                logger.debug(" file create === " + fileName);
                return "���ɳɹ���" + fileName + "<br/>";
            } else {
                logger.debug(" file extents === " + fileName);
                return "�ļ��Ѵ��ڣ�" + fileName + "<br/>";
            }
        }
    }

    public static void main(String[] args) {
        try {
            GenConfig config = getConfig();
            System.out.println(config);
            System.out.println(JaxbMapper.toXml(config));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}