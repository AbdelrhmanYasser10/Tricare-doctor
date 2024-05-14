import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:tricares_doctor_app/features/profits/models/profits_model.dart';

class ProfitsDataSource extends DataGridSource {
  ProfitsDataSource({required List<PartnersOrders> profits}) {
    _profits = profits
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: int.parse(e.pARTORDID!)),
      DataGridCell<String>(columnName: 'Date', value: e.partordDate),
      DataGridCell<String>(
          columnName: 'Amount', value: e.partordAmount),
      DataGridCell<String>(columnName: 'Taxes', value: e.partordTaxes),
      DataGridCell<String>(columnName: 'Taxes Total', value: e.partordTaxesTotal),
      DataGridCell<String>(columnName: 'Final Profit', value: e.partordTotal),
      DataGridCell<String>(columnName: 'Paid Amount', value: e.partordPaid),
      DataGridCell<String>(columnName: 'Remaining Amount', value: e.partordRemaining),
      DataGridCell<String>(columnName: 'Notes', value: e.partordNotes == ''?'-':e.partordNotes),
      DataGridCell<String>(columnName: 'Currency', value: e.currencyName),
      DataGridCell<String>(columnName: 'status', value: e.status),
    ]))
        .toList();
  }

  List<DataGridRow>  _profits = [];

  @override
  List<DataGridRow> get rows =>  _profits;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: Colors.blueGrey.shade100,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Center(
            child: Text(
                dataGridCell.value.toString(),
              style: GoogleFonts.cairo(
                color:Colors.black,
                fontWeight: FontWeight.w500,
                fontSize : 18,
              ),
            ),
          );
        }).toList());
  }
}