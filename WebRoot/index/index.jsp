<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*,com.droneSystem.hibernate.*"%>
<%
	SysUser loginuser = (SysUser)request.getSession().getAttribute("LOGIN_USER");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>


	<link rel="stylesheet" id="easyuiTheme" type="text/css" href="../Inc/Style/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../Inc/Style/themes/icon2.css" />
    <link rel="stylesheet" type="text/css" href="../Inc/Style/Style.css" />
	
    <script type="text/javascript" src="../Inc/JScript/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="../Inc/JScript/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../Inc/JScript/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>	
	<script type="text/javascript" src="../JScript/upload.js"></script>
	<link rel="stylesheet" type="text/css" href="../uploadify/uploadify.css" />
	<script type="text/javascript" src="../uploadify/jquery.uploadify.v2.1.4.js"></script>
	 <script type="text/javascript" src="../Inc/JScript/unback.js"></script>

	<script>
	$(function(){
		
		$('#table').datagrid({
			//title:'֪ͨ',
			singleSelect:true, 
			fit: true,
			nowrap: false,
			striped: true,
			border:false,
			url:'/droneSystem/TaskServlet.do?method=0',
			rownumbers:true,
//			sortName: 'userid',
// 			sortOrder: 'desc',
			remoteSort: true,	//Ĭ�ϰ�������������
//			idField:'id',
			columns:[
				[
					{field:'Type',title:'��������',width:100,align:'center'},
					{field:'TaskTime',title:'����ʱ��',width:100,align:'center'},
					{field:'Content',title:'����',width:290,align:'left', 
						formatter:function(value, rowData, rowIndex){
							if(rowData.Url==""){
								return value;
							}else{
								return "<a style='text-decoration:underline' href='"+rowData.Url+"' target='_self'  ><span style='color: #0033FF'>"+value+"</span></a>"
							}
						}}
					
				]
			],
			pagination:true
		});
		
		$('#uploaded_file_table1').datagrid({		
			iconCls:'icon-tip',
			idField:'_id',
			fit:true,
			border:false,
			rownumbers:true,
			singleSelect:true,			
			columns:[[
				{field:"filename",title:"�ļ���",width:200,align:"left", 
					formatter : function(value,rowData,rowIndex){
						return "<a style='text-decoration:underline' href='/droneSystem/FileDownloadServlet.do?method=0&FileId="+rowData._id+"&FileType="+rowData.filetype+ "' target='_blank' title='������ظ��ļ�' ><span style='color: #0033FF'>"+value+"</span></a>"
					}
				},
				{field:"length",title:"��С",width:60,align:"left"},
				{field:"uploadDate",title:"�ϴ�ʱ��",width:120,align:"left"},
				{field:"uploadername",title:"�ϴ���",width:60,align:"left"}
			]],
			pagination:true
	
		});
	
	});
	//��ȫ�˳�ϵͳ
	function doLogout(){
		var result = confirm("������ʾ��Ϣ:�Ƿ�ȷ���˳���ϵͳ��");
		if(result == false){
			return false;
		}
		$.ajax({
			type: "post",
			url: "/droneSystem/UserServlet.do?method=5&time=" + new Date().getTime(),
			dataType: "json",	//�������������ݵ�Ԥ������
			beforeSend: function(XMLHttpRequest){
				//ShowLoading();
			},
			success: function(data, textStatus){
				window.parent.location.href="/droneSystem/";
			},
			complete: function(XMLHttpRequest, textStatus){
				//HideLoading();
			},
			error: function(){
				//�����������
			}
		});
	}
	
	</script>
	<style type="text/css">

	.right_title{
			background:url(rightbg01.gif) repeat-x;
			color:#595a5b;
			text-align:left;
			line-height:23px;
			font-weight:bold;
			padding-top:2px;
			width:99%;
			border-top:0px solid #d6e9fc;
			border-left:0px solid #d6e9fc;
			border-right:0px solid #d6e9fc;
			float:left;
			
	}	
	
	.right_con{
		float:left;
			width:100%;
			border-bottom:0px solid #d6e9fc;
			border-left:0px solid #d6e9fc;
			border-right:0px solid #d6e9fc;
			margin-bottom:10px;
			padding-bottom:0px;
			padding-top:10px;
	}
	
	.right_con div{
		float:left;
		width:80px;
		text-align:center;
	}
	
	.right_con a{
		color:#666;
		text-decoration:none;
	}
	
	.right_con img{
		border:0 none;
		height:50px;
		width:50px;
	}
	
	span.CountStatistic {color:blue}
