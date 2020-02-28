package com.tj.ex.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.jmx.snmp.Enumerated;
import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;

public class MJoinService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024 * 1024; // 최대 업로드 사이즈 : 1메가
		String mPhoto = null;
		try {
			// mRequest 객체 생성한후 파일이름 받아오기
			
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			Enumeration<String> params = mRequest.getFileNames();
			//while(params.hasMoreElements()) {
			String param = params.nextElement();				
			//}
			// 파파라미터값 받아오기
			mPhoto = mRequest.getFilesystemName(param);
			mPhoto = (mPhoto == null) ? "NOIMG.JPG" : mPhoto;
			String mId = mRequest.getParameter("mId");
			String mPw = mRequest.getParameter("mPw");
			String mName = mRequest.getParameter("mName");
			String mEmail = mRequest.getParameter("mEmail");
			String mBirthStr = mRequest.getParameter("mBirth");
			Date mBirth = null;
			if(!mBirthStr.equals("")) {
				mBirth = Date.valueOf(mBirthStr);
			}
			String mAddress = mRequest.getParameter("mAddress");
			MemberDao mDao = MemberDao.getInstance();
			
			// 아이디 중복체크
			int result = mDao.mIdConfirm(mId);
			// 없는 아이디면 dto 만들기
			if(result == MemberDao.NONEXISTENT) {
				MemberDto member = new MemberDto(mId, mPw, mName, mEmail, mPhoto, mBirth, mAddress, null);
				System.out.println("MJoinService.java : "+member.toString());
				result = mDao.joinMember(member);
				if(result == MemberDao.SUCCESS) {
					HttpSession session = request.getSession();
					session.setAttribute("mId", mId);
					request.setAttribute("joinResult", "회원가입이 완료 되었습니다.");
				} else {
					request.setAttribute("errorMsg", "회원가입이 실패 되었습니다. 길이 초과");					
				}
			} else {
				request.setAttribute("errorMsg", "중복된 ID라 회원가입 불가합니다.");
			}
			
		} catch (Exception e) {
			System.out.println("multipart : "+e.getMessage());
		}
		// 업로드된 파일을 소스폴더로 복사
		File serverFile = new File(path + "/" + mPhoto);
		if(!mPhoto.equals("NOIMG.JPG") && serverFile.exists()) {
			InputStream is = null;
			OutputStream os = null;
			
			try {
				is = new FileInputStream(serverFile);
				/* 집과 학원 저장경로가 다르다 따로 설정해주기
				 * 
				 *  학원 경로
				 *  os = new FileOutputStream("D:/mega_IT/source/6_JSP/ch19_mvc3_member/WebContent/memberPhotoUp/"+mPhoto);
				 *  
				 *  집 경로
				 *  
				 *  os = new FileOutputStream("C:/mega_IT/source/JSP_Study/ch19_mvc3_member/WebContent/memberPhotoUp/"+mPhoto);
				 * */
				os = new FileOutputStream("C:/mega_IT/source/JSP_Study/ch19_mvc3_member/WebContent/memberPhotoUp/"+mPhoto);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nReadByteCnt = is.read(bs);
					if(nReadByteCnt == -1) break;
					os.write(bs, 0, nReadByteCnt);
				}
			} catch (Exception e) {
				System.out.println("파일복사예외"+e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e2) { }
			}
		}
	}
}
