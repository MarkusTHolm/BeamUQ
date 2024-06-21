#include "writeVTU.h"

std::vector<vtu11::VtkIndexType> indexTypeVector(Eigen::VectorXd mat) {
    std::vector<vtu11::VtkIndexType> vec(mat.data(), mat.data() + mat.rows() * mat.cols());
    return vec;
}

std::vector<vtu11::VtkCellType> cellTypeVector(Eigen::VectorXd mat) {
    std::vector<vtu11::VtkCellType> vec(mat.data(), mat.data() + mat.rows() * mat.cols());
    return vec;
}

std::vector<double> doubleVector(Eigen::VectorXd mat) {
    std::vector<double> vec(mat.data(), mat.data() + mat.rows() * mat.cols());
    return vec;
}

void writeVTU(Eigen::VectorXd points, Eigen::VectorXd connectivity, 
              Eigen::VectorXd offsets, Eigen::VectorXd types,
              py::list cellNames, Eigen::MatrixXd cellData,
              py::list pointNames, Eigen::MatrixXd pointData,
              std::string writeFormat, std::string fullPath) {
    // Write data to VTU file using the header-only library: vtu11

    // Convert to STL vectors
    auto v_points = doubleVector(points);
    auto v_connectivity = indexTypeVector(connectivity);
    auto v_offsets = indexTypeVector(offsets);
    auto v_types = cellTypeVector(types);
    auto v_cellNames = cellNames.cast<std::vector<std::string>>();  
    auto v_pointNames = pointNames.cast<std::vector<std::string>>();
    
    int numCells = cellData.cols();
    int numPoints = pointData.cols();

    // Create mesh type
    vtu11::Vtu11UnstructuredMesh mesh { v_points, v_connectivity, v_offsets, v_types };

    // Organize dataset info
    std::vector<std::tuple<std::string, vtu11::DataSetType, long unsigned int>> dataSetInfoTuple;

    for (int i = 0; i < numPoints; i++) {
        dataSetInfoTuple.push_back({v_pointNames[i], vtu11::DataSetType::PointData, 1});
    }

    for (int i = 0; i < numCells; i++) {
        dataSetInfoTuple.push_back({v_cellNames[i], vtu11::DataSetType::CellData, 1});
    }

    std::vector<vtu11::DataSetInfo> dataSetInfo = dataSetInfoTuple;

    // Organize dataset data 
    std::vector< std::vector<double> > dataSetDataVector;

    for (int i = 0; i < numPoints; i++) {
        auto v_data = doubleVector(pointData.col(i));
        dataSetDataVector.push_back(v_data);
    }
    
    for (int i = 0; i < numCells; i++) {
        auto v_data = doubleVector(cellData.col(i));
        dataSetDataVector.push_back(v_data);
    }

    std::vector<vtu11::DataSetData> dataSetData = dataSetDataVector;

    // Write data to .vtu file using specified format
    vtu11::writeVtu(fullPath, mesh, dataSetInfo, dataSetData, writeFormat);
}