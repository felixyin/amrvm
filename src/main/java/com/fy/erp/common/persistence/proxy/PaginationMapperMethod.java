/**
 *
 */
package com.fy.erp.common.persistence.proxy;

import com.fy.erp.common.persistence.Page;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.binding.BindingException;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * ִ�д����࣬��չMybatis�ķ�ʽ������Mapper�ӿ���֧��.
 * </p>
 *
 * @author poplar.yfyang
 * @version 1.0 2012-05-13 ����10:09
 * @since JDK 1.5
 */
public class PaginationMapperMethod {

    private final SqlSession sqlSession;
    private final Configuration config;

    private SqlCommandType type;
    private String commandName;
    private String commandCountName;

    private final Class<?> declaringInterface;
    private final Method method;

    private Integer rowBoundsIndex;
    private Integer paginationIndex;

    private final List<String> paramNames;
    private final List<Integer> paramPositions;

    private boolean hasNamedParameters;

    public PaginationMapperMethod(Class<?> declaringInterface, Method method,
                                  SqlSession sqlSession) {
        paramNames = new ArrayList<String>();
        paramPositions = new ArrayList<Integer>();
        this.sqlSession = sqlSession;
        this.method = method;
        this.config = sqlSession.getConfiguration();
        this.declaringInterface = declaringInterface;
        this.hasNamedParameters = false;
        setupFields();
        setupMethodSignature();
        setupCommandType();
        validateStatement();
    }

    /**
     * ����ִ�з�����
     *
     * @param args ������Ϣ
     * @return ִ�н��
     */
    @SuppressWarnings("unchecked")
    public Object execute(Object[] args) {
        final Object param = getParam(args);
        Page<Object> page;
        RowBounds rowBounds;
        if (paginationIndex != null) {
            page = (Page<Object>) args[paginationIndex];
            rowBounds =  new RowBounds(page.getFirstResult(), page.getMaxResults());
        } else if (rowBoundsIndex != null) {
            rowBounds = (RowBounds) args[rowBoundsIndex];
            page = new Page<Object>();
        } else {
            throw new BindingException("Invalid bound statement (not found rowBounds or pagination in paramenters)");
        }
        page.setCount(executeForCount(param));
        page.setList(executeForList(param, rowBounds));
        return page;
    }

    /**
     * ִ�������ķ��������÷���ִ�м���������ȡ���ܽ��
     *
     * @param param ������Ϣ
     * @return ��ѯ���ܼ�¼��
     */
    private long executeForCount(Object param) {
        Number result = (Number) sqlSession.selectOne(commandCountName, param);
        return result.longValue();
    }

    /**
     * ȡ�÷�ҳ��ִ�н�������ص��Ǽ�¼��Ϣ
     *
     * @param param     ����
     * @param rowBounds row
     * @return ��¼�б�
     */
    private List<Object> executeForList(Object param, RowBounds rowBounds) {
        return sqlSession.selectList(commandName, param, rowBounds);
    }

    /**
     * ȡ�õ�ǰִ�еĲ�����Ϣ
     *
     * @param args ����
     * @return ������Ϣ
     */
    private Object getParam(Object[] args) {
        final int paramCount = paramPositions.size();
        if (args == null || paramCount == 0) {
            return null;
        } else if (!hasNamedParameters && paramCount == 1) {
            return args[paramPositions.get(0)];
        } else {
            Map<String, Object> param = new HashMap<String, Object>();
            for (int i = 0; i < paramCount; i++) {
                param.put(paramNames.get(i), args[paramPositions.get(i)]);
            }
            return param;
        }
    }

    private void setupMethodSignature() {
        final Class<?>[] argTypes = method.getParameterTypes();
        for (int i = 0; i < argTypes.length; i++) {
            if (Page.class.isAssignableFrom(argTypes[i])) {
                paginationIndex = i;
            } else if (RowBounds.class.isAssignableFrom(argTypes[i])) {
                rowBoundsIndex = i;
            } else {
                String paramName = String.valueOf(paramPositions.size());
                paramName = getParamNameFromAnnotation(i, paramName);
                paramNames.add(paramName);
                paramPositions.add(i);
            }
        }
    }

    private String getParamNameFromAnnotation(int i, String paramName) {
        Object[] annotations = method.getParameterAnnotations()[i];
        for (Object annotation : annotations) {
            if (annotation instanceof Param) {
                hasNamedParameters = true;
                paramName = ((Param) annotation).value();
            }
        }
        return paramName;
    }

    /**
     * ���õ�ǰ�Ĳ�ѯ�ܼ�¼����ID
     */
    private void setupFields() {
        commandName = declaringInterface.getName() + "." + method.getName();
        commandCountName = commandName + "Count"; // ����Լ��
    }

    /**
     * ���õ�ǰ�Ĳ�����������Ϣ
     */
    private void setupCommandType() {
        MappedStatement ms = config.getMappedStatement(commandName);
        type = ms.getSqlCommandType();
        if (type != SqlCommandType.SELECT) {
            throw new BindingException("Unsupport execution method for: " + commandName);
        }
    }

    /**
     * ��֤Statement
     */
    private void validateStatement() {
        if (!config.hasStatement(commandName)) {
            throw new BindingException("Invalid bound statement (not found): " + commandName);
        }
        if (!config.hasStatement(commandCountName)) {
            throw new BindingException("Invalid bound statement (not found): " + commandCountName);
        }
    }
}
