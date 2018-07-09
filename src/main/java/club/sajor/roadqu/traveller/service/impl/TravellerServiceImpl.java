package club.sajor.roadqu.traveller.service.impl;

import club.sajor.roadqu.traveller.dao.TravellerDao;
import club.sajor.roadqu.traveller.model.Traveller;
import club.sajor.roadqu.traveller.service.TravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "travellerService")
public class TravellerServiceImpl implements TravellerService {

    @Autowired
    private TravellerDao travellerDao;

    @Override
    public List<Traveller> selectAllTraveller() {
        return travellerDao.selectAllTraveller();
    }

    @Override
    public List<Traveller> selectTravellerByDestination(String tkdestination) {
        return travellerDao.selectTravellerByDestination(tkdestination);
    }

    @Override
    public Traveller selectTravellerById(String tkid) {
        return travellerDao.selectTravellerById(tkid);
    }
}
