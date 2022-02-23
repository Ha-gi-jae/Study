<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head></head>

<title></title>

<body>
	<section class="content">
		<div class="card">
			<div class="card-header" style="background-color: #1a4f72;color: white; margin-bottom: 0px;">
				<h3 class="card-title">검사 결과 조회</h3>
			</div>

			<div class="card-body pb-2" style="padding-top: 10px; font-weight: 500;">
				<h3 class="title" style="font-size: 25px; text-align: center;">
					코로나19 PCR 검사 결과<br> 
					
					<%-- ${tcrVO.smplResCode } --%>
					 <c:choose>  
						<c:when test="${trcVO.pstvYn eq 'Y' || trcVO.pstvYn eq 'N' }"> 
							<span style="color: red;">${trcVO.smplResCode}</span><span style="color:black;"> 입니다.</span>
						</c:when> 
						<c:otherwise> 
							<span style="color: red;">검사결과가 없습니다.</span>
						</c:otherwise> 
					</c:choose>
					
				</h3>
				<div class="row" >
					<div class="col-sm-6" style="border-right: 1px solid #6c757d73;">
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">성명</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">생년월일</div>
						</div>
						<div class="row" style=";text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">성별</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">검사일자</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">검사방법</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">검사결과</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">확정일자</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">요청기관</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">검사기관</div>
						</div>
					</div>
					<div class="col-sm-6" >
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">${trcVO.pstiNm }</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">${trcVO.bir}</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">
								<c:choose>  
									<c:when test="${trcVO.gender eq 'M'}"> 
										남
									</c:when> 
									<c:when test="${trcVO.gender eq 'F'}"> 
										여
									</c:when> 
									
									<c:otherwise> 
										
									</c:otherwise> 
								</c:choose> 
							</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10"><fmt:formatDate pattern="yyyy-MM-dd" value="${trcVO.htscYmd}"/></div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">
							<c:if test="${trcVO.htscYmd ne null || !empty trcVO.htscYmd }">
								PCR
							</c:if>
							
							</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">${trcVO.smplResCode}</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10"><fmt:formatDate pattern="yyy-MM-dd" value="${trcVO.resYmd}"/></div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">${trcVO.instNm }</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 5px;margin-bottom: 5px;">
							<div class="col-md-10">${trcVO.pbhtNm }</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="row justify-content-center">
							<c:if test="${trcVO.smplResCode eq '음성'}">
								<button style="margin-top: 15px; background-color: #1a4f72; border-color: #1a4f72;width: 48%;
							 				   margin-right: 5px;" type="button" onclick="confirmation_go();" class="btn btn-block btn-primary">확인서발급</button>
							</c:if>
								<button style="margin-top: 15px; background-color: #c82333; border-color: #bd2130;width: 48%;
    										   margin-left: 5px;" type="button" onclick="closeCheck();"class="btn btn-block btn-primary">닫기</button>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row">
						</div>
					</div>
				</div>
			</div>
			</div>
	</section>
	<form id="confirmation">
		<input type="hidden" id="pstiNm" name="pstiNm" value="${psti.pstiNm}"/>
		<input type="hidden" id="rrn" name="rrn" value="${psti.rrn}"/>
	</form>
<script>
function closeCheck(){
	
	var check = confirm("닫으시겠습니까?");
	
	if(check){
		window.close();
	}else{
		return;
	}
}

function confirmation_go(){
	var check = confirm("확인서를 발급하시겠습니까?");
	
      if(check) {
      	 window.close();
  		 var gsWin = window.open('about:blank','confirmation','width=950,height=900');
  		 var frm = document.getElementById('confirmation');
  	     frm.action ='confirmation';
  	     frm.target ="confirmation";
  	     frm.method ="post";
  	     frm.submit();
      }else{
   	 	 return;
      }
}
	
	
</script>
</body>