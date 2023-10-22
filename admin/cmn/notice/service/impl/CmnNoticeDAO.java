package admin.cmn.notice.service.impl;
import java.util.Iterator;
import java.util.List;

import admin.cmn.notice.service.Board;
import admin.cmn.notice.service.BoardVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 * 공지사항 관리를 위한 데이터 접근 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.19
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("CmnNoticeDAO")
public class CmnNoticeDAO extends EgovComAbstractDAO {

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public List<BoardVO> selectNoticeList(BoardVO boardVO) throws Exception {
    	return selectList("CmnNoticeDAO.selectCmnNoticeList", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectNoticeListCnt(BoardVO boardVO) throws Exception {
    	return (Integer)selectOne("CmnNoticeDAO.selectCmnNoticeListCnt", boardVO);
    }

	/**
	 * 공지사항 상세 정보
	 * @param boardVO
	 * @return
	 */
    public BoardVO selectCmnNoticeView(BoardVO boardVO) {

		return (BoardVO)selectOne("CmnNoticeDAO.selectCmnNoticeView", boardVO);
	}

	/*
	 *  공지사항 등록
	 */
    public void insertCmnNotice(Board board) {
		// TODO Auto-generated method stub
		insert("CmnNoticeDAO.insertCmnNotice", board);
	}

    /**
     *  공지사항 수정
     * @param board
     */
	public void updateCmnNotice(Board board) {
		// TODO Auto-generated method stub
		update("CmnNoticeDAO.updateCmnNotice", board);
	}

    /**
     * 공지사항 삭제
     *
     * @param board
     * @throws Exception
     */
    public void deleteCmnNotice(Board board) throws Exception {
		update("CmnNoticeDAO.deleteCmnNotice", board);
    }

}
