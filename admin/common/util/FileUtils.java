package admin.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\dev\\file\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String ofileName = null;
    	String originalFileExtension = null;
    	String sfileName = null;

    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        //String benAppSeq = String.valueOf(map.get("benAppSeq"));
        String benAppSeq = map.get("benAppSeq").toString();
       
        File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }

        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		ofileName = multipartFile.getOriginalFilename();
        		originalFileExtension = ofileName.substring(ofileName.lastIndexOf("."));
        		sfileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		file = new File(filePath + sfileName);
        		multipartFile.transferTo(file);
        		
        		listMap = new HashMap<String,Object>();
        		
        		listMap.put("ben_app_seq", benAppSeq);
        		listMap.put("Ofile_name", ofileName);
        		listMap.put("Sfile_name", sfileName);
        		listMap.put("file_size", multipartFile.getSize());
        		list.add(listMap);
        		
        		System.out.println("containsKey(ben_app_seq): " + listMap.containsKey("ben_app_seq"));
        		System.out.println("containsKey(undefined): " + listMap.containsKey("undefined"));
        		System.out.println("containsValue(1): " + listMap.containsValue(1));
        		System.out.println("containsValue(0): " + listMap.containsValue(0));
        	}
        }
		return list;
	}
}
