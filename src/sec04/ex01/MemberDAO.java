package sec04.ex01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sec04.ex01.DBConnectionMgr;

	public class MemberDAO {

		DBConnectionMgr ds = DBConnectionMgr.getInstance();

		
		//회원가입//
		
		public void addMember(String id, String pwd, String name, String email) {
			String sql = "insert into t_member values(?,?,?,?,now())";
			Connection con = null;
			PreparedStatement ps = null;
			int result=0;
			try {
				con=ds.getConnection();
				ps=con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pwd);
				ps.setString(3, name);
				ps.setString(4, email);
				result=ps.executeUpdate();
				System.out.println(result);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ds.freeConnection(con, ps);
			}
			
		}

		
	//////회원정보 가져오기//////////////
		public ArrayList<MemberVO> listMembers() {
			String sql = "select * from t_member";

			ArrayList<MemberVO> list =new ArrayList<MemberVO>();
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				con=ds.getConnection();
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setId(rs.getString("id"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setEmail(rs.getString("email"));
					vo.setJoinDate(rs.getDate("joinDate"));
					list.add(vo);
				
				}				
			}
			catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ds.freeConnection(con,ps,rs);
			}
			
			return list;
		}
		
		


		////아이디 중복확인
		public int idCheck(String id) {
			String sql = "select * from t_member where id=?";
			int result = 0;
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				con=ds.getConnection();
				ps=con.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					result=1;
					System.out.println(result);
				}	
			}
			catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				ds.freeConnection(con,ps);
			}
			
			
			return result;
		}

		//수정 전 회원정보 가져오기 
		public MemberVO findMember(String id) {
			String sql="select * from t_member where id=?";
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			MemberVO memInfo = null;
			
			try {
				con=ds.getConnection();
				ps=con.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				
				//아이디 하나만 존재하니까 if 써줘야
				if(rs.next()) {
					memInfo = new MemberVO();
					memInfo.setId(rs.getString("id"));
					memInfo.setPwd(rs.getString("pwd"));
					memInfo.setName(rs.getString("name"));
					memInfo.setEmail(rs.getString("email"));
					memInfo.setJoinDate(rs.getDate("joinDate"));
				}
			} catch (Exception e) {

			}
			
			return memInfo;
		
		}

		//회원정보 수정하기
		public void modMember(String id, String pwd, String name, String email) {
			String sql="";
			
			
		}

		//회원 삭제 
		public void delMember(String id) {
			String sql="delete from t_member where id=?";
			Connection con=null;
			PreparedStatement ps=null;
			int result=0;
			try {
				con=ds.getConnection();
				ps.setString(1, id);
				result=ps.executeUpdate();
			
			
			} catch (Exception e) {
				// TODO: handle exception
			}
		}






	}
