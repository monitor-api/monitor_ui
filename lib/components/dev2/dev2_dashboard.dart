import 'package:flutter/material.dart';
import 'package:monitor_ui/Utils.dart';
import 'package:monitor_ui/components/environment/environment_status.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/data/employee.dart';
import 'package:monitor_ui/pages/header.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Dev2Dashboard extends StatefulWidget {
  const Dev2Dashboard({Key? key}) : super(key: key);

  @override
  State<Dev2Dashboard> createState() => _Dev2DashboardState();

}

class _Dev2DashboardState extends State<Dev2Dashboard> {

  @override
  void initState() {
    super.initState();
  }

  updateWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            const StatusByEnvironment(),
            const SizedBox(height: defaultPadding),
            Container(
              margin: const EdgeInsets.only(left: defaultPadding),
              padding: const EdgeInsets.all(defaultPadding),
              decoration: boxDecorationWithBorder(color: secondaryColor, radius: 7),
              child: Column(
                children: [
                  SfDataGrid(
                    source: employeeDataSource(),
                    columnWidthMode: ColumnWidthMode.fill,
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'id',
                          label: Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: const Text('ID', overflow: TextOverflow.ellipsis)
                          )
                      ),
                      GridColumn(
                          columnName: 'name',
                          label: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: const Text('Name', overflow: TextOverflow.ellipsis)
                          )
                      ),
                      GridColumn(
                          columnName: 'designation',
                          label: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: const Text(
                                'Designation',
                                overflow: TextOverflow.ellipsis,
                              )
                          )
                      ),
                      GridColumn(
                          columnName: 'salary',
                          label: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: const Text('Salary', overflow: TextOverflow.ellipsis)
                          )
                      ),
                    ],

                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 50, right: 50),
                    padding: EdgeInsets.only(left: 150, right: 150),
                    height: 60,
                    //color: secondaryColor,
                    child: SfDataPager(
                      pageCount: (getEmployeeData().length / 10).ceilToDouble(),
                      delegate: employeeDataSource(),
                      direction: Axis.horizontal,
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}

