<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>抵扣项文件管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
	    function toNewDeductionDoc(){
		       window.location.replace("${ctx}/charge/deductionDoc/form?prjNum=${charge.project.prjNum}");
	    }
	    
	    function toNewItem(docId){
		   window.location.replace("${ctx}/charge/deductionDocItem/form?doc.id="+docId);
	    }		
	</script>
</head>
<body>
	<sys:message content="${message}" />
	<matchfee:chargeView charge="${charge}"></matchfee:chargeView>
	<br>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/charge/charge/opinionBookTab">条件意见书</a></li>
		<li><a href="${ctx}/charge/charge/projectLicenseTab">工程许可证</a></li>
		<li class="active"><a href="${ctx}/charge/charge/deductionDocTab">设计院证明</a></li>
		<li><a href="${ctx}/charge/charge/projectDeductionTab">其他减项</a></li>
	</ul>

	<div style="margin: 10px 60px 10px 0;width='100%'">
		<div align="right">
			<shiro:hasPermission name="charge:charge:edit">
				<input id="btnAdd" class="btn btn-primary" type="button"
					value="添加文件" onclick="toNewDeductionDoc()" />
			</shiro:hasPermission>
		</div>
	</div>

	<c:forEach items="${charge.deductionDocList}" var="deductionDoc">

		<legend>设计院证明---${deductionDoc.documentNo}</legend>
		<div style="margin: 10px 60px 10px 0;width='100%'">
			<div align="right">
				<shiro:hasPermission name="charge:charge:edit">
					<a href="${ctx}/charge/deductionDoc/form?id=${deductionDoc.id}">修改</a>
					<a href="${ctx}/charge/deductionDoc/delete?id=${deductionDoc.id}"
						onclick="return confirmx('确认要删除该设计院证明吗？', this.href)">删除</a>
				</shiro:hasPermission>
			</div>
		</div>

		<matchfee:deductionDocView deductionDoc="${deductionDoc}"></matchfee:deductionDocView>

		<div style="margin: 10px 60px 10px 0;width='100%'">
			<div align="right">
				<input id="btnAddItem" class="btn btn-primary" type="button"
					value="添加项目" onclick="toNewItem(${deductionDoc.id})" />
			</div>
		</div>
		
		<matchfee:deductionDocItemView deductionDoc="${deductionDoc}"></matchfee:deductionDocItemView>
		<hr style="border:1px dotted #036" />
		
	</c:forEach>

</body>
</html>