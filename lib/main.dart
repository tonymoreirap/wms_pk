import 'package:flutter/material.dart';
import 'package:wms_pk/teste.dart';
import 'package:intl/intl.dart';
import 'package:wms_pk/teste2.dart';
import 'dart:convert';

import 'Confirma_Pk.dart';
import 'Login.dart';
import 'Picking.dart';
import 'Picking_Destino.dart';
import 'Rotina.dart';


void main (){



  runApp(MaterialApp(
    //home: Teste(),
    //home: Confirma_Pk(),
    //home: Picking_Destino(),
    //home: Login(),
    //home: Rotina(),
    home: Picking(),
    debugShowCheckedModeBanner: false,
  ));
}