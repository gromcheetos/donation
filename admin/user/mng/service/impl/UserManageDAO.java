package admin.user.mng.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import admin.user.mng.service.UserManageVO;
import admin.user.mng.service.UserDefaultVO;

import org.springframework.stereotype.Repository;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
 * @author SSY
 * @since 2019.11.28
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.11.28  SSY          최초 생성
 *   
 *
 * </pre>
 */
@Repository("userManageDAO")
public class UserManageDAO extends EgovComAbstractDAO{

	/*
	 * 회원관리 목록정보
	 */
	public List<UserManageVO> selectUserMngList(UserDefaultVO userSearchVO){
        return selectList("userManageDAO.selectUserMngList", userSearchVO);
    }

	/*
	 * 회원관리 목록 Count
	 */
	public int selectMberListTotCnt(UserDefaultVO userSearchVO) {
        return (Integer)selectOne("userManageDAO.selectUserMngListCnt", userSearchVO);
    }

    /*
     * 회원관리 삭제
     */
    public void deleteMber(String delId){
        delete("userManageDAO.deleteMber_S", delId);
    }

    /*
     * 회원관리 등록 Process
     */
    public String insertMber(UserManageVO userManageVO){
        return String.valueOf((int)insert("userManageDAO.insertMber", userManageVO));
    }

    /*
     * 회원관리 수정화면 호출
     */
    public UserManageVO updateMberView(String mberId){
        return (UserManageVO) selectOne("userManageDAO.updateMberView", mberId);
    }

    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param userManageVO 일반회원수정정보
     */
    public void updateProcess(UserManageVO userManageVO){
        update("userManageDAO.updateProcess",userManageVO);
    }

    /**
     * 일반회원 암호수정
     * @param passVO 기업회원수정정보(비밀번호)
     */
    public void updatePassword(UserManageVO passVO) {
        update("userManageDAO.updatePassword", passVO);
    }

    /**
     * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     * @param userManageVO 일반회원암호 조회조건정보
     * @return UserManageVO 일반회원 암호정보
     */
    public UserManageVO selectPassword(UserManageVO userManageVO){
    	return (UserManageVO) selectOne("userManageDAO.selectPassword_S", userManageVO);
    }
    
    /**
     * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
     * @param checkId 중복체크대상 아이디
     * @return int 사용가능여부(아이디 사용회수 )
     */
    public int checkIdDplct(String checkId){
        return (Integer)selectOne("userManageDAO.checkIdDplct_S", checkId);
    }
}