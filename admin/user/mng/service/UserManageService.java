package admin.user.mng.service;

import java.util.List;

/**
 * 일반회원관리에 관한 인터페이스클래스를 정의한다.
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
public interface UserManageService {

	/**
	 * 사용자의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param userManageVO 일반회원 등록정보
	 * @return 등록결과
	 * @throws Exception
	 */
	public String insertMber(UserManageVO userManageVO) throws Exception;

	/**
	 * 기 등록된 사용자 중 검색조건에 맞는 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param mberId 상세조회대상 일반회원아이디
	 * @return userManageVO 일반회원상세정보
	 * @throws Exception
	 */
	public UserManageVO updateMberView(String mberId) throws Exception;

	/**
	 * 기 등록된 회원 중 검색조건에 맞는 회원들의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param userSearchVO 검색조건
	 * @return List<UserManageVO> 일반회원목록정보
	 * @throws Exception
	 */
	public List<UserManageVO> selectUserMngList(UserDefaultVO userSearchVO) throws Exception;

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return 일반회원총갯수(int)
     * @throws Exception
     */
    public int selectUserMngListCnt(UserDefaultVO userSearchVO) throws Exception;

    /**
	 * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
	 * @param checkId 중복여부 확인대상 아이디
	 * @return 사용가능여부(아이디 사용회수 int)
	 * @throws Exception
	 */
	public int checkIdDplct(String checkId) throws Exception;
    
    
    /**
     * 회원정보수정 프로세스
     * @param userManageVO
     * @throws Exception
     */
	public void updateProcess(UserManageVO userManageVO) throws Exception;

	/**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상 일반회원아이디
	 * @throws Exception
	 */
	/*public void deleteMber(String checkedIdForDel) throws Exception;*/

	/**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return 일반회원약관정보(List)
	 * @throws Exception
	 */
	/*public List<?> selectStplat(String stplatId)  throws Exception;*/

	/**
	 * 일반회원암호수정
	 * @param userManageVO 일반회원수정정보(비밀번호)
	 * @throws Exception
	 */
	public void updatePassword(UserManageVO userManageVO) throws Exception;

	/**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param passVO 일반회원암호 조회조건정보
	 * @return userManageVO 일반회원암호정보
	 * @throws Exception
	 */
	public UserManageVO selectPassword(UserManageVO passVO) throws Exception;

}