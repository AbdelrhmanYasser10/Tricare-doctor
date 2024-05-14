import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:tricares_doctor_app/core/component/ElevatedButton%20Widget/build_elevated_button.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/core/globle/color/shared_color.dart';
import 'package:tricares_doctor_app/features/profits/models/profits_model.dart';
import 'package:tricares_doctor_app/features/profits/screens/profit_details_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/profits_data_source.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TableGridView extends StatefulWidget {
  final List<PartnersOrders> profits;
  const TableGridView({
    Key? key,
    required this.profits,
  }) : super(key: key);

  @override
  State<TableGridView> createState() => _TableGridViewState();
}

class _TableGridViewState extends State<TableGridView> {
  late ProfitsDataSource profitsDataSource;
  @override
  void initState() {
    super.initState();

    profitsDataSource = ProfitsDataSource(profits: widget.profits);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profits Table'),
        ),
        floatingActionButton: Tooltip(
          message: "Add new order",
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColor.primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: SfDataGridTheme(
            data: SfDataGridThemeData(
              headerColor: AppColor.primaryColor,
              gridLineColor: Colors.blueGrey.shade400,
              indentColumnWidth: 4,
              rowHoverTextStyle: Theme.of(context).textTheme.titleSmall,
            ),
            child: SfDataGrid(
              source: profitsDataSource,
              allowColumnsResizing: true,
              onCellTap: (details) {
                var value = profitsDataSource[details.rowColumnIndex.rowIndex - 1];
                navigateTo(context, ProfitsDetailsScreen(profitId: value.getCells().first.value));
              },
              columns: [
                gridColumnWidget(
                    title:'ID',
                    width: width
                ),
                gridColumnWidget(
                    title:'Date',
                    width: width
                ),
                gridColumnWidget(
                    title:'Amount',
                    width: width
                ),
                gridColumnWidget(
                    title:'Taxes',
                    width: width
                ),
                gridColumnWidget(
                    title:'Taxes Total',
                    width: width
                ),
                gridColumnWidget(
                    title:'Profit',
                    width: width
                ),
                gridColumnWidget(
                    title:'Paid',
                    width: width
                ),
                gridColumnWidget(
                    title:'Remaining',
                    width: width
                ),
                gridColumnWidget(
                    title:'Notes',
                    width: width
                ),
                gridColumnWidget(
                    title:'Currency',
                    width: width
                ),
                gridColumnWidget(
                  title:'Status',
                  width: width
                ),
              ],
            ),
          ),
        ),
    );
  }

  GridColumn gridColumnWidget({required String title,required double width}){
    return GridColumn(
      columnName: title,
      minimumWidth: width / 3,
      label: labelWidget(
          title: title
      ),
    );
  }
  Widget labelWidget({required String title}) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
