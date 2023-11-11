package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 데이터베이스의 커넥션 풀 설정
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool_test");

			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<CarListBean> getSelectCar() {
		Vector<CarListBean> v = new Vector<>();
		getCon();
		try {
			String sql = "select * from rentcar order by pirce desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				v.add(bean);
				count++;
				if (count >= 3)
					break; // 3개만 벡터에 저장
			}
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// 카테고리 별 자동차 리스트를 저장하는 메소드
	public Vector<CarListBean> getCategoryCar(int cat) {
		Vector<CarListBean> v = new Vector<>();
		getCon();
		try {
			String sql = "select * from rentcar where category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cat);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터를 저장할 빈클래스 생성
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				v.add(bean);
			}
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<CarListBean> getAllCar() {
		Vector<CarListBean> v = new Vector<>();
		getCon();
		try {
			String sql = "select * from rentcar";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터를 저장할 빈클래스 생성
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				v.add(bean);
			}
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public CarListBean getOneCar(int no) {
		CarListBean bean = new CarListBean();
		getCon();
		try {
			String sql = "select * from rentcar where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 회원정보있는지 비교
	public int getMember(String id, String pass) {
		int result = 0; // 회원없음
		getCon();
		try {
			String sql = "select count(*) from member where id = ? and pass1 =? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 하나의 예약정보를 저장하는 메소드
	public void setReserveCar(CarReserveBean bean) {
		getCon();
		try {
			String sql = "insert into carreserve values(reserve_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getPday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getInsurance());
			pstmt.setInt(7, bean.getBicycle());
			pstmt.setInt(8, bean.getTableset());
			pstmt.setInt(9, bean.getBbq());
			pstmt.executeUpdate();
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 예약정보 반환하는 메소드 RentcarDAO.java 추가
	public Vector<CarViewBean> getAllReserve(String id) {
		Vector<CarViewBean> v = new Vector<>();
		CarViewBean bean = null;
		getCon();
		try {
			String sql = "select * from rentcar r join carreserve c on r.no = c.no "
					+ "where sysdate < to_date(rday, 'YYYY-MM-DD')and id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 조인 결과에서의 컬럼순서와 일치
				bean = new CarViewBean();
				bean.setReserveno(rs.getInt(9));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(12));
				bean.setPday(rs.getInt(13));
				bean.setRday(rs.getString(14));
				bean.setInsurance(rs.getInt(15));
				bean.setBicycle(rs.getInt(16));
				bean.setTableset(rs.getInt(17));
				bean.setBbq(rs.getInt(18));
				v.add(bean);
			}
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public void carRemoveReserve(int reserveno) {
		getCon();
		try {
			String sql = "delete from carreserve where reserveno =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserveno);
			pstmt.executeUpdate();
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
