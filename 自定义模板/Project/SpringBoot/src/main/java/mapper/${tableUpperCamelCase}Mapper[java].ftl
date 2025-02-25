package ${jsonParam.packagePath}

<#-- 判断是否是需要多表关联查询的表 -->
<#if FtlUtils.tableExisted(jsonParam.joinTables, tableInfo.tableName)>
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${jsonParam.basePackagePath}.model.condition.<#if jsonParam.moduleName??>${jsonParam.moduleName}.</#if>${tableInfo.upperCamelCase}Condition;
    <#assign isJoinTable = true />
</#if>
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import ${jsonParam.basePackagePath}.model.<#if jsonParam.moduleName??>${jsonParam.moduleName}.</#if>${tableInfo.upperCamelCase};

/**
 * ${tableInfo.simpleRemark}Mapper接口
 * 
 * @author ${paramConfig.author}
 * @version 1.0.0 ${today}
 */
public interface ${tableInfo.upperCamelCase}Mapper extends BaseMapper<${tableInfo.upperCamelCase}> {
<#if isJoinTable?? && isJoinTable>
    /**
     * 根据条件分页查询${tableInfo.simpleRemark}列表
     * 
     * @param page      分页参数
     * @param condition 查询条件
     * @return 分页数据
     */
    IPage<${tableInfo.upperCamelCase}> find${tableInfo.upperCamelCase}Page(IPage<${tableInfo.upperCamelCase}> page, @Param("condition") ${tableInfo.upperCamelCase}Condition condition);
</#if>

}