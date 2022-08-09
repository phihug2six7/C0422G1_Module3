package service.facility.impl;

import model.facility.Facility;
import model.facility.FacilityRentType;
import model.facility.FacilityType;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.sql.SQLException;
import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository iFacilityRepository= new FacilityRepository();
    @Override
    public List<Facility> displayAllFacility() {
        return iFacilityRepository.displayAllFacility();
    }

    @Override
    public Facility findById(int id) {
        return iFacilityRepository.findById(id);
    }

    @Override
    public void addFacility(Facility facility) {
        iFacilityRepository.addFacility(facility);
    }

    @Override
    public boolean updateFacility(Facility facility) throws SQLException {
        return iFacilityRepository.updateFacility(facility);
    }

    @Override
    public boolean removeFacility(int id) throws SQLException {
        return iFacilityRepository.removeFacility(id);
    }

    @Override
    public List<FacilityRentType> displayAllRentType() {
        return iFacilityRepository.displayAllRentType();
    }

    @Override
    public List<FacilityType> displayAllFacilityType() {
        return iFacilityRepository.displayAllFacilityType();
    }
}
