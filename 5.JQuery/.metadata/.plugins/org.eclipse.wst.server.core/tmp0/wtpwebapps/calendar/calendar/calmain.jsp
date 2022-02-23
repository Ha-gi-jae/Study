<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ tablib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<a>calendar!</a>
<!-- CalendarController로 부터 받는 매개변수  -->
<!-- CustomCalendarUtil : cal - 캘린더 관련 메소드 포함 -->
<!--  요일정보 배열, nvl, callist, showPen, two -->

<div class="calendarWrap" align="center">
	<table class="calendarHeader">
		<tr>
			<td class="calendarHeaderLeft">
				<a href="#none" title="이전 년" id="_showNextYear" onclick="changeYearAndMonth(1);">
					<img alt="" src="image/btn_pre_p11.gif" style="width: 9px; height: 9px">
				</a>
				<a href="#none" title="이전 월" id="_showNextMonth" onclick="changeYearAndMonth(2);">
					<img alt="" src="image/btn_pre.gif" style="width: 9px; height: 9px">
				</a>
			</td>
			<td class="calendarHeaderYearAndMonth">
				<select class="calendarSelect" id="_calendarHeaderYear">
					<c:forEach begin="2020" end="2040" step="1" var="y">
						<option value="${y }">${y }</option>
					</c:forEach>
				</select>년
				<select class="calendarSelect" id="_calendarHeaderMonth">
					<c:forEach begin="1" end="12" step="1" var="m">
						<optiion value="${m }">${m }</optiion>
					</c:forEach>
				</select>월
			</td>
			<td class="calendarHeaderRight">
				<a href="#none" title="다음 월" id="_showNextMonth" onclick="changeYearAndMonth(3);">
					<img alt="" src="image/btn_next.gif" style="width: 9px; height: 9px">
				</a>
				<a href="#none" title="다음 년" id="_showNextYear" onclick="changeYearAndMonth(4);">
					<img alt="" src="image/btn_next_p11.gif" style="width:9px; height: 9px">
				</a>
			</td>
		</tr>
	</table>
	<table class="calendarBodytb1" style="width: 75%; height: 50%;">
		<colgroup>
			<col width="300"><col width="300"><col width="300"><col width="300">
			<col width="300"><col width="300"><col width="300">
		</colgroup>
		<thead class="calendarBodytb1Head">
			<tr>
				<c:forEach items="${cal.dayNames }" var="d" varStatus="vs">
					<td align="center"><c:out value="${d }"></c:out></td>
				</c:forEach>
			</tr>
		</thead>
		<tbody class="calendarBodytb1Body">
		</tbody>
	</table>
</div>
<input type="button" value="달력!" id="btnTest">
</html>