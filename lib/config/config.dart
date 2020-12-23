import 'package:postgres/postgres.dart';

void main(List<String> arguments) async{
  final connect = PostgreSQLConnection("10.0.2.2", 5432, "siup", username: 'postgres', password: 'root');
  await connect.open();

  // print('Connected to Postgres database..');

  // await connect.close();
}
