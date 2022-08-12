package com.team.horizon.dbo;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.team.horizon.models.Brand;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class BrandFacade extends AbstractBrand<Brand> {
    
    private static final String SQL_GET_ALL_BRAND = "SELECT * FROM Brand";
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    
    private Brand getInfoBrandFromSQL(ResultSet resultSet) throws SQLException {
        String getBrandID = resultSet.getString("BrandID");
        String getBrandName = resultSet.getString("BrandName");
        byte[] getImageBrand = resultSet.getBytes("ImageBrand");

        return new Brand(getBrandID, getBrandName, Base64.encode(getImageBrand));
    }

    @Override
    protected List<Brand> getAllBrand(Connection connection) throws SQLException {
        ArrayList<Brand> brandsList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_ALL_BRAND);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    Brand allBrand = getInfoBrandFromSQL(resultSet);
                    brandsList.add(allBrand);
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return brandsList;
    }
    
}
