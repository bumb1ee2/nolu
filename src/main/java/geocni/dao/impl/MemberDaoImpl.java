package geocni.dao.impl;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import geocni.dao.MemberDao;
import geocni.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void memberReg(MemberVo mvo) {
		sqlSession.insert("member.memberReg", mvo);
	}
	
	@Override
	public int idChk(MemberVo mvo) {
		return sqlSession.selectOne("member.idChk", mvo);
	}
	
	@Override
	public boolean loginCheck(MemberVo mvo) {
		String name = sqlSession.selectOne("member.loginCheck", mvo);
		return (name == null) ? false : true;
	}
	
	@Override
	public MemberVo viewMember(MemberVo mvo) {
		return sqlSession.selectOne("member.viewMember", mvo);
	}
	
	@Override
	public void logout(HttpSession session) {
		
	}
}
