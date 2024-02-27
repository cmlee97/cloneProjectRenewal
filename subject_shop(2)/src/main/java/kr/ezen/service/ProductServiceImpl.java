package kr.ezen.service;

import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.mapper.AdminMapper;
import kr.ezen.shop.mapper.MemberMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private AdminMapper mapper;



    //제품등록
    @SneakyThrows
    @Override
    public int prodInput(MultipartHttpServletRequest mhr, HttpServletRequest request) {
        String repo = "resources/fileRepo";
        //서버의 물리경로 얻어오기                                        //OS에 따라\\(윈도우) //
        String savePath = request.getServletContext().getRealPath("")+File.separator+repo;
        System.out.println(savePath);

        Map map = new HashMap();

        //mhr 텍스트 파일, 바이너리 파일의 정보를 모두 얻어올 수 있음
        Enumeration<String> enu = mhr.getParameterNames();
        //일반 텍스트파일의 파라미터명(key), 해당 파라미터명의 value값을 가져옴
        while(enu.hasMoreElements()) {
            String paramName = enu.nextElement();
            String paramValue = mhr.getParameter(paramName);
            System.out.println(paramName + " : "+ paramValue);
            map.put(paramName, paramValue);
        }
        //파일
        Iterator<String> iter = mhr.getFileNames();

        List<String> fileList = new ArrayList<String>();

        while(iter.hasNext()) {

            String fileParamName = iter.next();
            System.out.println("fileParamName : "+ fileParamName);

            //MultipartFile : 파일정보를 갖고 있는 객체
            MultipartFile mFile = mhr.getFile(fileParamName);
            String originName = mFile.getOriginalFilename();
            System.out.println("originName : " + originName);

            File file = new File(savePath+"\\"+fileParamName);
            if(mFile.getSize() != 0) {//업로드된 경우
                if(!file.exists()) {//파일이 존재하지 않으면
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();//임시파일 생성

                    }//if
                }//if
                File uploadFile = new File(savePath+"\\"+originName);
                //중복시 파일명 대체
                if(uploadFile.exists()) {
                    originName = System.currentTimeMillis()+" "+originName;
                    uploadFile = new File(savePath+"\\"+originName);
                }

                //실제 파일을 업로드하기
                mFile.transferTo(uploadFile);
                fileList.add(originName);
                map.put("p_image", originName);
            }//if
        }//while
        mapper.prodInput(map);
        return 0;
    }

    @Override
    public ProductDTO prodInfo(int p_num) {
        ProductDTO pDto = mapper.prodInfo(p_num);
        return pDto;
    }

    @Override
    @SneakyThrows
    public int prodUpdate(MultipartHttpServletRequest mhr, HttpServletRequest request) {
        String repo = "resources/fileRepo";
        //서버의 물리경로 얻어오기                                        //OS에 따라\\(윈도우) //
        String savePath = request.getServletContext().getRealPath("")+File.separator+repo;
        System.out.println(savePath);

        Map map = new HashMap();

        //mhr 텍스트 파일, 바이너리 파일의 정보를 모두 얻어올 수 있음
        Enumeration<String> enu = mhr.getParameterNames();
        //일반 텍스트파일의 파라미터명(key), 해당 파라미터명의 value값을 가져옴
        while(enu.hasMoreElements()) {
            String paramName = enu.nextElement();
            String paramValue = mhr.getParameter(paramName);
            System.out.println(paramName + " : "+ paramValue);
            map.put(paramName, paramValue);
        }
        //파일
        Iterator<String> iter = mhr.getFileNames();

        List<String> fileList = new ArrayList<String>();

        while(iter.hasNext()) {

            String fileParamName = iter.next();
            System.out.println("fileParamName : "+ fileParamName);

            //MultipartFile : 파일정보를 갖고 있는 객체
            MultipartFile mFile = mhr.getFile(fileParamName);
            String originName = mFile.getOriginalFilename();
            if(originName==""){
                originName = mhr.getParameter("p_imageOld");
            }
            System.out.println("originName : " + originName);

            File file = new File(savePath+"\\"+fileParamName);
            if(mFile.getSize() != 0) {//업로드된 경우
                if(!file.exists()) {//파일이 존재하지 않으면
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();//임시파일 생성

                    }//if
                }//if
                File uploadFile = new File(savePath+"\\"+originName);
                //중복시 파일명 대체
                if(uploadFile.exists()) {
                    originName = System.currentTimeMillis()+" "+originName;
                    uploadFile = new File(savePath+"\\"+originName);
                }

                //실제 파일을 업로드하기
                mFile.transferTo(uploadFile);
                fileList.add(originName);
                map.put("p_image", originName);
            }//if
        }//while
        mapper.prodUpdate(map);
        return 0;
    }

    @Override
    public int prodDelete(int p_num, String p_image, HttpServletRequest request) {
        String realPath = request.getServletContext().getRealPath("resources/fileRepo");

        File delFile = null;
        //서버에 있는 이미지 파일 삭제
        if(p_image !=null) {
            //삭제할 파일
            delFile = new File(realPath + "/"+ p_image);
            if(delFile.exists()) {
                if(delFile.delete()) System.out.println("이미지 파일 삭제 완료");
            }
        }
        mapper.prodDelete(p_num);
        return 0;
    }


}
