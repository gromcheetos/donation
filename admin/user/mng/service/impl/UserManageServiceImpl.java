package admin.user.mng.service.impl;

import java.util.List;

import admin.user.mng.service.UserManageService;
import admin.user.mng.service.UserManageVO;
import admin.user.mng.service.UserDefaultVO;
import egovframework.utl.sim.service.EgovFileScrty;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 일반회원관리에 관한비지니스클래스를 정의한다.
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
 * </pre>
 */
@Service("userManageService")
public class UserManageServiceImpl extends EgovAbstractServiceImpl implements UserManageService {

	/** userManageDAO */
	@Resource(name="userManageDAO")
	private UserManageDAO userManageDAO;

	/** entrprsManageDAO */
	@Resource(name="entrprsManageDAO")
	private EntrprsManageDAO entrprsManageDAO;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;

	/**
	 * 사용자의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param userManageVO 일반회원 등록정보
	 * @return result 등록결과
	 * @throws Exception
	 */
	@Override
	public String insertMber(UserManageVO userManageVO) throws Exception  {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(userManageVO.getMemPw(), userManageVO.getEmailId());
		userManageVO.setMemPw(pass);
		String result = userManageDAO.insertMber(userManageVO);
		return result;
	}

	/**
	 * 기 등록된 사용자 중 검색조건에 맞는 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param uniqId 상세조회대상 일반회원아이디
	 * @return userManageVO 일반회원상세정보
	 * @throws Exception
	 */
	@Override
	public UserManageVO updateMberView(String uniqId) {
		UserManageVO userManageVO = userManageDAO.updateMberView(uniqId);
		return userManageVO;
	}

	/**
	 * 기 등록된 회원 중 검색조건에 맞는 회원들의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param userSearchVO 검색조건
	 * @return List<UserManageVO> 일반회원목록정보
	 */
	@Override
	public List<UserManageVO> selectUserMngList(UserDefaultVO userSearchVO) {
		return userManageDAO.selectUserMngList(userSearchVO);
	}

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return 일반회원총갯수(int)
     */
    @Override
	public int selectUserMngListCnt(UserDefaultVO userSearchVO) {
    	return userManageDAO.selectMberListTotCnt(userSearchVO);
    }

	
    /**
	 * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
	 * @param checkId 중복여부 확인대상 아이디
	 * @return 사용가능여부(아이디 사용회수 int)
	 * @throws Exception
	 */
	@Override
	public int checkIdDplct(String checkId) {
		return userManageDAO.checkIdDplct(checkId);
	}
    
    /**
	 * 화면에 조회된 일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param userManageVO 일반회원수정정보
	 * @throws Exception
	 */
	@Override
	public void updateProcess(UserManageVO userManageVO) throws Exception {
		//패스워드변경을 여기서 해아하나?
		/*String pass = EgovFileScrty.encryptPassword(userManageVO.getPassword(), userManageVO.getMberId());
		userManageVO.setPassword(pass);*/
		userManageDAO.updateProcess(userManageVO);
	}

	/**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상 일반회원아이디
	 * @throws Exception
	 */
	/*@Override
	public void deleteMber(String checkedIdForDel)  {
		String [] delId = checkedIdForDel.split(",");
		for (int i=0; i<delId.length ; i++){
			String [] id = delId[i].split(":");
			if (id[0].equals("USR03")){
		        //업무사용자(직원)삭제
				//userManageDAO.deleteUser(id[1]);
			}else if(id[0].equals("USR01")){
				//일반회원삭제
				mberManageDAO.deleteMber(id[1]);
			}else if(id[0].equals("USR02")){
				//기업회원삭제
				//entrprsManageDAO.deleteEntrprsmber(id[1]);
			}
		}
	}*/

	/**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return 일반회원약관정보(List)
	 * @throws Exception
	 */
	/*@Override
	public List<?> selectStplat(String stplatId)  {
        return userManageDAO.selectStplat(stplatId);
	}*/

	/**
	 * 일반회원암호수정
	 * @param userManageVO 일반회원수정정보(비밀번호)
	 * @throws Exception
	 */
	@Override
	public void updatePassword(UserManageVO userManageVO) {
		userManageDAO.updatePassword(userManageVO);
	}

	/**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param passVO 일반회원암호 조회조건정보
	 * @return userManageVO 일반회원암호정보
	 * @throws Exception
	 */
	@Override
	public UserManageVO selectPassword(UserManageVO passVO) {
		UserManageVO userManageVO = userManageDAO.selectPassword(passVO);
		return userManageVO;
	}
	
}