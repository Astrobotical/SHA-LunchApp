import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/Models/InvoiceModel.dart';
import 'package:hla/StateData/bloc/FoodGalore/cubit/invoices_cubit.dart';
import 'package:hla/general/Parent.dart';

class Requestinvoice extends StatefulWidget {
  const Requestinvoice({super.key});

  @override
  State<Requestinvoice> createState() => _RequestinvoiceState();
}

class _RequestinvoiceState extends State<Requestinvoice> {
  late final FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final methodobj = context.read<InvoicesCubit>();
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            // Navigator.pushNamed(context, '/');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Parent()));
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
              child: Text(
                'Recent Lunch Menus',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
              child: Text(
                'The Most Recent Lunch menus',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                child: /*Text("checkingresponse"),
                  onPressed: () {
                    methodobj.getInvoices();
                  },
                )
                */
                /*
                BlocBuilder<InvoicesCubit, InvoicesState>(
                builder: (context, state) {
                  /*
                  if(state is InvoiceRefresh){

                  }
                  */
                  return FutureBuilder(
                      future: methodobj.getInvoices(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              /*
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 570,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Invoice ID#: ',
                                                        style: TextStyle(color: Colors.blue),
                                                      ),
                                                      TextSpan(
                                                        text: "invoice.InvoiceID",
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'Mon. July 3rd',
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                                  child: Text("invoice.Status", textAlign: TextAlign.end, style: TextStyle(fontSize: 18, color: Colors.green)),
                                                ),
                                                InkWell(
                                                  onTap: (){

                                                  },
                                                  child:
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                                    child: Container(
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        color: Colors.orange,
                                                        borderRadius: BorderRadius.circular(12),
                                                        border: Border.all(
                                                          color: Colors.green,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment: AlignmentDirectional(0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                          child: Text('Request Invoice',
                                                              style: TextStyle(color: Colors.white)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ]),
                                  ),
                                ),
                              );
*/
                                _invoices(
                                  index: index,
                                  invoice: snapshot.data![index],
                                  fToast: fToast);
                            });
                      }

                  );
                  */

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 570,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Invoice ID#: ',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                          TextSpan(
                                            text: "655a44fa",
                                            style: TextStyle(
                                              fontSize: 15  ,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                      child: Text(
                                        'Tue. Nov. 21',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                      child: Text("In Progress",
                                          textAlign: TextAlign.end,
                                          style:
                                          TextStyle(fontSize: 18, color: Colors.green)),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        methodobj.requestinvoice("655a44faf26d8649e68f08ff38001");
                                        _showSuccess();
                                      },
                                      child:
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                        child: Container(
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.green,
                                              width: 2,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(0.00, 0.00),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                              child: Text('Request Invoice',
                                                  style: TextStyle(color: Colors.white)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            ]),
                      ),
                    ),
                  )
                )]
                ),
        ),
      );
  }
  _showSuccess() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("The Invoice was sent! "),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }
}

class _invoices extends StatelessWidget {
  const _invoices(
      {required this.index,
      required this.invoice,
      required this.fToast});
  final InvoiceModel invoice;
  final int index;
  final FToast fToast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 570,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Invoice ID#: ',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: invoice.InvoiceID,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Mon. July 3rd',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Text(invoice.Status,
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(fontSize: 18, color: Colors.green)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Text('Request Invoice',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ]),
        ),
      ),
    );
  }
}
