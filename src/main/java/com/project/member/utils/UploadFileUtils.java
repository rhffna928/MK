package com.project.member.utils;

import net.coobird.thumbnailator.Thumbnails;
import org.springframework.util.FileCopyUtils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

public class UploadFileUtils {

    static final int THUM_WIDTH = 300;
    static final int THUM_HEIGHT = 300;
    public static String fileUpload(String uploadPath, String filename, byte[] fileData, String ymdPath
                                    ) throws Exception{
        //랜덤
        UUID uid = UUID.randomUUID();
        //새로운 파일 이름 생성 = 랜덤 + _ + 파일 이름
        String newFileName = uid + "_" + filename;
        //이미지경로 = 업로드경로 + 날짜
        String imgPath = uploadPath + ymdPath;

        File target = new File(imgPath, newFileName);
        FileCopyUtils.copy(fileData, target);

        String thumbFileName = "s_"+ newFileName;
        File image = new File(imgPath + File.separator + newFileName);

        File thumbnail = new File(imgPath + File.separator+"s"+File.separator+thumbFileName);

        if(image.exists()){
            thumbnail.getParentFile().mkdirs();
            Thumbnails.of(image).size(THUM_WIDTH,THUM_HEIGHT).toFile(thumbnail);
        }
        return newFileName;
    }

    public static String calPath(String uploadPath){
        Calendar cal = Calendar.getInstance();
        String yearPath = File.separator + cal.get(Calendar.YEAR);
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

        makeDir(uploadPath, yearPath, monthPath, datePath);
        makeDir(uploadPath, yearPath, monthPath, datePath+"\\s");

        return datePath;
    }
    private static void makeDir(String uploadPath,String... paths){
        if(new File(paths[paths.length - 1]).exists()){return;}
        for(String path : paths){
            File dirPath = new File(uploadPath+path);
            if(!dirPath.exists()){
                dirPath.mkdir();
            }
        }
    }
}
