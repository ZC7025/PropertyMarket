package com.ht.common.util;

import com.ht.common.Constants;
import org.apache.struts2.ServletActionContext;

import java.io.File;

/**
 * 
 * 上传文件工具类
 *
 */
public class FileUtil {

	/**
	 * 获取文件上传的路径
	 * @return
	 */
	public static String uploadPath() {
		String rootPath = ServletActionContext.getServletContext().getRealPath("/");
		File uploads = new File(rootPath, Constants.UPLOADS);
		if (!uploads.exists()) {
			uploads.mkdir();
		}
		return uploads.getAbsolutePath();
	}
}
