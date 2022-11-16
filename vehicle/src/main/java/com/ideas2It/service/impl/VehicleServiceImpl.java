package com.ideas2It.service.impl;

import java.util.Date;
import java.util.List;

import com.ideas2It.dao.VehicleDao;
import com.ideas2It.dao.impl.VehicleDaoImpl;
import com.ideas2It.model.Dealer;
import com.ideas2It.model.Manufacturer;
import com.ideas2It.model.TwoWheeler;
import com.ideas2It.service.VehicleService;
import com.ideas2It.util.constant.Constants;
import com.ideas2It.util.customException.VehicleManagementException;
import com.ideas2It.util.enumeration.Brand;
import com.ideas2It.util.enumeration.Colours;
import com.ideas2It.util.enumeration.FuelType;
import com.ideas2It.util.enumeration.Type;
import com.ideas2It.util.logger.VehicleManagementLogger;

/**
 * The vehicle service class that impliments an application that Simply create,
 * view, search, update and delete these operation occurs in this class
 *
 * @version 1.0
 * @author arunkumar
 */
public class VehicleServiceImpl implements VehicleService {
	private VehicleDao vehicleDao = new VehicleDaoImpl();

	/**
	 * It's sent generated vehicle Code
	 *
	 * @return its return vehicle Code 
	 * Ex: Vehicle-1,Vehicle-2,.....
	 */
	private String generateVehicleCode() throws VehicleManagementException {
		int code = vehicleDao.getLastId();
		String value = "Vehicle-" + (++code);
		return value;
	}
	
	/**
	 * {@inheritdoc}
	 */
	public TwoWheeler createTwoWheeler(TwoWheeler twoWheeler)
			throws VehicleManagementException {
		twoWheeler.setVehicleCode(generateVehicleCode());
		return vehicleDao.insertTwoWheeler(twoWheeler);
	}

	/**
	 * {@inheritDoc}
	 */
	public List<TwoWheeler> getTwoWheelers() throws VehicleManagementException {
		List<TwoWheeler> twoWheelers = vehicleDao.retriveTwoWheelers();
		if (twoWheelers.isEmpty()) {
			throw new VehicleManagementException(Constants.ALERT_MESSAGE);
		}
		return twoWheelers;
	}

	/**
	 * {@inheritdoc}
	 */
	public TwoWheeler getTwoWheelerByCode(String vehicleCode) throws VehicleManagementException {
		TwoWheeler twoWheeler = vehicleDao.retriveTwoWheelerByCode(vehicleCode);
		if (null == twoWheeler) {
			throw new VehicleManagementException("\nplease provide valid Code.");
		}
		return twoWheeler;
	}

	/**
	 * {@inheritdoc}
	 */
	public boolean deleteTwoWheelerByCode(String vehicleCode) throws VehicleManagementException {
		boolean result = vehicleDao.deleteTwoWheelerByCode(vehicleCode);
		if (!result) {
			throw new VehicleManagementException(Constants.ALERT_MESSAGE + "\nplease provide valid Code."
					+ "\nif your not register vehicle please create");
		}
		return result;
	}

	/**
	 * {@inheritdoc}
	 */
	public boolean updateVehicle(TwoWheeler twoWheeler) throws VehicleManagementException {
		boolean found = vehicleDao.updateVehicle(twoWheeler);
		if (!found) {
			throw new VehicleManagementException(Constants.ALERT_MESSAGE);
		}
		return found;
	}

	/**
	 * {@inheritdoc}
	 */
	public List<TwoWheeler> retriveVehiclesInRange(String start, String end) throws VehicleManagementException {
		List<TwoWheeler> twoWheelers = vehicleDao.retriveVehiclesInRange(start, end);
		if (null == twoWheelers) {
			VehicleManagementLogger.displayVehicleInfo("Your list empty");
		}
		return twoWheelers;
	}

	/**
	 * {@inheritdoc}
	 */
	public List<TwoWheeler> searchTwoWheeler(String value) throws VehicleManagementException {
		List<TwoWheeler> twoWheelers = vehicleDao.searchVehicle(value);
		if (twoWheelers.isEmpty() || null == twoWheelers) {
			throw new VehicleManagementException(Constants.ALERT_MESSAGE);
		}
		return twoWheelers;

	}

	/**
	 * {@inheritdoc}
	 */
	public List<TwoWheeler> getTwoWheelerByCodes(String codes[]) throws VehicleManagementException {
		List<TwoWheeler> twoWheelers = vehicleDao.retriveTwoWheelerByCodes(codes);
		if (null == twoWheelers || twoWheelers.isEmpty() ) {
			VehicleManagementLogger.displayVehicleInfo("Your list empty");
		}
		return twoWheelers;
	}
}