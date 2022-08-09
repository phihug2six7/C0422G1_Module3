package repository.facility.impl;

import model.customer.Customer;
import model.facility.Facility;
import model.facility.FacilityRentType;
import model.facility.FacilityType;
import repository.BaseRepository;
import repository.facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String DISPLAY_ALL_FACILITY="select * from dich_vu where `status`=1";
    private static final String FIND_BY_ID="select*from dich_vu where ma_dich_vu=?";
    private static final String ADD_FACILITY="insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da," +
            "ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem) values (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String DISPLAY_ALL_RENT_TYPE="select * from kieu_thue";
    private static final String DISPLAY_ALL_FACILITY_TYPE="select * from loai_dich_vu";
    private static final String UPDATE_FACILITY="update dich_vu set ten_dich_vu =?,dien_tich=?,chi_phi_thue=?,so_nguoi_toi_da=?," +
            "ma_kieu_thue=?,ma_loai_dich_vu=?,tieu_chuan_phong=?,mo_ta_tien_nghi_khac=?,dien_tich_ho_boi=?," +
            "so_tang=?,dich_vu_mien_phi_di_kem=? where ma_dich_vu=?";
    private static final String REMOVE_FACILITY_STATUS="update dich_vu set `status` = 0 where ma_dich_vu = ?";
    @Override
    public List<Facility> displayAllFacility() {
        Connection connection= BaseRepository.getConnection();
        List<Facility> facilityList =new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DISPLAY_ALL_FACILITY);
            ResultSet rs= preparedStatement.executeQuery();
            Facility facility=null;
            while (rs.next()){
                int facilityID=rs.getInt("ma_dich_vu");
                String nameFacility=rs.getString("ten_dich_vu");
                int areaFacility=rs.getInt("dien_tich");
                double costFacility=rs.getDouble("chi_phi_thue");
                int maxPeopleFacility=rs.getInt("so_nguoi_toi_da");
                int rentTypeIdFacility=rs.getInt("ma_kieu_thue");
                int serviceCodeFacility=rs.getInt("ma_loai_dich_vu");
                String standardRoom=rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience= rs.getNString("mo_ta_tien_nghi_khac");
                double poolArea=rs.getDouble("dien_tich_ho_boi");
                int numberOfFloors=rs.getInt("so_tang");
                String facilityFree=rs.getString("dich_vu_mien_phi_di_kem");
                facility= new Facility(facilityID,nameFacility,areaFacility,costFacility,maxPeopleFacility,
                        rentTypeIdFacility,serviceCodeFacility,standardRoom,descriptionOtherConvenience,
                        poolArea,numberOfFloors,facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Facility findById(int id) {
       Facility facility=null;
       Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                int facilityID=rs.getInt("ma_dich_vu");
                String nameFacility=rs.getString("ten_dich_vu");
                int areaFacility=rs.getInt("dien_tich");
                double costFacility=rs.getDouble("chi_phi_thue");
                int maxPeopleFacility=rs.getInt("so_nguoi_toi_da");
                int rentTypeIdFacility=rs.getInt("ma_kieu_thue");
                int serviceCodeFacility=rs.getInt("ma_loai_dich_vu");
                String standardRoom=rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience= rs.getNString("mo_ta_tien_nghi_khac");
                double poolArea=rs.getDouble("dien_tich_ho_boi");
                int numberOfFloors=rs.getInt("so_tang");
                String facilityFree=rs.getString("dich_vu_mien_phi_di_kem");
                facility= new Facility(facilityID,nameFacility,areaFacility,costFacility,maxPeopleFacility,
                        rentTypeIdFacility,serviceCodeFacility,standardRoom,descriptionOtherConvenience,
                        poolArea,numberOfFloors,facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public void addFacility(Facility facility) {
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(ADD_FACILITY);
            preparedStatement.setString(1,facility.getName());
            preparedStatement.setInt(2,facility.getArea());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getMaxPeople());
            preparedStatement.setInt(5,facility.getRentTypeId());
            preparedStatement.setInt(6,facility.getServiceCode());
            preparedStatement.setString(7,facility.getStandardRoom());
            preparedStatement.setString(8,facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9,facility.getPoolArea());
            preparedStatement.setInt(10,facility.getNumberOfFloors());
            preparedStatement.setString(11,facility.getFacilityFree());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean updateFacility(Facility facility) throws SQLException {
        boolean rowUpdate;
        Connection connection=BaseRepository.getConnection();
        PreparedStatement preparedStatement= connection.prepareStatement(UPDATE_FACILITY);
        preparedStatement.setString(1,facility.getName());
        preparedStatement.setInt(2,facility.getArea());
        preparedStatement.setDouble(3,facility.getCost());
        preparedStatement.setInt(4,facility.getMaxPeople());
        preparedStatement.setInt(5,facility.getRentTypeId());
        preparedStatement.setInt(6,facility.getServiceCode());
        preparedStatement.setString(7,facility.getStandardRoom());
        preparedStatement.setString(8,facility.getDescriptionOtherConvenience());
        preparedStatement.setDouble(9,facility.getPoolArea());
        preparedStatement.setInt(10,facility.getNumberOfFloors());
        preparedStatement.setString(11,facility.getFacilityFree());
        preparedStatement.setInt(12,facility.getIdFacility());
        rowUpdate=preparedStatement.executeUpdate()>0;
        return rowUpdate;
    }

    @Override
    public boolean removeFacility(int id) throws SQLException {
        boolean rowRemove;
        Connection connection=BaseRepository.getConnection();
        PreparedStatement preparedStatement= connection.prepareStatement(REMOVE_FACILITY_STATUS);
        preparedStatement.setInt(1,id);
        rowRemove=preparedStatement.executeUpdate()>0;
        return rowRemove;
    }

    @Override
    public List<FacilityRentType> displayAllRentType() {
        Connection connection=BaseRepository.getConnection();
        List<FacilityRentType> facilityRentTypeList = new ArrayList<>();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(DISPLAY_ALL_RENT_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int rentTypeId = rs.getInt(1);
                String rentTypeName = rs.getString(2);
                facilityRentTypeList.add(new FacilityRentType(rentTypeId, rentTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityRentTypeList;
    }


    @Override
    public List<FacilityType> displayAllFacilityType() {
        Connection connection=BaseRepository.getConnection();
        List<FacilityType> facilityTypeList = new ArrayList<>();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(DISPLAY_ALL_FACILITY_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int facilityTypeId = rs.getInt(1);
                String facilityTypeName = rs.getString(2);
                facilityTypeList.add(new FacilityType(facilityTypeId, facilityTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeList;
    }
}
