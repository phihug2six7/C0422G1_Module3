package service.facility;

import model.facility.Facility;
import model.facility.FacilityRentType;
import model.facility.FacilityType;

import java.sql.SQLException;
import java.util.List;

public interface IFacilityService {
    List<Facility> displayAllFacility();
    Facility findById(int id);
    void addFacility(Facility facility);
    boolean updateFacility(Facility facility) throws SQLException;
    boolean removeFacility(int id) throws SQLException;
    List<FacilityRentType> displayAllRentType();
    List<FacilityType> displayAllFacilityType();
}
