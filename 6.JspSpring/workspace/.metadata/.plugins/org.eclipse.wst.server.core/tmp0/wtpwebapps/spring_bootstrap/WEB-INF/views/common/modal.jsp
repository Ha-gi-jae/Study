<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
문진표 모달...
<head>
<style>
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>
</head>

<title></title>

<body>
	<div class="bottom"> 
        <button class="btn btn-default btn-ico" data-toggle="modal" data-target="#myModal">
                자세히보기
        </button> 
</div> 



<!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
                <div class="modal-content" style="width: 450px;"> 
                        <div class="modal-header"> 
                                <h5 class="modal-title" id="myModalLabel">개인정보 수집 및 이용동의</h5><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></p> 
                        </div> 
                        <div class="modal-body">
	                        <table class="table table-bordered">
                  <tbody>
                    <tr style="text-align: center;">
                      <th style="width: 120px">목적</th>
                      <td style="text-align: left;">검사소 기초역학조사 정보등록</td>
                    </tr>
                    
                    <tr style="text-align: center;">
                      <th style="width: 120px; vertical-align : middle;">항목</th>
                      <td style="text-align: left;">주민/외국인등록번호, 이름, 생년월일, 성별, 국적, 휴대폰번호, 실거주지 주소, 직업, 증상, 검사경위</td>
                    </tr>
                    <tr style="text-align: center">
                      <th style="width: 120px">보유기간</th>
                      <td style="text-align: left;">코로나19 경계상황 종료 후 즉시 폐기</td>
                    </tr>
                    <tr>
                   	  <td colspan="2" align="center">
                   	    <button class="btn btn-primary" style="width: 50%">동의</button>
                   	  </td>
                    </tr>
                  </tbody>
                </table>
	                        
                        </div> 
                </div> 
        </div> 
</div>
</body>
										