</style>
</head>
<body>
	<div id="portal" >
	<table >
	<tr height="80px" style="padding-bottom:10px">
		<td colspan="2">
			 <div id="p4" class="easyui-panel" style="width:1042px;"
				title="���ÿ�ݷ�ʽ" collapsible="false"  closable="false" scroll="no">

				<div class="right_con">
					<div><a href="/droneSystem/SFGL/wtd/CommissionSheet.jsp" target="_self"><img src="../images/test-management.png" title="�½�ǿ��ǿ��ί�е�"/></a><br />
					<a href="/droneSystem/SFGL/wtd/CommissionSheet.jsp" target="_self">�½�ǿ��ǿ��ί�е�</a></div>
		
					<div ><a href="/droneSystem/SFGL/wtd/XCCommissionSheet.jsp" target="_self"><img src="../images/train-design.png" title="�ֳ����ҵ�����"/></a><br />
					<a href="/droneSystem/SFGL/wtd/XCCommissionSheet.jsp" id="linkOnlineUsers" target="_self">�ֳ����ҵ�����</a></div>	
					
					<div><a href="/droneSystem/SFGL/wtd/CXCommissionSheet.jsp" target="_self"><img src="../images/pen.png" title="�깤ȷ��"/></a><br />					
					<a href="/droneSystem/SFGL/wtd/CXCommissionSheet.jsp" target="_self">�깤ȷ��</a></div>	
		
					<div><a href="/droneSystem/FeeManage/GenerateDetailList.jsp" target="_self"><img src="../images/train-result.png" title="���ɷ����嵥"/></a><br />
					<a href="/droneSystem/FeeManage/GenerateDetailList.jsp" target="_self">���ɷ����嵥</a></div>	
					
					<div><a href="/droneSystem/FeeManage/Checkout2.jsp" target="_self"><img src="../images/resource-1.png" title="���˹���"/></a><br />
					<a href="/droneSystem/FeeManage/Checkout2.jsp" target="_self">���˹���</a></div>	 
							
					<div><a href="/droneSystem/TaskManage/VehicleSchedule.jsp" target="_self"><img src="../images/zhiliang-management.png" title="�������Ȱ���"/></a><br />
					<a href="/droneSystem/TaskManage/VehicleSchedule.jsp" target="_self">�������Ȱ���</a></div>	
					
					<div><a href="/droneSystem/FeeManage/Quotation.jsp" target="_self"><img src="../images/txt.png" title="�������۵�"/></a><br />
					<a href="/droneSystem/FeeManage/Quotation.jsp" target="_self">�������۵�</a></div>	
					
					<div><a href="/droneSystem/TaskManage/TaskTime.jsp" target="_self"><img src="../images/search_project.png" title="�޸ĵ�¼����" alt="��δ��ɵļ�������" /></a><br />
					<a href="/droneSystem/TaskManage/TaskTime.jsp" id="linkAlarmRuleManager" target="_self">��δ��ɵļ�������</a></div>	    		  
		
					<div><a href="/droneSystem/TaskManage/VerifyTask.jsp" target="_self"><img src="../images/3.png" title="���������б�"/></a><br />
					<a href="/droneSystem/TaskManage/VerifyTask.jsp" target="_self">���������б�</a></div>
					

					<div><a href="/droneSystem/TaskManage/AuthorizeTask.jsp" target="_self"><img src="../images/record-1.png" title="�ҵ���Ȩǩ�������б�"/></a><br />
					<a href="/droneSystem/TaskManage/AuthorizeTask.jsp" target="_self">�ҵ���Ȩǩ�������б�</a></div>	
								
					<div><a href="/droneSystem/StatisticLook/MissionLookByCommissionSheetCode.jsp" target="_self"><img src="../images/chongyong-management.png" title="����ǿ��ǿ��ί�е��Ų�ѯҵ��"/></a><br />
					<a href="/droneSystem/StatisticLook/MissionLookByCommissionSheetCode.jsp" target="_self">����ǿ��ǿ��ί�е��Ų�ѯҵ��</a></div>	
					
					<div><a href="javascript:void(0)" onclick="doLogout()" target="_top" ><img src="../images/logout1.png" title="��ȫ�˳�"/></a><br />
					<a  href="javascript:void(0)" onclick="doLogout()"  target="_top" >��ȫ�˳�</a></div>	    
		
				</div>
			</div>
		</td>
	</tr>
	<tr height="300px">
		<td height="300px">
			<div id="p2" class="easyui-panel" style="width:520px;height:300px;"
				title="�ҵ������б�" collapsible="false"  closable="false" scroll="no">
				
					<table id="table" class="easyui-datagrid" ></table>
						
		    </div>	
		</td>
		<td height="300px">
			<div id="p1" class="easyui-panel" style="width:520px;height:300px;"
				title="����ϴ��Ĺ����ļ�" collapsible="false"  closable="false" scroll="no">
					<!-- �����filesetname���Զ����ɵ��ַ����������filesharingfolder���еĸ�Ŀ¼�ֶ�filesetname��ֵ��ͬ -->
					<table  class="easyui-datagrid" id="uploaded_file_table1" url="/droneSystem/FileDownloadServlet.do?method=1&FileType=105&FilesetName=20151203202949195_0232"></table>
						
		    </div>
		</td>
	</tr>
	
	<tr height="172px" valign="top">
		<td height="150px">
			<div id="p3" class="easyui-panel" style="width:520px;height:150px;padding-top:10px;padding-left:10px"
				title="��¼��Ϣ" collapsible="false"  closable="false" scroll="no">
				<!--<table>
				<tr>
					<td colspan="2">
						��ӭ����${sessionScope.LOGIN_USER.name}
					</td>
				</tr>
				<tr>
					<td >
						�����ϴε�½��ʱ�䣺${sessionScope.LastLoginTime}
					</td>
					<td>
					    �����ϴε�½��IP��ַ��${sessionScope.LastLoginIp}
					</td>					
				</tr>
				<tr>
					<td >
						�������ε�½��ʱ�䣺${sessionScope.LoginTime}
					</td>
					<td>
					    �������ε�½��IP��ַ��${sessionScope.LoginIp}
					</td>		
				</tr>
				</table>-->
					<div style="height:22px">��ӭ����${sessionScope.LOGIN_USER.name}</div>
					<div style="height:22px;wight:120px">�����ϴε�½��ʱ�䣺${sessionScope.LastLoginTime}</div>
					<div style="height:22px;wight:120px">�����ϴε�½��IP��ַ��${sessionScope.LastLoginIp}</div>				
					<div style="height:22px;wight:120px">�������ε�½��ʱ�䣺${sessionScope.LoginTime}</div>
					<div style="height:22px;wight:120px">�������ε�½��IP��ַ��${sessionScope.LoginIp}</div>					
				  	
		    </div>
	
		</td>
		<td height="150px">
			<div id="p4" class="easyui-panel" style="width:520px;height:150px;padding-top:10px;padding-left:10px"
				title="ϵͳ��Ϣ" collapsible="false"  closable="false" scroll="no">
				 <!--   <div style="height:35px">��ϵͳּ�ڸ������Ĺ�������ҵ��,��Ա���������ɸ�Ч����ɹ���,�ٽ�������Ϣ�������<br/>&nbsp;&nbsp;��չ.</div> -->
				    <div style="height:25px">���Ƽ��ֱ���1280*800�����ϣ��Ƽ�ʹ��IE7�����ϰ汾�������</div> 
				    <div style="height:25px">���������ӣ�</div> 
					
					<div style="height:20px;padding-left:20px">�������ʼ�����<a style='text-decoration:underline' href="http://www.txzj.gov.cn/" target="_blank"><span style='color: #0033FF'>http://www.jjzj.gov.cn/</span></a></div>
					<div style="height:20px;padding-left:20px">������ʡ�ʼ�֣�<a style='text-decoration:underline' href="http://www.jsqts.gov.cn/" target="_blank"><span style='color: #0033FF'>http://www.jsqts.gov.cn/</span></a></div>
<!--					<div style="height:20px;padding-left:20px">������������������<a style='text-decoration:underline' href="http://www.changzhou.gov.cn/" target="_blank"><span style='color: #0033FF'>http://www.changzhou.gov.cn/</span></a></div>-->
					<div style="height:20px;padding-left:20px">���������������ܾ֣�<a style='text-decoration:underline' href="http://www.aqsiq.gov.cn/" target="_blank"><span style='color: #0033FF'>http://www.aqsiq.gov.cn/</span></a></div>
		    </div>
		</td>
		
	</tr>
	
	
	
	
    </table>
 </div>
 			
</body>
</html>