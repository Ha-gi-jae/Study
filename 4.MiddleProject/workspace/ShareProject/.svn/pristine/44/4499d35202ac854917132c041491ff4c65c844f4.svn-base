package kr.or.ddit.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

/**
 * FileUpload API를 사용하는 HttpServletRequestWrapper 클래스
 * (HttpServletRequest에 기반한 API를 사용하면서 멀티파트처리 기능이 추가되었음.)
 */
public class FileUploadRequestWrapper extends HttpServletRequestWrapper {

	private static Logger logger = Logger.getLogger(FileUploadRequestWrapper.class);	// 로거 생성

    public static final String UPLOAD_DIRECTORY = "d:/D_Other/upload_files";		// 업로드 경로 설정
    private boolean isMultipart = false;												// 멀티파트여부

    private Map<String, String[]> parameterMap;											// 폼필드(파라미터) 데이터를 담기 위한 맵
    private Map<String, FileItem[]> fileItemMap;										// fileItem객체를 담기위한 맵

    /**
     * 생성자
     * @param request
     * @throws FileUploadException
     */
    public FileUploadRequestWrapper(HttpServletRequest request)
    throws FileUploadException{
        this(request, -1, -1, -1, null);
    }

    /**
     * 생성자
     * @param request 기본 요청 객체
     * @param memoryThreshold 메모리 임계크기(이 크기가 넘어가면 레파지토리 위치에 임시파일로 저장됨)
     * @param fileSizeMax 파일 1개당 최대크기
     * @param maxRequestSize 요청 파일 최대 크기
     * @param repositoryPath 임시파일 저장경로
     * @throws FileUploadException
     */
    public FileUploadRequestWrapper(HttpServletRequest request,
        int memoryThreshold, long fileSizeMax, long maxRequestSize, String repositoryPath) throws FileUploadException {
        super(request);

        parsing(request, memoryThreshold, fileSizeMax, maxRequestSize, repositoryPath);
    }

    /**
     * 멀티파트 데이터를 파싱하여 두개의 맵에 나누어 담는다.
     * @param request
     * @param memoryThreshold 메모리 임계크기(이 크기가 넘어가면 레파지토리 위치에 임시파일로 저장됨)
     * @param fileSizeMax 파일 1개당 최대 크기
     * @param maxRequestSize 요청 파일 최대 크기
     * @param repositoryPath 임시파일 저장경로
     * @throws FileUploadException
     */
    private void parsing(HttpServletRequest request,
        int memoryThreshold, long fileSizeMax, long maxRequestSize, String repositoryPath) throws FileUploadException {

        if (ServletFileUpload.isMultipartContent(request)) {
            isMultipart = true; // 멀티파트임을 설정함.

            parameterMap = new HashMap<>();
            fileItemMap = new HashMap<>();

            DiskFileItemFactory factory = new DiskFileItemFactory();
            if (memoryThreshold != -1) {
            	factory.setSizeThreshold(memoryThreshold);
            }
            if (repositoryPath != null) {// 저장 경로가 설정되지 않았으면...
            	factory.setRepository(new File(repositoryPath));
            }else {
            	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
            }

            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            servletFileUpload.setFileSizeMax(fileSizeMax);
            servletFileUpload.setSizeMax(maxRequestSize);

            List<FileItem> list = servletFileUpload.parseRequest(request);
            for (int i = 0 ; i < list.size() ; i++) {
                FileItem fileItem = (FileItem) list.get(i);
                String name = fileItem.getFieldName(); // 필드명 가져오기

                if (fileItem.isFormField()) { // 폼필드인 경우...
                    String value = "";
					try {
						// 폼필드의 값이 한글인 경우에는 해당 문자열을 적절히 변환을 해주어야 한다.
						//value = new String(fileItem.getString().getBytes("8859_1"), "UTF-8");
						value = fileItem.getString("UTF-8");
						logger.info(name +  " : " + value);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
                    String[] values = (String[]) parameterMap.get(name);
                    if (values == null) { // 처음 만드는 경우...
                        values = new String[] { value };
                    } else { // 기존에 이미 존재하는 경우...
                        String[] tempValues = new String[values.length + 1];
                        System.arraycopy(values, 0, tempValues, 0, values.length);
                        tempValues[tempValues.length - 1] = value;
                        values = tempValues;
                    }
                    parameterMap.put(name, values);

                } else { // 파일인 경우...

                	if(fileItem.getSize() > 0) { // 파일이 존재하는 경우...

                		FileItem[] values = fileItemMap.get(name);
                        if (values == null) { // 처음 만드는 경우...
                            values = new FileItem[] { fileItem };
                        } else { // 기존에 이미 존재하는 경우...
                        	FileItem[] tempValues = new FileItem[values.length + 1];
                            System.arraycopy(values, 0, tempValues, 0, values.length);
                            tempValues[tempValues.length - 1] = fileItem;
                            values = tempValues;
                        }
                        fileItemMap.put(name, values);
                	}
                }
            }
            //addTo(); // 현재 객체를 속성값으로 설정한다.(멀티파트 여부 체크를 위해 설정함)
        }
    }

    /**
     * 멀티파트 컨텐츠인지 확인하기 위한 메서드
     * @return 멀티파트이면 true, 아니면 false
     */
    public boolean isMultipartContent() {
        return this.isMultipart;
    }

    /**
     * 파라미터 정보 가져오기
     */
    public String getParameter(String name) {
        if (this.isMultipart) {
            String[] values = (String[])parameterMap.get(name);
            if (values == null) return null;
            return values[0];
        } else
            return super.getParameter(name);
    }

    public String[] getParameterValues(String name) {
        if (this.isMultipart)
            return (String[])parameterMap.get(name);
        else
            return super.getParameterValues(name);
    }

    public Enumeration<String> getParameterNames() {
        if (this.isMultipart) {
            return new Enumeration<String>() {
                Iterator<String> iter = parameterMap.keySet().iterator();

                public boolean hasMoreElements() {
                    return iter.hasNext();
                }
                public String nextElement() {
                    return iter.next();
                }
            };
        } else {
            return super.getParameterNames();
        }
    }

    /**
     * parameterMap 가져오기
     */
    public Map<String, String[]> getParameterMap() {
        if (this.isMultipart)
            return parameterMap;
        else
            return super.getParameterMap();
    }

    /**
     * fileItemMap 가져오기
     * @return
     */
    public Map<String, FileItem[]> getFileItemMap() {
    	 if (this.isMultipart)
             return fileItemMap;
         else
             return null;
    }

    /**
     * 속성이름을 이용하여 FileItem배열을 가져온다.
     * @param name 속성이름
     * @return FileItem 배열
     */
    public FileItem[] getFileItems(String name) {
        if (this.isMultipart)
            return fileItemMap.get(name);
        else
            return null;
    }

    /**
     * fileItemMap에 존재하는 FileItem을 삭제한다.
     */
    public void delete() {
        if (this.isMultipart) {
            Iterator<FileItem[]> fileItemIter = fileItemMap.values().iterator();
            while( fileItemIter.hasNext()) {
                FileItem[] fileItemArr = (FileItem[])fileItemIter.next();
                for(FileItem fileItem : fileItemArr) {
                	fileItem.delete(); // 임시저장 데이터 삭제
                }
            }
        }
    }

}
