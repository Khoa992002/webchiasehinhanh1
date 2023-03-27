package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Images;
import context.DBContext;

public class ImageDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	// Load ra tất cả hình ảnh
	public List<Images> getImages() {
		List<Images> listI = new ArrayList<>();
		String query = "SELECT * from Images ORDER BY idImage desc;";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				listI.add(new Images(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getString(15)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listI;

	}
	// upload hình ảnh
	public void insertImage(String images, String tieucu, String khaudo, String tocdomantrap, String iso,
			String tenmayanh, String loaihinh, String tag, String cate_id, String Uid,String isPublic ) {
		String query = "INSERT INTO Images (images,idCategory,userID,tag,tieuCu,"
				+ "khauDo,tocDoManTrap,iSO,camera,loaiHinhAnh,date,[view],\r\n" + "ready,Ispublic)\r\n"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?, CURRENT_TIMESTAMP,0,0,?);";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, images);
			ps.setString(2, cate_id);
			ps.setString(3, Uid);
			ps.setString(4, tag);
			ps.setString(5, tieucu);
			ps.setString(6, khaudo);
			ps.setString(7, tocdomantrap);
			ps.setString(8, iso);
			ps.setString(9, tenmayanh);
			ps.setString(10, loaihinh);
			ps.setString(11, isPublic);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// Load ra tất cả hình ảnh theo id của user
	public List<Images> getAllImagesbyIdUser(String userID) {
		List<Images> listI = new ArrayList<>();
		String query = "SELECT * FROM Images where userID = ? ORDER BY idImage DESC";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, userID);
			rs = ps.executeQuery();
			while (rs.next()) {
				listI.add(new Images(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getString(15)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listI;

	}
	
	// edit hình ảnh
		public void editImage(String tieucu, String khaudo, String tocdomantrap, String iso, String tenmayanh,
				String loaihinh, String tag, String cate_id, String idImage, String isPublic) {
			String query = "update Images set idCategory = ?,tieuCu = ?,khauDo = ?,\r\n"
					+ "tocDoManTrap = ?,iSO =?,camera =?,loaiHinhAnh = ?,tag = ?, Ispublic = ? where idImage = ?";
			try {
				conn = new DBContext().getConnection();
				ps = conn.prepareStatement(query);
				ps.setString(1, cate_id);
				ps.setString(2, tieucu);
				ps.setString(3, khaudo);
				ps.setString(4, tocdomantrap);
				ps.setString(5, iso);
				ps.setString(6, tenmayanh);
				ps.setString(7, loaihinh);
				ps.setString(8, tag);
				ps.setString(9, idImage);
				ps.setString(10, isPublic);
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		// get hinh ảnh theo id
			public Images getImageByid(String idImage) {
				String query = "select * from Images where idImage = ?";
				try {
					conn = new DBContext().getConnection();
					ps = conn.prepareStatement(query);
					ps.setString(1, idImage);
					rs = ps.executeQuery();
					while (rs.next()) {
						return new Images(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
								rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
								rs.getString(11), rs.getString(12), rs.getInt(13), rs.getInt(14),rs.getString(15));
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				return null;
			}

	
}
