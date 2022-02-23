<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">공지사항</h3>

              <div class="card-tools">
                <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-read-info">
                <h5>${notice.title }</h5>
                <h3><span class="float-right">작성자: ${notice.writer }</span></h3><br>
                <h3><span class="float-right">작성일:<fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/></span></h3><br>
                <h3><span class="float-right">조회수: ${notice.viewcnt }</span></h3><br>
              </div>
              <div class="mailbox-read-message">
                ${notice.content }

              </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
              <div class="float-right">
                <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
                <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
              </div>
              <button type="button" class="btn btn-default"><i class="far fa-trash-alt"></i> Delete</button>
              <button type="button" class="btn btn-default"><i class="fas fa-print"></i> Print</button>
            </div>
            <!-- /.card-footer -->
          </div>