package admin.cmn.notice.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
//import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
//import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;
//import egovframework.utl.fcc.service.EgovDateUtil;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;


import admin.cmn.notice.service.Board;
import admin.cmn.notice.service.BoardVO;
import admin.cmn.notice.service.CmnNoticeService;

/**
 * 공지사항 관리를 위한 서비스 구현 클래스
 * @author 공통 서비스 개발팀 한성곤
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
@Service("CmnNoticeService")
public class CmnNoticeServiceImpl extends EgovAbstractServiceImpl implements CmnNoticeService {

    @Resource(name = "CmnNoticeDAO")
    private CmnNoticeDAO cmnNoticeDAO;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;


    /**
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectNoticeList(BoardVO boardVO) throws Exception {
    	List<BoardVO> list = cmnNoticeDAO.selectNoticeList(boardVO);
    	List<BoardVO> result = new ArrayList<BoardVO>();

   		result = list;

    	int cnt = cmnNoticeDAO.selectNoticeListCnt(boardVO);

    	Map<String, Object> map = new HashMap<String, Object>();

    	map.put("resultList", result);
    	map.put("resultCnt", Integer.toString(cnt));

    	return map;
    }


	@Override
	public BoardVO selectCmnNoticeView(BoardVO boardVO) throws Exception {
		return cmnNoticeDAO.selectCmnNoticeView(boardVO);
	}


	@Override
	public void insertCmnNotice(Board board) throws Exception {
		cmnNoticeDAO.insertCmnNotice(board);
		
	}


	@Override
	public void updateCmnNotice(Board board) throws Exception {
		cmnNoticeDAO.updateCmnNotice(board);
		
	}
    
    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @see egovframework.CmnNoticeService.cop.bbs.brd.service.EgovBBSManageService#deleteBoardArticle(egovframework.let.cop.bbs.brd.service.Board)
     */
    public void deleteCmnNotice(Board board) throws Exception {
    	cmnNoticeDAO.deleteCmnNotice(board);
    }

    /**
     * 게시판에 게시물 또는 답변 게시물을 등록 한다.
     *
     * @see egovframework.CmnNoticeService.cop.bbs.brd.service.EgovBBSManageService#insertBoardArticle(egovframework.let.cop.bbs.brd.service.Board)
     */
    /*public void insertBoardArticle(Board board) throws Exception {
	// SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

	if ("Y".equals(board.getReplyAt())) {
	    // 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
	    // replyLc는 부모글의 ReplyLc + 1

	    @SuppressWarnings("unused")
	    long tmpNttId = 0L; // 답글 게시물 ID

	    tmpNttId = bbsMngDAO.replyBoardArticle(board);

	} else {
	    // 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
	    board.setParnts("0");
	    board.setReplyLc("0");
	    board.setReplyAt("N");

	    bbsMngDAO.insertBoardArticle(board);
	}
    }*/

	/**
     * 게시물 대하여 상세 내용을 조회 한다.
     *
     * @see egovframework.CmnNoticeService.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticle(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    /*public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
	if (boardVO.isPlusCount()) {
	    int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

	    boardVO.setInqireCo(iniqireCo);
	    bbsMngDAO.updateInqireCo(boardVO);
	}

	return bbsMngDAO.selectBoardArticle(boardVO);
    }*/

	/**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @see egovframework.CmnNoticeService.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.let.cop.bbs.brd.service.BoardVO)
     */
    /*public Map<String, Object> selectBoardArticles(BoardVO boardVO) throws Exception {
    	List<BoardVO> list = bbsMngDAO.selectBoardArticleList(boardVO);
    	List<BoardVO> result = new ArrayList<BoardVO>();

   		result = list;

    	int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

    	Map<String, Object> map = new HashMap<String, Object>();

    	map.put("resultList", result);
    	map.put("resultCnt", Integer.toString(cnt));

    	return map;
    }*/

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @see egovframework.CmnNoticeService.cop.bbs.brd.service.EgovBBSManageService#updateBoardArticle(egovframework.let.cop.bbs.brd.service.Board)
     */
    /*public void updateBoardArticle(Board board) throws Exception {
    	bbsMngDAO.updateBoardArticle(board);
    }*/



}
