package club.sajor.roadqu.traveller.service;

import club.sajor.roadqu.traveller.model.Traveller;

import java.util.List;

public interface TravellerService {
    List<Traveller> selectAllTraveller();

    List<Traveller> selectTravellerByDestination(String tkdestination);

    Traveller selectTravellerById(String tkid);

    void addTraveller(Traveller traveller);

    List<Traveller> selectTravellerByUserId(String userid, int page);

    void deleteTravellerById(String tkid);
}
